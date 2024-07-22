import 'package:flutter/material.dart';

class CashierDashboard extends StatelessWidget {
  final Key key; // Add a final field for the key

  CashierDashboard({required this.key}); // Add a constructor with the required key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashier Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to Cashier Dashboard!'),
      ),
    );
  }
}