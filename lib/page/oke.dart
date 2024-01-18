import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: const BoxDecoration(
              // color: Colors.grey[400],
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2021/09/03/00/51/temple-6594770_1280.jpg'),
                  fit: BoxFit.cover),
            )),
        Transform.translate(
          offset: const Offset(0.0, -120 / 2.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295399_640.png'))),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Nabil Chen',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Director of Sahretech',
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40, // Atur tinggi Container sesuai kebutuhan Anda
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            // Implement your button action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.person_add_alt),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Follow')
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40, // Atur tinggi Container sesuai kebutuhan Anda
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            // Implement your button action here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.message),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Message')
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 40, // Atur tinggi Container sesuai kebutuhan Anda
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            // Implement your button action here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.settings),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Edit')
                            ],
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      children: [
                        Text(
                          '900',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text('Posts'),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.black,
                    ),
                    const Column(
                      children: [
                        Text(
                          '9.204',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text('Followers'),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.black,
                    ),
                    const Column(
                      children: [
                        Text(
                          '300',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text('Following'),
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, item) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16, left: 16, right: 16, bottom: 16),
                        child: Container(
                          height: 140,
                          child: Row(
                            children: [
                              const Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Remembers what user said earlier in the conversation',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Hello everyone, back again at sahretech. On this occasion, we will learn',
                                      style: TextStyle(fontSize: 12),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.bookmark_outline,
                                          size: 23,
                                        ),
                                        Icon(
                                          Icons.share_outlined,
                                          size: 23,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://cdn.pixabay.com/photo/2023/04/02/23/08/ai-generated-7895586_1280.jpg'),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
