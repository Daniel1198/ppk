import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({super.key});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/back.jpg'), fit: BoxFit.cover)),
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Kacou 1 : C\'est ici la voix de Mathieu',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
