import 'dart:ui';

import 'package:country_flags/country_flags.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:pkp/screens/books.dart';

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
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/back.jpg'), fit: BoxFit.cover)),
        ),
        Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'PKP App',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              leading: const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(
                  CupertinoIcons.book_circle,
                  color: Colors.white,
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
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minWidth: 15,
                      onPressed: () {},
                      child: const Icon(
                        Icons.share,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async {},
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
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
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(20)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        const Center(
                          child: Material(
                            shape: CircleBorder(),
                            elevation: 3,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Image(
                                    image: AssetImage('images/profile.png')),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 52,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                Text(
                                  'Prophète Kacou Philippe',
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
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
                                  style: GoogleFonts.inter(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      mainAxisSpacing: 15,
                      scrollDirection: Axis.horizontal,
                      children: [
                        MaterialButton(
                          padding: const EdgeInsets.all(10),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: const [
                              SizedBox(
                                child: Image(
                                  image: AssetImage('images/song-lyrics.png'),
                                  width: 50,
                                ),
                              ),
                              Text(
                                'Cantiques & Louanges',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(10),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: const [
                              SizedBox(
                                child: Image(
                                  image: AssetImage('images/people.png'),
                                  width: 50,
                                ),
                              ),
                              Text(
                                'Serviteurs fidèles',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(10),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: const [
                              SizedBox(
                                child: Image(
                                  image: AssetImage('images/contacts.png'),
                                  width: 50,
                                ),
                              ),
                              Text(
                                'Contacts par pays',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
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
                                '📚 Livres du Prophète',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              MaterialButton(
                                  minWidth: 30,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  onPressed: (() {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const BooksScreen()));
                                  }),
                                  child: const Text(
                                    'Voir tout >',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1.3,
                              ),
                              itemCount: 5,
                              itemBuilder: (BuildContext context, index) {
                                return MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        width: 90,
                                        child: Material(
                                          elevation: 3,
                                          child: Image(
                                            image:
                                                AssetImage('images/cover.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Kacou ${index + 1}',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 200,
                    color: Colors.blueGrey.shade300,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '🎥 Interviews du Prophète',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              MaterialButton(
                                  minWidth: 30,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  onPressed: (() {}),
                                  child: const Text(
                                    'Voir tout >',
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1, mainAxisSpacing: 1),
                              itemCount: 5,
                              itemBuilder: (BuildContext context, index) {
                                return MaterialButton(
                                  onPressed: () {},
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 120,
                                            child: Image(
                                              image: AssetImage(
                                                  'images/background.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '__ InterView ${index + 1} __',
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 120,
                                        color: Colors.black.withOpacity(0.5),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.play_circle,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '📸 Photos',
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
                                  color: Colors.indigo,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, index) {
                          return MaterialButton(
                            padding: const EdgeInsets.all(7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {},
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('images/background.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '💬 Témoignages',
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
                                  color: Colors.indigo,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, index) {
                          return const ListTile(
                            leading: CircleAvatar(),
                            title: Text(
                              'My name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  fontSize: 12),
                            ),
                            subtitle: Text(
                                'Je veux suivre le Christ, lui donner entièrement ma vie.'),
                          );
                        }),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
