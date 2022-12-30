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
  List<Widget> screens = [];
  int currentScreen = 0;
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
        iconTheme: const IconThemeData(color: Colors.black54),
        title: Text(
          'Prophète Kacou Philippe',
          style: GoogleFonts.ubuntu(color: Colors.black87, fontSize: 13),
        ),
        elevation: 1,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(
            CupertinoIcons.book_circle,
            color: Colors.brown,
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: currentScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.music_note), label: 'Cantiques'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.video_camera), label: 'Interviews'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2), label: 'Témoignages'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone_circle), label: 'Contacts'),
        ],
        onTap: ((value) {
          setState(() {
            currentScreen = value;
          });
        }),
      ),
    );
  }
}
