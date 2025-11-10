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
  int _currentIndex = 0;

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
          children: [_menuBuildGridsection(), _buildCarouselSection()],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String iconPath, String title, String rootName) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 35),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'monserrat',
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuBuildGridsection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildMenuItem('assets/images/ic_menu_doa.png', 'Doa Harian', '/doa'),
          _buildMenuItem(
            'assets/images/ic_menu_jadwal_sholat.png',
            'Jadwal Sholat',
            '/jadwal_sholat',
          ),
          _buildMenuItem(
            'assets/images/ic_menu_video_kajian.png',
            'Video Kajian',
            '/video_kajian',
          ),
          _buildMenuItem(
            'assets/images/ic_menu_zakat.png',
            'Transaksi Zakat',
            '/transfer_zakat',
          ),
        ],
      ),
    );
  }

  // ============== widget carousel section ================
  Widget _buildCarouselSection() {
    return Column(
      children: [
        SizedBox(height: 10),
        CarouselSlider.builder(
          itemCount: posterList.length,
          itemBuilder: (context, Index, realIndex) {
            final poster = posterList[Index];
            return Container(
              margin: EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  poster,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            height: 350,
            enlargeCenterPage: true,
            viewportFraction: 0.7,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),
        // DOT INDIKATOR
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: posterList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _currentIndex.animateToPage(entry.key),
              child: Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: _currentIndex == entry.key
                      ? Colors.yellow[300]
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

extension on int {
  void animateToPage(int key) {}
}
