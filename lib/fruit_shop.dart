
import 'package:flutter/material.dart';

class FruitShop extends StatelessWidget {
  final Map<String, double> cartItems;
  final void Function(double, String) addWeightToTotal; // Update to match signature

  FruitShop({required this.cartItems, required this.addWeightToTotal});


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        FruitCard(
          title: 'Orange',
          pricePerKg: 20.0,
          image: 'assets/orange.jpg',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Apple',
          pricePerKg: 20.0,
          image: 'assets/apple.jpg',
          addWeightToTotal: addWeightToTotal,
        ),
            FruitCard(
          title: 'Banana',
          pricePerKg: 20.0,
          image: 'assets/banana.jpg',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Strawberry',
          pricePerKg: 20.0,
          image: 'assets/strawberry.jpg',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Abokado',
          pricePerKg: 25.0,
          image: 'assets/abokado.png',
          addWeightToTotal: addWeightToTotal,
        ),
       
        FruitCard(
          title: 'Apricot',
          pricePerKg: 40.0,
          image: 'assets/Apricot.png',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Peach',
          pricePerKg: 15.0,
          image: 'assets/peach.png',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Cantaloupe',
          pricePerKg: 18.0,
          image: 'assets/cantaloupe.png',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Dates',
          pricePerKg: 22.0,
          image: 'assets/Dates.png',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Demon',
          pricePerKg: 50.0,
          image: 'assets/demon.png',
          addWeightToTotal: addWeightToTotal,
        ),
       
        FruitCard(
          title: 'Kiwi',
          pricePerKg: 35.0,
          image: 'assets/kiwi.jpg',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Lemon',
          pricePerKg: 12.0,
          image: 'assets/lemon.webp',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Mango',
          pricePerKg: 28.0,
          image: 'assets/mango.webp',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Orange',
          pricePerKg: 30.0,
          image: 'assets/orinj.png',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Papaya',
          pricePerKg: 20.0,
          image: 'assets/papaya.webp',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Saba',
          pricePerKg: 15.0,
          image: 'assets/saba.jpg',
          addWeightToTotal: addWeightToTotal,
        ),
        FruitCard(
          title: 'Saging',
          pricePerKg: 18.0,
          image: 'assets/saging.png',
          addWeightToTotal: addWeightToTotal,
        ),
      ],
    );
  }
}

class FruitCard extends StatelessWidget {
  final String title;
  final double pricePerKg;
  final String image;
  final void Function(double, String) addWeightToTotal; // Update signature to match

  FruitCard({
    required this.title,
    required this.pricePerKg,
    required this.image,
    required this.addWeightToTotal,
  });

  void _showWeightEntryPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return WeightEntryPopup(
          onWeightEntered: (double weight) {
            addWeightToTotal(weight, title); // Pass only weight and title
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showWeightEntryPopup(context),
            child: Image.asset(
              image,
              width: 100,
              height: 100,
            ),
          ),
          Text(title),
          Text('Php ${pricePerKg.toStringAsFixed(2)} per/kg'),
        ],
      ),
    );
  }
}


class WeightEntryPopup extends StatefulWidget {
  final void Function(double weight) onWeightEntered;

  WeightEntryPopup({required this.onWeightEntered});

  @override
  _WeightEntryPopupState createState() => _WeightEntryPopupState();
}

class _WeightEntryPopupState extends State<WeightEntryPopup> {
  TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Enter Weight in kg'),
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: 'e.g. 1.5',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              double weight = double.tryParse(_weightController.text) ?? 0;
              widget.onWeightEntered(weight);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
