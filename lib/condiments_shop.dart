
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
      crossAxisCount: 3,
      children: [
        CondimentsCard(
          title: 'Ketchup',
          price: 'Php 20.0',
          image: 'assets/ketchup.png',
          quantity: cartItems['Ketchup'] ?? 0.0, // Using double for quantity
          addToCart: () => addToCart('Ketchup'),
          removeFromCart: () => removeFromCart('Ketchup'),
        ),
        CondimentsCard(
          title: 'Mustard',
          price: 'Php 20.0',
          image: 'assets/mustard.jpg',
          quantity: cartItems['Mustard'] ?? 0.0, // Using double for quantity
          addToCart: () => addToCart('Mustard'),
          removeFromCart: () => removeFromCart('Mustard'),
        ),
        CondimentsCard(
          title: 'Datu Puti Soy Sauce Sachet',
          price: 'Php 10.0',
          image: 'assets/datu_puti_soy_sauce_sachet.webp',
          quantity: cartItems['Datu Puti Soy Sauce Sachet'] ?? 0.0,
          addToCart: () => addToCart('Datu Puti Soy Sauce Sachet'),
          removeFromCart: () => removeFromCart('Datu Puti Soy Sauce Sachet'),
        ),
        CondimentsCard(
          title: 'Mang Tomas 1 Bottle',
          price: 'Php 20.0',
          image: 'assets/mang_tomas_1_bottle.png',
          quantity: cartItems['Mang Tomas 1 Bottle'] ?? 0.0,
          addToCart: () => addToCart('Mang Tomas 1 Bottle'),
          removeFromCart: () => removeFromCart('Mang Tomas 1 Bottle'),
        ),
        CondimentsCard(
          title: 'Toyo Silver Swan 1 Liter',
          price: 'Php 30.0',
          image: 'assets/toyo_silver_swan_1_liter.png',
          quantity: cartItems['Toyo Silver Swan 1 Liter'] ?? 0.0,
          addToCart: () => addToCart('Toyo Silver Swan 1 Liter'),
          removeFromCart: () => removeFromCart('Toyo Silver Swan 1 Liter'),
        ),
        CondimentsCard(
          title: 'UFC Banana Ketchup Sachet',
          price: 'Php 15.0',
          image: 'assets/UFC_banana_ketchup_sachet.png',
          quantity: cartItems['UFC Banana Ketchup Sachet'] ?? 0.0,
          addToCart: () => addToCart('UFC Banana Ketchup Sachet'),
          removeFromCart: () => removeFromCart('UFC Banana Ketchup Sachet'),
        ),
        CondimentsCard(
          title: 'Cocomama Fresh Gata',
          price: 'Php 25.0',
          image: 'assets/cocomama_fresh_gata.webp',
          quantity: cartItems['Cocomama Fresh Gata'] ?? 0.0,
          addToCart: () => addToCart('Cocomama Fresh Gata'),
          removeFromCart: () => removeFromCart('Cocomama Fresh Gata'),
        ),
        CondimentsCard(
          title: 'Datu Puti Vinegar Sachet',
          price: 'Php 5.0',
          image: 'assets/datu_puti_vinegar_sachet.png',
          quantity: cartItems['Datu Puti Vinegar Sachet'] ?? 0.0,
          addToCart: () => addToCart('Datu Puti Vinegar Sachet'),
          removeFromCart: () => removeFromCart('Datu Puti Vinegar Sachet'),
        ),
        CondimentsCard(
          title: 'Datu Puti Vinegar 1L',
          price: 'Php 50.0',
          image: 'assets/datu_puti_vinegar_1L.png',
          quantity: cartItems['Datu Puti Vinegar 1L'] ?? 0.0,
          addToCart: () => addToCart('Datu Puti Vinegar 1L'),
          removeFromCart: () => removeFromCart('Datu Puti Vinegar 1L'),
        ),
        CondimentsCard(
          title: 'Del Monte Filipino Style Tomato Sauce 90g',
          price: 'Php 7.0',
          image: 'assets/delmonte_filipino_style_tomato_sauce_90g.webp',
          quantity: cartItems['Del Monte Filipino Style Tomato Sauce 90g'] ?? 0.0,
          addToCart: () => addToCart('Del Monte Filipino Style Tomato Sauce 90g'),
          removeFromCart: () => removeFromCart('Del Monte Filipino Style Tomato Sauce 90g'),
        ),
        CondimentsCard(
          title: 'Del Monte Filipino Style Tomato Sauce 250g',
          price: 'Php 15.0',
          image: 'assets/delmonte_filipino_style_tomato_sauce_250g.png',
          quantity: cartItems['Del Monte Filipino Style Tomato Sauce 250g'] ?? 0.0,
          addToCart: () => addToCart('Del Monte Filipino Style Tomato Sauce 250g'),
          removeFromCart: () => removeFromCart('Del Monte Filipino Style Tomato Sauce 250g'),
        ),
        CondimentsCard(
          title: 'Heinz Tomato Ketchup',
          price: 'Php 25.0',
          image: 'assets/heinz_tomato_ketchup.webp',
          quantity: cartItems['Heinz Tomato Ketchup'] ?? 0.0,
          addToCart: () => addToCart('Heinz Tomato Ketchup'),
          removeFromCart: () => removeFromCart('Heinz Tomato Ketchup'),
        ),
        CondimentsCard(
          title: 'Jolly Kakang Gata',
          price: 'Php 30.0',
          image: 'assets/jolly_kakang_gata.webp',
          quantity: cartItems['Jolly Kakang Gata'] ?? 0.0,
          addToCart: () => addToCart('Jolly Kakang Gata'),
          removeFromCart: () => removeFromCart('Jolly Kakang Gata'),
        ),
        CondimentsCard(
          title: 'Knorr Seasoning 250ml',
          price: 'Php 12.0',
          image: 'assets/Knorr_Seasoning_250ml.png',
          quantity: cartItems['Knorr Seasoning 250ml'] ?? 0.0,
          addToCart: () => addToCart('Knorr Seasoning 250ml'),
          removeFromCart: () => removeFromCart('Knorr Seasoning 250ml'),
        ),
        CondimentsCard(
          title: 'Knorr Seasoning 1L',
          price: 'Php 40.0',
          image: 'assets/knorr_seasoning_1L.png',
          quantity: cartItems['Knorr Seasoning 1L'] ?? 0.0,
          addToCart: () => addToCart('Knorr Seasoning 1L'),
          removeFromCart: () => removeFromCart('Knorr Seasoning 1L'),
        ),
        CondimentsCard(
          title: 'Maggi Savor Seasoning Calamansi',
          price: 'Php 8.0',
          image: 'assets/maggi_savor_seasoning_Calamansi.png',
          quantity: cartItems['Maggi Savor Seasoning Calamansi'] ?? 0.0,
          addToCart: () => addToCart('Maggi Savor Seasoning Calamansi'),
          removeFromCart: () => removeFromCart('Maggi Savor Seasoning Calamansi'),
        ),
        CondimentsCard(
          title: 'Mamasita Menudo Afritada Mix',
          price: 'Php 18.0',
          image: 'assets/mamasita_menudo_afritada_mix.jpg',
          quantity: cartItems['Mamasita Menudo Afritada Mix'] ?? 0.0,
          addToCart: () => addToCart('Mamasita Menudo Afritada Mix'),
          removeFromCart: () => removeFromCart('Mamasita Menudo Afritada Mix'),
        ),
        CondimentsCard(
          title: 'Mamasita Oyster Sauce',
          price: 'Php 22.0',
          image: 'assets/mamasita_oyster_sauce.webp',
          quantity: cartItems['Mamasita Oyster Sauce'] ?? 0.0,
          addToCart: () => addToCart('Mamasita Oyster Sauce'),
          removeFromCart: () => removeFromCart('Mamasita Oyster Sauce'),
        ),
        CondimentsCard(
          title: 'Mamasita Palabok Mix',
          price: 'Php 25.0',
          image: 'assets/mamasita_palabok_mix.jpg',
          quantity: cartItems['Mamasita Palabok Mix'] ?? 0.0,
          addToCart: () => addToCart('Mamasita Palabok Mix'),
          removeFromCart: () => removeFromCart('Mamasita Palabok Mix'),
        ),
        CondimentsCard(
          title: 'Mamasita Tocino Mix',
          price: 'Php 18.0',
          image: 'assets/mamasita_tocino_mix.png',
          quantity: cartItems['Mamasita Tocino Mix'] ?? 0.0,
          addToCart: () => addToCart('Mamasita Tocino Mix'),
          removeFromCart: () => removeFromCart('Mamasita Tocino Mix'),
        ),
        CondimentsCard(
          title: 'Mang Tomas Siga Anghang Bottle',
          price: 'Php 28.0',
          image: 'assets/mang_tomas_siga_anghang_bottle.png',
          quantity: cartItems['Mang Tomas Siga Anghang Bottle'] ?? 0.0,
          addToCart: () => addToCart('Mang Tomas Siga Anghang Bottle'),
          removeFromCart: () => removeFromCart('Mang Tomas Siga Anghang Bottle'),
        ),
      ],
    );
  }
}

class CondimentsCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final double quantity; // Changed to double
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
            height: 50,
          ),
          Text(title),
          Text(price),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: removeFromCart,
              ),
              Text('${quantity.toStringAsFixed(2)}'), // Display as double
              IconButton(
                icon: Icon(Icons.add),
                onPressed: addToCart,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
