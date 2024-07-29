import 'package:flutter/material.dart';
import 'fruit_shop.dart';
import 'vegetable_shop.dart';
import 'canned_goods_shop.dart';
import 'condiments_shop.dart';
import 'login_page.dart';
import 'cashier_dashboard.dart';
import 'product.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      title: 'Online Point of Sales System',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
        '/cashier_dashboard': (context) => CashierDashboard(),
      },
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

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content:
              Text('Are you sure you want to delete this item from the cart?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                if (itemToDelete != null) {
                  setState(() {
                    cartItems.clear();
                    total = 0.0;
                    totalWeight = 0.0;
                    payment = 0.0;
                    change = 0.0;
                    currentInput = '';
                    numpadController.text = currentInput;
                    itemToDelete = null;
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

void addWeightToTotal(double weight, String itemName) {
  setState(() {
    double pricePerUnit = itemPrices[itemName] ?? 0.0;
    if (weight <= 0) return;
    double currentWeight = cartItems[itemName] ?? 0.0;
    double previousTotal = total;

    cartItems[itemName] = currentWeight + weight;

    totalWeight += weight;
    total += pricePerUnit * weight;

    print('Item: $itemName');
    print('Price per unit: $pricePerUnit');
    print('Weight added: $weight');
    print('New Total Weight: $totalWeight');
    print('Previous Total: $previousTotal');
    print('New Total: $total');
  });
}

void addToCart(String item) {
  setState(() {
    double pricePerUnit = itemPrices[item] ?? 0.0;
    cartItems[item] = (cartItems[item] ?? 0) + 1;
    total += pricePerUnit;
    itemToDelete = item;
  });
}


void removeFromCart(String item) {
  setState(() {
    if (cartItems.containsKey(item)) {
      double weight = cartItems[item]!;
      double pricePerUnit = itemPrices[item] ?? 0.0;
      double previousTotal = total;

      total -= pricePerUnit * weight;
      totalWeight -= weight;
      cartItems.remove(item);

      print('Item Removed: $item');
      print('Price per unit: $pricePerUnit');
      print('Weight removed: $weight');
      print('New Total Weight: $totalWeight');
      print('Previous Total: $previousTotal');
      print('New Total: $total');
    }
  });
}


void handleNumpadInput(String input) {
  setState(() {
    if (input == 'Delete') {
      _showDeleteConfirmationDialog();
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
            title: Text('Cash Payment'),
            content: SingleChildScrollView( // Make content scrollable
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total: Php ${total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Payment: Php ${payment.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Change: Php ${change.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  _buildCartItemsList(), // This should already be scrollable
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    cartItems.clear();
                    total = 0.0;
                    totalWeight = 0.0;
                    payment = 0.0;
                    change = 0.0;
                    currentInput = '';
                    numpadController.text = currentInput;
                  });
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
            content: SingleChildScrollView( // Make content scrollable
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 400,
                    height: 350,
                    child: Image.asset('assets/gcash.JFIF'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Total: Php ${total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  _buildCartItemsList(), // This should already be scrollable
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    cartItems.clear();
                    total = 0.0;
                    totalWeight = 0.0;
                    payment = 0.0;
                    change = 0.0;
                    currentInput = '';
                    numpadController.text = currentInput;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (input == '<=') {
      if (currentInput.isNotEmpty) {
        currentInput = currentInput.substring(0, currentInput.length - 1);
        numpadController.text = currentInput;
      }
    } else {
      currentInput += input;
      numpadController.text = currentInput;
    }
  });
}


Widget _buildCartItemsList() {
  return Container(
    height: 200.0, // Set a fixed height for the scrollable area
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cartItems.entries.map((entry) {
          String itemName = entry.key;
          double weight = entry.value;
          double pricePerUnit = itemPrices[itemName] ?? 0.0;
          double totalValue = pricePerUnit * weight;

          String displayText =
              '$itemName - Qty: ${weight.toStringAsFixed(2)}, Value: Php ${totalValue.toStringAsFixed(2)}';

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              displayText,
              style: TextStyle(fontSize: 16),
            ),
          );
        }).toList(),
      ),
    ),
  );
}


  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CashierDashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Online Point of Sales System'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: _onButtonPressed,
          ),
          SizedBox(width: 16.0),
        ],
      ),
      body: Container(
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
                    SizedBox(width: 7.0),
                    _buildCategoryButton('Fruit', showFruitShop),
                    SizedBox(width: 7.0),
                    _buildCategoryButton('Canned Goods', showCannedGoodsShop),
                    SizedBox(width: 7.0),
                    _buildCategoryButton('Condiments', showCondimentsShop),
                    SizedBox(width: 7.0),
                  ],
                ),
              ],
            ),
          ),
          // Right side with cart display area
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: CartDisplay(
                        cartItems: cartItems,
                        total: total,
                        totalWeight: totalWeight,
                        payment: payment,
                        change: change,
                        removeFromCart: removeFromCart, // Pass the removeFromCart function
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
                        // Numpad visibility toggle
                        Visibility(
                          visible: isNumpadVisible,
                          child: Column(
                            children: [
                              // Display current input
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Current Input: $currentInput',
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                                ),
                              ),
                              _buildKeypadAndActions(), // Ensure this is defined
                            ],
                          ),
                        ),
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
    ),
  );
}




  Widget _getShopWidget() {
    switch (selectedCategory) {
      case 'Fruit':
        return FruitShop(
          cartItems: cartItems,
          addWeightToTotal: addWeightToTotal, // Matches the signature
        );
      case 'Vegetable':
        return VegetableShop(
          cartItems: cartItems,
          addWeightToTotal: addWeightToTotal, // Matches the signature
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

  Widget _buildKeypadAndActions() {
    return Column(
      children: <Widget>[
        _buildKeypadRow(['7', '8', '9']),
        SizedBox(height: 4.0), // Reduced size
        _buildKeypadRow(['4', '5', '6']),
        SizedBox(height: 4.0), // Reduced size
        _buildKeypadRow(['1', '2', '3']),
        SizedBox(height: 4.0), // Reduced size
        _buildKeypadRow(['0', '.', '<=']),
        SizedBox(height: 4.0), // Reduced size
        _buildKeypadRow(['Delete', 'Enter']),
        SizedBox(height: 4.0), // Reduced size
        _buildActionRow(['Cash', 'G-cash'], [Colors.white, Colors.white]),
      ],
    );
  }

 Widget _buildKeypadRow(List<String> keys) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: keys.map((key) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(2.0), // Reduced padding
          child: ElevatedButton(
            onPressed: () => handleNumpadInput(key),
            child: Text(
              key,
              style: TextStyle(fontSize: 16, color: Colors.black), // Font color
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.0), backgroundColor: Colors.white, // Reduced padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0)), // Reduced radius
              ), // Background color
            ),
          ),
        ),
      );
    }).toList(),
  );
}


  Widget _buildActionRow(List<String> actions, [List<Color>? colors]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(actions.length, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(2.0), // Reduced padding
            child: ElevatedButton(
              onPressed: () => handleNumpadInput(actions[index]),
              style: ElevatedButton.styleFrom(
                backgroundColor: colors?[index] ?? Colors.black, // Button color
                padding: EdgeInsets.symmetric(vertical: 12.0), // Reduced padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)), // Reduced radius
                ),
              ),
              child: Text(actions[index], style: TextStyle(fontSize: 16,color: Colors.black)), // Reduced font size
            ),
          ),
        );
      }),
    );
  }
}

class KeypadButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  KeypadButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238), // Background color
        foregroundColor: Colors.black, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        elevation: 2,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final Color? color;
  final VoidCallback onPressed;

  ActionButton({required this.label, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.grey[200], // Background color
        foregroundColor: Colors.black, // Text color
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        elevation: 2,
      ),
    );
  }
}

class CartDisplay extends StatelessWidget {
  final Map<String, double> cartItems; // Store weights as double
  final double total;
  final double totalWeight;
  final double payment;
  final double change;
  final void Function(String) removeFromCart; // Function to remove items from cart

  CartDisplay({
    required this.cartItems,
    required this.total,
    required this.totalWeight,
    required this.payment,
    required this.change,
    required this.removeFromCart, // Initialize the removeFromCart function
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

              if (weight == 0.0) return Container(); // Skip items with 0 weight

              return ListTile(
                title: Text(item),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${weight.toStringAsFixed(2)}'),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeFromCart(item), // Call remove function
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