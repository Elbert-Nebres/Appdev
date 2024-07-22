import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_username == 'name' && _password == 'password') {
        // Navigate to the home page (product page) on successful login
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.blue, // Blue color for AppBar
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with specified size
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 485, // Set the width of the image
              height: 250, // Set the height of the image
              child: Image.asset(
                'assets/background.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay content
          Center(
            child: Container(
              width: 300.0,
              padding: const EdgeInsets.all(35.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // Semi-transparent background
                border: Border.all(width: 2.0, color: Colors.blue), // Blue border
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Text('Username'),
                        const SizedBox(width: 16.0),
                        Flexible(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                            onSaved: (value) => _username = value!,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Text('Password'),
                        const SizedBox(width: 16.0),
                        Flexible(
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value!,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Blue color for ElevatedButton
                        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0),
                        textStyle: const TextStyle(fontSize: 18.0),
                      ),
                      child: const Text('Login', style: TextStyle(color: Colors.white)), // White text color
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
