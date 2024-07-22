
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
      crossAxisCount: 3,
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
        CannedGoodsCard(
  title: 'Alaska Evaporada',
  price: 30.0, // Example price for Alaska Evaporada
  image: 'assets/alaska_evaporada.webp',
  quantity: cartItems['Alaska Evaporada'] ?? 0.0,
  addToCart: () => addToCart('Alaska Evaporada'),
  removeFromCart: () => removeFromCart('Alaska Evaporada'),
),

CannedGoodsCard(
  title: 'Argentina Corned Beef',
  price: 45.0, // Example price for Argentina Corned Beef
  image: 'assets/Argentina_corned_beef.png',
  quantity: cartItems['Argentina Corned Beef'] ?? 0.0,
  addToCart: () => addToCart('Argentina Corned Beef'),
  removeFromCart: () => removeFromCart('Argentina Corned Beef'),
),

CannedGoodsCard(
  title: 'Del Monte Fruit and Cocktail',
  price: 40.0, // Example price for Del Monte Fruit and Cocktail
  image: 'assets/delmonte_fruit_and_cocktail_83g.png',
  quantity: cartItems['Del Monte Fruit and Cocktail'] ?? 0.0,
  addToCart: () => addToCart('Del Monte Fruit and Cocktail'),
  removeFromCart: () => removeFromCart('Del Monte Fruit and Cocktail'),
),

CannedGoodsCard(
  title: 'Jolly Whole Corn Kernels',
  price: 20.0, // Example price for Jolly Whole Corn Kernels
  image: 'assets/jolly_whole_corn_kernels.webp',
  quantity: cartItems['Jolly Whole Corn Kernels'] ?? 0.0,
  addToCart: () => addToCart('Jolly Whole Corn Kernels'),
  removeFromCart: () => removeFromCart('Jolly Whole Corn Kernels'),
),

CannedGoodsCard(
  title: 'Mega Sardines Chili',
  price: 15.0, // Example price for Mega Sardines Chili
  image: 'assets/Mega_sardines_chili.webp',
  quantity: cartItems['Mega Sardines Chili'] ?? 0.0,
  addToCart: () => addToCart('Mega Sardines Chili'),
  removeFromCart: () => removeFromCart('Mega Sardines Chili'),
),

CannedGoodsCard(
  title: 'Reno Liver Spread',
  price: 50.0, // Example price for Reno Liver Spread
  image: 'assets/reno_liver_spread_230g.png',
  quantity: cartItems['Reno Liver Spread'] ?? 0.0,
  addToCart: () => addToCart('Reno Liver Spread'),
  removeFromCart: () => removeFromCart('Reno Liver Spread'),
),

CannedGoodsCard(
  title: 'Alaska Condensada',
  price: 35.0, // Example price for Alaska Condensada
  image: 'assets/alaska_condensada.webp',
  quantity: cartItems['Alaska Condensada'] ?? 0.0,
  addToCart: () => addToCart('Alaska Condensada'),
  removeFromCart: () => removeFromCart('Alaska Condensada'),
),

CannedGoodsCard(
  title: 'Argentina Meatloaf',
  price: 55.0, // Example price for Argentina Meatloaf
  image: 'assets/argentina_meatloaf.png',
  quantity: cartItems['Argentina Meatloaf'] ?? 0.0,
  addToCart: () => addToCart('Argentina Meatloaf'),
  removeFromCart: () => removeFromCart('Argentina Meatloaf'),
),

CannedGoodsCard(
  title: 'Del Monte Pineapple Tidbits',
  price: 28.0, // Example price for Del Monte Pineapple Tidbits
  image: 'assets/delmonte_pineapple_tidbits.png',
  quantity: cartItems['Del Monte Pineapple Tidbits'] ?? 0.0,
  addToCart: () => addToCart('Del Monte Pineapple Tidbits'),
  removeFromCart: () => removeFromCart('Del Monte Pineapple Tidbits'),
),

CannedGoodsCard(
  title: 'Jolly Cream Corn Sweet',
  price: 18.0, // Example price for Jolly Cream Corn Sweet
  image: 'assets/Jolly_cream_corn_sweet_425g.webp',
  quantity: cartItems['Jolly Cream Corn Sweet'] ?? 0.0,
  addToCart: () => addToCart('Jolly Cream Corn Sweet'),
  removeFromCart: () => removeFromCart('Jolly Cream Corn Sweet'),
),

CannedGoodsCard(
  title: 'Jolly Mushroom Pieces and Stem',
  price: 22.0, // Example price for Jolly Mushroom Pieces and Stem
  image: 'assets/Jolly_Mushroom_pieces_and_stem_156g.jpg',
  quantity: cartItems['Jolly Mushroom Pieces and Stem'] ?? 0.0,
  addToCart: () => addToCart('Jolly Mushroom Pieces and Stem'),
  removeFromCart: () => removeFromCart('Jolly Mushroom Pieces and Stem'),
),

CannedGoodsCard(
  title: 'Libby Vienna Sausage',
  price: 10.0, // Example price for Libby Vienna Sausage
  image: 'assets/Libby_Vienna_Sausage.webp',
  quantity: cartItems['Libby Vienna Sausage'] ?? 0.0,
  addToCart: () => addToCart('Libby Vienna Sausage'),
  removeFromCart: () => removeFromCart('Libby Vienna Sausage'),
),

CannedGoodsCard(
  title: 'Maling Meatloaf',
  price: 40.0, // Example price for Maling Meatloaf
  image: 'assets/maling_meatloaf.png',
  quantity: cartItems['Maling Meatloaf'] ?? 0.0,
  addToCart: () => addToCart('Maling Meatloaf'),
  removeFromCart: () => removeFromCart('Maling Meatloaf'),
),

CannedGoodsCard(
  title: 'Mega Sardines Tomato Sauce',
  price: 17.0, // Example price for Mega Sardines Tomato Sauce
  image: 'assets/mega_sardines_tomato_sauce.png',
  quantity: cartItems['Mega Sardines Tomato Sauce'] ?? 0.0,
  addToCart: () => addToCart('Mega Sardines Tomato Sauce'),
  removeFromCart: () => removeFromCart('Mega Sardines Tomato Sauce'),
),

CannedGoodsCard(
  title: 'San Marino Corned Tuna',
  price: 60.0, // Example price for San Marino Corned Tuna
  image: 'assets/san_marino_corned_tuna_180g.png',
  quantity: cartItems['San Marino Corned Tuna'] ?? 0.0,
  addToCart: () => addToCart('San Marino Corned Tuna'),
  removeFromCart: () => removeFromCart('San Marino Corned Tuna'),
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
            height: 50,
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
