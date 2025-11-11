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

  final doa_btn = "assets/images/ic_menu_doa.png";
  final sholat_btn = 'assets/images/ic_menu_jadwal_sholat.png';

  final posterList = const <String>[
    'assets/images/ramadan.jpg',
    'assets/images/idul_adha.jpg',
    'assets/images/idul_fitri.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ======== menu waktu sholat by lokasi ========
              _buildHeroSection(),
              const SizedBox(height: 70),
              // ======== menu waktu sholat by lokasi done ========
              // ======== menu section ========
              _menuBuildGridsection(),
              // ======== menu section done ========
              // ======== carousel section ========
              _buildCarouselSection(),
              // ======== carousel section done========
            ],
          ),
        ),
      ),
    );
  }

  // ======== widget menu item ========
  Widget _buildMenuItem(String iconPath, String title, String routetName) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routetName);
        },
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.amber.withOpacity(0.2),
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
              Image.asset(iconPath, width: 40),
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
      ),
    );
  }

  // ======== widget _buildHeroSection / jadwal sholat by lokasi ========
  Widget _buildHeroSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: Color(0xFFB3E5FC),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/morning.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Assalamualaikum",
                  style: TextStyle(
                    fontFamily: 'poppinsReg',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Ngargoyoso",
                  style: TextStyle(
                    fontFamily: 'poppinsBold',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                Text(
                  DateFormat('HH:MM').format(DateTime.now()),
                  style: TextStyle(
                    fontFamily: 'poppinsBold',
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        // ======== waktu sholat selanjutnya
        Positioned(
          bottom: -100,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            child: Column(
              children: [
                Text(
                  "Waktu sholat berikutnya",
                  style: TextStyle(
                    fontFamily: 'poppinsReg',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'ASHAR',
                  style: TextStyle(
                    fontFamily: 'poppinsBold',
                    fontSize: 20,
                    color: Colors.amber,
                  ),
                ),
                Text(
                  "14:30",
                  style: TextStyle(
                    fontFamily: 'poppinsBold',
                    fontSize: 28,
                    color: Colors.black38,
                  ),
                ),
                Text(
                  "5 jam 10 menit",
                  style: TextStyle(fontFamily: 'poppinsReg'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _menuBuildGridsection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildMenuItem('assets/images/ic_menu_doa.png', 'Doa', '/doa'),
          _buildMenuItem(
            'assets/images/ic_menu_jadwal_sholat.png',
            'Sholat',
            '/jadwal_sholat',
          ),
          _buildMenuItem(
            'assets/images/ic_menu_video_kajian.png',
            'Kajian',
            '/video_kajian',
          ),
          _buildMenuItem(
            'assets/images/ic_menu_zakat.png',
            'Zakat',
            '/transfer_zakat',
          ),
          _buildMenuItem('assets/images/ic_menu_doa.png', 'Khutbah', '/doa'),
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
