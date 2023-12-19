import 'package:flutter/material.dart';
import 'package:uts_v3422023_fatkhul/home_screen.dart';
import 'register.dart'; // Assuming you have a register.dart file for navigation.

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.black),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                enabledBorder: _outlineInputBorder,
                focusedBorder: _outlineInputBorder,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                enabledBorder: _outlineInputBorder,
                focusedBorder: _outlineInputBorder,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Authentication logic
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Simple validation
                if (username == 'admin' && password == 'password') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login berhasil!'),
                      duration: Duration(seconds: 2),
                    ),
                  );

                
                  // Navigasi ke halaman HomeScreen setelah login berhasil
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login gagal!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            Text('New User? Create Account'),
            TextButton(
              onPressed: () {
                // Navigasi ke halaman pendaftaran (RegisterPage)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterPage()), // Assuming RegisterPage exists
                );
              },
              child: Text('Register'), // Add text for the button
            ),
          ],
        ),
      ),
    );
  }
}