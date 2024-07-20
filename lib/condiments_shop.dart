import 'package:flutter/material.dart';

class CondimentsShop extends StatelessWidget {
  final Map<String, double> cartItems;
  final Function(String) addToCart;
  final Function(String) removeFromCart;

  CondimentsShop({
    required this.cartItems,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        CondimentsCard(
          title: 'Ketchup',
          price: 'Php 20.0',
          image: 'assets/ketchup.png',
          quantity: cartItems['Ketchup'] ?? 0.0,
          addToCart: () => addToCart('Ketchup'),
          removeFromCart: () => removeFromCart('Ketchup'),
        ),
        CondimentsCard(
          title: 'Mustard',
          price: 'Php 20.0',
          image: 'assets/mustard.jpg',
          quantity: cartItems['Mustard'] ?? 0.0,
          addToCart: () => addToCart('Mustard'),
          removeFromCart: () => removeFromCart('Mustard'),
        ),
        // Add more CondimentsCard as needed
      ],
    );
  }
}

class CondimentsCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final double quantity;
  final VoidCallback addToCart;
  final VoidCallback removeFromCart;

  CondimentsCard({
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 100,
            height: 100,
          ),
          Text(title),
          Text(price),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  removeFromCart(); // Call removeFromCart here
                },
              ),
              Text('${quantity.toStringAsFixed(2)}'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  addToCart(); // Call addToCart here
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
