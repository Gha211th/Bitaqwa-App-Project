import 'package:flutter/material.dart';
import 'dart:async'; // Times coutdown
import 'package:carousel_slider/carousel_slider.dart'; // carousel slider
import 'package:geolocator/geolocator.dart'; // gps
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart'; //izin handler
import 'package:intl/intl.dart'; // formater number
import 'package:shared_preferences/shared_preferences.dart'; // cache local
import 'package:http/http.dart' as http; //ambil data API json
import 'package:string_similarity/string_similarity.dart'; //fuzzy match string
import 'dart:convert'; //decode json

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final CarouselController _controller = CarouselController();
  final _currentIndex = 0;

  final posterList = const <String>[
    'assets/images/ramadan.jpg',
    'assets/images/idul_adha.jpg',
    'assets/images/idul_fitri.jpg',
  ];

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
                  color: Colors.yellow[400],
                  borderRadius: BorderRadius.circular(10),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselSection() {
    return Column(
      children: [
        SizedBox(width: 10),
        CarouselSlider.builder(
          itemCount: posterList.length,
          itemBuilder: itemBuilder,
          options: opstions,
        ),
      ],
    );
  }
}
