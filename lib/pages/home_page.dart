import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  final posterList = const <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_menu_doa.png',
                                    ),
                                    Text("Doa Dan Dzikir"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_menu_video_kajian.png',
                                    ),
                                    Text("Video Kajian"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_menu_jadwal_sholat.png',
                                    ),
                                    Text("Jadwal Sholat"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 10,
                          ),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/ic_menu_zakat.png',
                                    ),
                                    Text("Zakat"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
