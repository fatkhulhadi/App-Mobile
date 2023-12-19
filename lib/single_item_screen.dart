import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
import 'package:uts_v3422023_fatkhul/favorit.dart';

class SingleItemScreen extends StatefulWidget {
  final String img;

  SingleItemScreen(this.img);

  @override
  _SingleItemScreenState createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Image.asset(
                    "assets/${widget.img}.png",
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kost Putri",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(height: 10),
                      _locationAndAddress(
                        locationIcon: Icons.location_on,
                        addressText: "Jl. Contoh No. 123, Kota Contoh",
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.img,
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "500.000,00",
                        style: TextStyle(
                          color: Colors.black.withOpacity(1),
                          letterSpacing: 3,
                          fontSize: 20,
                        ),
                      ),
                      _contactBy(
                        color: const Color.fromRGBO(76, 175, 80, 1),
                        fct: () {
                          openWhatsAppChat();
                        },
                        icon: FontAwesomeIcons.whatsapp,
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: isFavorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_outline),
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  void openWhatsAppChat () async {
    String phoneNumber = '+62 857-3069-9511';
    var url = 'https://wa.me/+62 857-3069-9511?text=HelloWorld';
    await launch(url);
  }

  Widget _contactBy({Color? color, required Function() fct, IconData? icon}) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 30,
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: fct,
          child: Text(
            "Whatsapp",
            style: TextStyle(
              color: color,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _locationAndAddress({required IconData locationIcon, required String addressText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              locationIcon,
              color: Colors.blue,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              "Location:",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            addressText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteProvider extends ChangeNotifier {
  List<String> favoriteItems = [];

  void addFavoriteItem(String item) {
    favoriteItems.add(item);
    notifyListeners();
  }

  void removeFavoriteItem(String item) {
    favoriteItems.remove(item);
    notifyListeners();
  }
}
