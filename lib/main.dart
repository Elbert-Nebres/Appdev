import 'package:flutter/material.dart';
import 'fruit_shop.dart';
import 'vegetable_shop.dart';
import 'canned_goods_shop.dart';
import 'condiments_shop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shop Management System'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCategory = '';
  Map<String, double> cartItems = {};
  double total = 0.0;
  double totalWeight = 0.0;
  TextEditingController numpadController = TextEditingController();
  double payment = 0.0;
  double change = 0.0;
  bool isNumpadVisible = false;
  String currentInput = '';
  String? itemToDelete;

  void showFruitShop() {
    setState(() {
      selectedCategory = 'Fruit';
    });
  }

  void showVegetableShop() {
    setState(() {
      selectedCategory = 'Vegetable';
    });
  }

  void showCannedGoodsShop() {
    setState(() {
      selectedCategory = 'Canned Goods';
    });
  }

  void showCondimentsShop() {
    setState(() {
      selectedCategory = 'Condiments';
    });
  }

  void addWeightToTotal(double weight, String itemName) {
    setState(() {
      cartItems[itemName] = weight.toDouble();
      totalWeight += weight;
      total += 20.0 * weight; // Adjust price logic if needed
      itemToDelete = itemName; // Set itemToDelete to the last added item
    });
  }

  void addToCart(String item) {
    setState(() {
      cartItems[item] = (cartItems[item] ?? 0) + 1;
      total += 20.0; // Adjust based on your item's price logic
      itemToDelete = item; // Set itemToDelete to the last added item
    });
  }

  void removeFromCart(String item) {
    setState(() {
      if (cartItems.containsKey(item)) {
        total -= cartItems[item]! * 20.0; // Adjust based on item price logic
        totalWeight -= cartItems[item]!;
        cartItems.remove(item);
      }
    });
  }

  void handleNumpadInput(String input) {
    setState(() {
      if (input == 'DEL' || input == 'Delete') {
        // Clear entire cart logic
        cartItems.clear(); // Assuming cartItems is a Map
        total = 0.0;
        totalWeight = 0.0; // Reset total weight
        payment = 0.0;
        currentInput = '';
        numpadController.clear();
      } else if (input == 'Enter') {
        payment = double.tryParse(currentInput) ?? 0.0;
        change = payment - total;
      } else if (input == 'Cash') {
        payment = double.tryParse(currentInput) ?? 0.0;
        change = payment - total;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Change'),
              content: Text('Change: Php ${change.toStringAsFixed(2)}'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else if (input == 'G-cash') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('G-Cash Payment'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 300, // Adjust the width as needed
                    height: 150, // Adjust the height as needed
                    child: Image.asset('assets/gcash.jpg'), // Adjust path if needed
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Total: Php ${total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        currentInput += input;
        numpadController.text = currentInput;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: _getShopWidget(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCategoryButton('Vegetable', showVegetableShop),
                    SizedBox(width: 8.0),
                    _buildCategoryButton('Fruit', showFruitShop),
                    SizedBox(width: 8.0),
                    _buildCategoryButton('Canned Goods', showCannedGoodsShop),
                    SizedBox(width: 8.0),
                    _buildCategoryButton('Condiments', showCondimentsShop),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: CartDisplay(
                        cartItems: cartItems,
                        total: total,
                        totalWeight: totalWeight,
                        payment: payment,
                        change: change,
                        onRemoveItem: removeFromCart, 
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: <Widget>[
                        if (isNumpadVisible)
                          SizedBox(
                            height: 300, // Fixed height for numpad container
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Current Input: $currentInput',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        _buildNumpad(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isNumpadVisible = !isNumpadVisible; // Toggle numpad visibility
                            });
                          },
                          child: Text(isNumpadVisible ? 'Hide Numpad' : 'Show Numpad'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getShopWidget() {
    switch (selectedCategory) {
      case 'Fruit':
        return FruitShop(
          cartItems: cartItems,
          addWeightToTotal: addWeightToTotal,
        );
      case 'Vegetable':
        return VegetableShop(
          cartItems: cartItems,
          addWeightToTotal: addWeightToTotal,
        );
      case 'Canned Goods':
        return CannedGoodsShop(
          cartItems: cartItems,
          addToCart: addToCart,
          removeFromCart: removeFromCart,
        );
      case 'Condiments':
        return CondimentsShop(
          cartItems: cartItems,
          addToCart: addToCart,
          removeFromCart: removeFromCart,
        );
      default:
        return Container();
    }
  }

  Widget _buildCategoryButton(String label, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label, textAlign: TextAlign.center),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent, // Background color
          foregroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          elevation: 4,
        ),
      ),
    );
  }

  Widget _buildNumpad() {
    return Column(
      children: [
        _buildKeypadRow(['7', '8', '9']),
        SizedBox(height: 8.0),
        _buildKeypadRow(['4', '5', '6']),
        SizedBox(height: 8.0),
        _buildKeypadRow(['1', '2', '3']),
        SizedBox(height: 8.0),
        _buildKeypadRow(['0', '00', '.']),
        SizedBox(height: 8.0),
        _buildKeypadRow(['DEL', 'Enter']),
        SizedBox(height: 8.0),
        _buildActionRow(['Cash'], [Colors.green, Colors.red]),
        SizedBox(height: 8.0),
        _buildActionRow(['G-cash']),
      ],
    );
  }

  Widget _buildKeypadRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        return SizedBox(
          width: 60, // Adjust width as needed
          height: 60, // Adjust height as needed
          child: KeypadButton(
            label: key,
            onPressed: () => handleNumpadInput(key),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActionRow(List<String> labels, [List<Color>? colors]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.asMap().entries.map((entry) {
        int index = entry.key;
        String label = entry.value;
        Color color = colors?[index] ?? Colors.blueAccent;

        return SizedBox(
          width: 60, // Adjust width as needed
          height: 60, // Adjust height as needed
          child: ElevatedButton(
            onPressed: () => handleNumpadInput(label),
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              padding: EdgeInsets.all(16.0),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class KeypadButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  KeypadButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: Colors.black), // Text color
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Background color
          foregroundColor: Colors.black, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: EdgeInsets.all(16.0), // Adjust padding as needed
        ),
      ),
    );
  }
}

class CartDisplay extends StatelessWidget {
  final Map<String, double> cartItems;
  final double total;
  final double totalWeight;
  final double payment;
  final double change;
  final Function(String) onRemoveItem;

  CartDisplay({
    required this.cartItems,
    required this.total,
    required this.totalWeight,
    required this.payment,
    required this.change,
    required this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              String item = cartItems.keys.elementAt(index);
              double weight = cartItems[item] ?? 0.0;

              if (weight == 0) return Container(); // Skip items with 0 weight

              return ListTile(
                title: Text(item),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${weight.toStringAsFixed(2)} kg'),
                    SizedBox(width: 10), // Spacing between text and button
                    IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () => onRemoveItem(item),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Total: Php ${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Payment: Php ${payment.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
