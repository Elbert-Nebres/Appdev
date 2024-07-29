
import 'package:flutter/material.dart';

class VegetableShop extends StatelessWidget {
  final Map<String, double> cartItems;
  final Function(double, String) addWeightToTotal;

  VegetableShop({
    required this.cartItems,
    required this.addWeightToTotal,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        VegetableCard(
          title: 'Bokchoi',
          pricePerKg: 25.0,
          image: 'assets/bokchoi.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Inferior Sibuyas',
          pricePerKg: 10.0,
          image: 'assets/inferior_sibuyas.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Pipino',
          pricePerKg: 18.0,
          image: 'assets/pipino.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Siling labYouPo',
          pricePerKg: 30.0,
          image: 'assets/silly.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Repolyo',
          pricePerKg: 20.0,
          image: 'assets/repolyo.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Talong',
          pricePerKg: 22.0,
          image: 'assets/talong.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Bellpeper Green',
          pricePerKg: 28.0,
          image: 'assets/bellpeper_green.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Red Bellpepper ',
          pricePerKg: 32.0,
          image: 'assets/bellpepper_red.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Bellpepper',
          pricePerKg: 26.0,
          image: 'assets/bellpepper.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Carrot',
          pricePerKg: 15.0,
          image: 'assets/carrot.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Cauli Flower',
          pricePerKg: 18.0,
          image: 'assets/cauli_flower.png',
          addWeightToTotal: addWeightToTotal,
        ),
       
        VegetableCard(
          title: 'Green Onion',
          pricePerKg: 8.0,
          image: 'assets/green_onion.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Kalabasa',
          pricePerKg: 16.0,
          image: 'assets/kalabasa.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Mushroom',
          pricePerKg: 24.0,
          image: 'assets/mushroom.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Okra',
          pricePerKg: 14.0,
          image: 'assets/okra.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Patatas',
          pricePerKg: 12.0,
          image: 'assets/patatas.png',
          addWeightToTotal: addWeightToTotal,
        ),
        VegetableCard(
          title: 'Privelgedged Sibuyas',
          pricePerKg: 10.0,
          image: 'assets/privelgedged_sibuyas.png',
          addWeightToTotal: addWeightToTotal,
        ),
      ],
    );
  }
}

class VegetableCard extends StatelessWidget {
  final String title;
  final double pricePerKg;
  final String image;
  final Function(double, String) addWeightToTotal;

  VegetableCard({
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
            addWeightToTotal(weight, title);
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
          Text(' ${pricePerKg.toStringAsFixed(2)} per/kg'),
        ],
      ),
    );
  }
}

class WeightEntryPopup extends StatefulWidget {
  final Function(double) onWeightEntered;

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Enter Weight (kg)',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              double weight = double.tryParse(_weightController.text) ?? 0.0;
              widget.onWeightEntered(weight);
              Navigator.of(context).pop();
            },
            child: Text('Add to Total'),
          ),
        ],
      ),
    );
  }
}
