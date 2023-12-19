import 'package:flutter/material.dart';
import 'package:uts_v3422023_fatkhul/home_bottom_bar.dart';
import 'package:uts_v3422023_fatkhul/widgets/items_widgets.dart';
import 'package:uts_v3422023_fatkhul/widgets/widgetputri.dart';
import 'package:uts_v3422023_fatkhul/login_page.dart';
import 'package:uts_v3422023_fatkhul/Notifikasi.dart';
import 'package:uts_v3422023_fatkhul/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      },
                      child: Icon(
                        Icons.login,
                        color: Color.fromRGBO(0, 163, 255, 1).withOpacity(0.8),
                        size: 35,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/CahKos.png',
                        width: 150,
                        height: 120,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ));
                      },
                      child: Icon(
                        Icons.notifications_active,
                        color: Color.fromRGBO(0, 163, 255, 1).withOpacity(0.8),
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Temukan kost impianmu",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(0, 163, 255, 1).withOpacity(0.5),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromRGBO(0, 163, 255, 1).withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Color.fromRGBO(63, 78, 86, 1),
                unselectedLabelColor: Colors.black.withOpacity(0.4),
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 5,
                    color: Colors.black,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(text: "Semua"),
                  Tab(
                    text: "Putra",
                    // Remove onTap here
                  ),
                  Tab(
                    text: "Putri",
                    // Remove onTap here
                  ),
                  Tab(text: "Keluarga"),
                ],
              ),
              SizedBox(height: 10),
              // GridView
              ItemsWidget(), // Ubah ini sesuai dengan konten grid yang sesuai dengan indeks tab
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
