import 'package:flutter/material.dart';
import 'package:uts_v3422023_fatkhul/profile.dart';
import 'package:uts_v3422023_fatkhul/home_screen.dart';
import 'package:uts_v3422023_fatkhul/favorit.dart'; // Import FavoritePage class

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // Tambahkan aksi yang sesuai untuk tombol Home
              // Contoh: Navigator.pushReplacement untuk berpindah ke halaman Home
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Icon(
              Icons.home,
              color: Color(0xFF64B5F6),
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {
              // Tambahkan aksi yang sesuai untuk tombol Favorite
              // Contoh: Navigator.push untuk berpindah ke halaman FavoritePage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage()),
              );
            },
            child: Icon(
              Icons.favorite_outline,
              color: Color(0xFF64B5F6),
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Icon(
              Icons.person,
              color: Color(0xFF64B5F6),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
