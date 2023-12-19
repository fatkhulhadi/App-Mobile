import 'package:flutter/material.dart';
import 'package:uts_v3422023_fatkhul/home_screen.dart';
import 'package:uts_v3422023_fatkhul/login_page.dart';
import 'package:uts_v3422023_fatkhul/register.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CahKos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Mengganti MyHomePage dengan SplashScreen
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menambahkan Future.delayed untuk menahan tampilan selama 5 detik
    Future.delayed(Duration(seconds: 5), () {
      // Navigasi ke halaman HomePage setelah 5 detik
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
              'assets/CahKos.png',
              width: 150,
              height: 120,
               ), // Ganti ini dengan tampilan splash screen yang sesuai
      ),
    );
  }
}