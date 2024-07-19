import 'package:flutter/material.dart';

class CannedGoodsShop extends StatelessWidget {
  final Map<String, double> cartItems;
  final Function(String) addToCart;
  final Function(String) removeFromCart;

  CannedGoodsShop({
    required this.cartItems,
    required this.addToCart,
    required this.removeFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        CannedGoodsCard(
          title: 'Beans',
          price: 25.0,
          image: 'assets/beans.jpg',
          quantity: cartItems['Beans'] ?? 0.0, // Using double for quantity
          addToCart: () => addToCart('Beans'),
          removeFromCart: () => removeFromCart('Beans'),
        ),
        CannedGoodsCard(
          title: 'Corn',
          price: 30.0,
          image: 'assets/corn.jpg',
          quantity: cartItems['Corn'] ?? 0.0, // Using double for quantity
          addToCart: () => addToCart('Corn'),
          removeFromCart: () => removeFromCart('Corn'),
        ),
        CannedGoodsCard(
          title: 'Evaporated Milk',
          price: 28.0,
          image: 'assets/alaska_evaporada.webp',
          quantity: cartItems['Evaporated Milk'] ?? 0.0,
          addToCart: () => addToCart('Evaporated Milk'),
          removeFromCart: () => removeFromCart('Evaporated Milk'),
        ),
        CannedGoodsCard(
          title: 'Corned Beef',
          price: 35.0,
          image: 'assets/Argentina_corned_beef.png',
          quantity: cartItems['Corned Beef'] ?? 0.0,
          addToCart: () => addToCart('Corned Beef'),
          removeFromCart: () => removeFromCart('Corned Beef'),
        ),
        CannedGoodsCard(
          title: 'Fruit Cocktail',
          price: 32.0,
          image: 'assets/delmonte_fruit_and_cocktail_83g.png',
          quantity: cartItems['Fruit Cocktail'] ?? 0.0,
          addToCart: () => addToCart('Fruit Cocktail'),
          removeFromCart: () => removeFromCart('Fruit Cocktail'),
        ),
        CannedGoodsCard(
          title: 'Whole Corn Kernels',
          price: 27.0,
          image: 'assets/jolly_whole_corn_kernels.webp',
          quantity: cartItems['Whole Corn Kernels'] ?? 0.0,
          addToCart: () => addToCart('Whole Corn Kernels'),
          removeFromCart: () => removeFromCart('Whole Corn Kernels'),
        ),
        CannedGoodsCard(
          title: 'Mega Sardines (Chili)',
          price: 29.0,
          image: 'assets/Mega_sardines_chili.webp',
          quantity: cartItems['Mega Sardines (Chili)'] ?? 0.0,
          addToCart: () => addToCart('Mega Sardines (Chili)'),
          removeFromCart: () => removeFromCart('Mega Sardines (Chili)'),
        ),
        CannedGoodsCard(
          title: 'Liver Spread',
          price: 26.0,
          image: 'assets/reno_liver_spread_230g.png',
          quantity: cartItems['Liver Spread'] ?? 0.0,
          addToCart: () => addToCart('Liver Spread'),
          removeFromCart: () => removeFromCart('Liver Spread'),
        ),
      ],
    );
  }
}

class CannedGoodsCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final double quantity; // Changed to double
  final VoidCallback addToCart;
  final VoidCallback removeFromCart;

  CannedGoodsCard({
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
          Text('Php ${price.toStringAsFixed(2)}'),
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
