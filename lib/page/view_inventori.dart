import 'dart:convert';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
// import 'package:responsive_grid_list/responsive_grid_list.dart';

class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class InventoriPage extends StatefulWidget {
  const InventoriPage({super.key});

  @override
  State<InventoriPage> createState() => _InventoriPageState();
}

class _InventoriPageState extends State<InventoriPage> {
  Future<List<Photo>> postsFuture = getPosts();
  static Future<List<Photo>> getPosts() async {
    // var url1 = Uri.parse("https://tracerstmikdnbs.my.id/flutter/get_data.php");
    var url2 = Uri.parse("http://localhost:8000/api/photos");
    // var url3 = Uri.parse("http://localhost/login_api/data");
    final response =
        await http.get(url2, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Photo.fromJson(e)).toList();
  }

// PULL TO REFRESH
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
      Stream<int>.periodic(const Duration(seconds: 3), (x) => refreshNum);

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(() {
              FutureBuilder<List<Photo>>(
                future: getPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // until data is fetched, show loader
                    return const CircularProgressIndicator(
                      color: Color.fromARGB(255, 134, 122, 13),
                    );
                  } else if (snapshot.hasData) {
                    // once data is fetched, display it on screen (call buildPosts())
                    final posts = snapshot.data!;
                    return buildPosts(posts);
                  } else {
                    return const Text("No data available");
                  }
                },
              );
            });
          },
        );
      },
      child: Center(
        child: FutureBuilder<List<Photo>>(
          future: getPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // until data is fetched, show loader
              return const CircularProgressIndicator(
                color: Color.fromARGB(255, 134, 122, 13),
              );
            } else if (snapshot.hasData) {
              // once data is fetched, display it on screen (call buildPosts())
              final posts = snapshot.data!;
              return buildPosts(posts);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}

Widget buildPosts(List<Photo> posts) {
  return Column(
    children: <Widget>[
      Container(
        height: 30,
        decoration: const BoxDecoration(color: Colors.blueAccent),
        child: const Center(child: Text("Inventori List")),
      ),
      Flexible(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 300,
          ),
          // shrinkWrap: true,
          padding: const EdgeInsets.all(15),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              child: InkWell(
                splashColor: const Color.fromARGB(255, 239, 248, 159),
                onTap: () {
                  print("tapped");
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(192, 239, 239, 239)
                            .withOpacity(0.2),
                        spreadRadius: 4,
                        blurRadius: 12,
                        // offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(children: [
                            Expanded(
                                child: Image.network(post.thumbnailUrl,
                                    fit: BoxFit.fill)),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(child: Text(post.title, maxLines: 2)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Widget buildPosts2(List<Photo> posts) {
  return GridView.builder(
    scrollDirection: Axis.vertical,
    itemCount: posts.length,
    itemBuilder: ((context, index) {
      final post = posts[index];
      return Container(
        color: Colors.grey.shade300,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 100,
        width: double.maxFinite,
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.network(post.thumbnailUrl)),
            Expanded(flex: 2, child: Text(post.title)),
          ],
        ),
      );
    }),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
    ),
  );
}
