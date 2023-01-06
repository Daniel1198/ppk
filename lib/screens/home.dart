import 'dart:ui';

import 'package:country_flags/country_flags.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drop_down_list/drop_down_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedLanguage = 'fr';
  List<SelectedListItem> languages = [
    SelectedListItem(name: 'Français', value: 'fr', isSelected: true),
    SelectedListItem(name: 'Espagnol', value: 'es', isSelected: false),
    SelectedListItem(name: 'Anglais', value: 'gb', isSelected: false),
    SelectedListItem(name: 'Allemand', value: 'de', isSelected: false),
  ];

  void selectLanguage() {
    DropDownState(DropDown(
            bottomSheetTitle: Text(
              'Langue',
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            selectedItems: (selectedItem) {
              for (var item in selectedItem) {
                if (item is SelectedListItem) {
                  setState(() {
                    selectedLanguage = item.value!;
                  });
                }
              }
            },
            data: languages))
        .showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: const Border(bottom: BorderSide(color: Colors.black12)),
          iconTheme: const IconThemeData(color: Colors.black54),
          title: Text(
            'Prophète Kacou Philippe',
            style: GoogleFonts.montserrat(
                color: Colors.black54,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Icon(
              CupertinoIcons.book_circle,
              color: Colors.blueGrey,
              size: 35,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minWidth: 15,
                onPressed: () {
                  selectLanguage();
                },
                child: SizedBox(
                  width: 25,
                  child: CountryFlags.flag(selectedLanguage),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minWidth: 15,
                  onPressed: () {},
                  child: const Icon(Icons.share)),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 300,
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('images/background.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.brown.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  const Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Image(image: AssetImage('images/profile.png')),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            'Alexandre Mohamed',
                            style: GoogleFonts.montserrat(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          )
                        ],
                      )),
                  Positioned(
                      bottom: 25,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Column(
                          children: [
                            Text(
                              'Auteur du livre le succès réside dans la connaissance de Dieu.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  color: Colors.black54, fontSize: 11),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            '_____ Voir la biographie _____',
                            style: GoogleFonts.inter(color: Colors.blueGrey),
                          )
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '📚 Livres du prophète',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                        MaterialButton(
                            minWidth: 30,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: (() {}),
                            child: const Text(
                              'Voir tout >',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 12),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.3,
                        ),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, index) {
                          return MaterialButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: Material(
                                    elevation: 3,
                                    child: Image(
                                      image: AssetImage('images/cover.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '__ Livre ${index + 1} __',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.blueGrey),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
