import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlogin/detail/detailbarang.dart';
// import 'package:flutterlogin/detail/detailbarang.dart';
import 'get_barang.dart';
import 'package:http/http.dart' as http;

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future<List<Barang>> postsFuture = getPosts();
  static Future<List<Barang>> getPosts() async {
    // var url1 = Uri.parse("https://tracerstmikdnbs.my.id/flutter/get_data.php");
    var url2 = Uri.parse("http://localhost:8000/api/barang");
    // var url3 = Uri.parse("http://localhost/login_api/data");
    final response =
        await http.get(url2, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Barang.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.amberAccent,
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1), () {
          setState(() {
            FutureBuilder<List<Barang>>(
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
                  // if no data, show simple Text
                  return const Text("No data available");
                }
              },
            );
          });
        });
      },
      child: Center(
        child: FutureBuilder<List<Barang>>(
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
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }
}

Widget buildPosts(List<Barang> posts) {
  // ListView Builder to show data in a list
  return Padding(
    padding: const EdgeInsets.only(right: 15, left: 15),
    child: ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Container(
          color: const Color.fromARGB(255, 251, 216, 154),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 60,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(flex: 1, child: Text(post.id_brg)),
              const VerticalDivider(
                color: Colors.black,
              ),
              const Padding(padding: EdgeInsets.only(left: 15)),
              Expanded(flex: 4, child: Text(post.nama_brg)),
              const VerticalDivider(
                color: Colors.black,
              ),
              Expanded(
                  flex: 3,
                  child: Text(post.harga.toString(), textAlign: TextAlign.end)),
              const VerticalDivider(
                color: Colors.black,
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    post.stock.toString(),
                    textAlign: TextAlign.end,
                  )),
              const VerticalDivider(
                color: Colors.black,
              ),
              Center(
                child: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: () {
                          AlertDialog alert = AlertDialog(
                            title: const Text(
                              'Ubah',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            content:
                                Text('Ubah data barang : ${post.nama_brg}'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Edit'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailBarangPage(text: post.id_brg),
                                    ),
                                  );
                                },
                              ),
                              TextButton(
                                child: const Text('Batal'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                        value: post.id_brg,
                        child: const Text('Ubah'),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          AlertDialog alert = AlertDialog(
                            title: const Text(
                              'Hapus',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            content:
                                Text('Hapus barang dengan ID : ${post.id_brg}'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Hapus'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Batal'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                        value: post.id_brg,
                        child: const Text('Hapus'),
                      )
                    ];
                  },
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget buildPosts2(List<Barang> posts) {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Center(
          child: Table(
            border: TableBorder.all(
              width: 1.0,
              color: Colors.black,
            ),
            children: [
              const TableRow(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('ID',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Nama Barang',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Harga',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Stock',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
              TableRow(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(post.id_brg),
                      Text(post.nama_brg),
                      Text(post.harga.toString()),
                      Text(post.stock.toString()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
  // return Padding(
  //   padding: const EdgeInsets.all(25),
  //   child: Table(
  //     border: TableBorder.all(
  //       width: 1.0,
  //       color: Colors.black,
  //     ),
  //     children: ListView.builder(
  //         itemCount: posts.length,
  //         itemBuilder: (context, index) {
  //           final post = posts[index];
  //         return TableRow(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: <Widget>[
  //                             Text(post.id_brg),
  //                             Text(post.nama_brg),
  //               ],
  //             )
  //           ]
  //         );
  //         },
  //       ),
  //     ),
  // );
}
