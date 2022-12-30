import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkp/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Icon(
              CupertinoIcons.book_circle,
              size: 80,
              color: Colors.brown,
            ),
          ),
          Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Text(
                'Livre du Prophète Kacou Philippe.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(color: Colors.black26, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
