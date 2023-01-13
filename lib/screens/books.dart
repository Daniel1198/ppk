import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkp/screens/chapter.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
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
                'Livres du Prophète',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Tapez votre recherche...',
                      hintStyle: const TextStyle(fontSize: 14),
                      suffixIcon: const Icon(CupertinoIcons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      filled: true,
                      fillColor: Colors.grey.shade100),
                ),
                SizedBox(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.amber.withOpacity(0.1),
                          elevation: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(7),
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const ChapterScreen()));
                              },
                              title: Text(
                                'Kacou ${index + 1}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo),
                              ),
                              subtitle: const Text(
                                'Thèmes traités dans le livre',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              // leading: const Text('📚'),
                              trailing: GestureDetector(
                                child: const Icon(
                                  Icons.download,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            )),
      ],
    );
  }
}
