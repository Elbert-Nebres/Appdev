import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CashierDashboard(),
  ));
}

class CashierDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Cashier Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Feb 4, 2023',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                    icon: Icons.monetization_on,
                    title: 'Revenue',
                    value: '\$1200.56',
                  ),
                  _buildStatCard(
                    icon: Icons.receipt_long,
                    title: 'Paid orders',
                    value: '198',
                  ),
                  _buildStatCard(
                    icon: Icons.local_offer,
                    title: 'Tip amount',
                    value: '\$186.72',
                  ),
                  _buildStatCard(
                    icon: Icons.shopping_cart,
                    title: 'Dishes sold',
                    value: '227',
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Today\'s upsale',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildUpsaleItem(
                icon: Icons.restaurant,
                title: 'Roast chicken',
                order: 'Order: 120',
              ),
              _buildUpsaleItem(
                icon: Icons.fastfood,
                title: 'Carbonara Paste',
                order: 'Order: 114',
              ),
              _buildUpsaleItem(
                icon: Icons.local_cafe,
                title: 'Fried egg',
                order: 'Order: 98',
              ),
              _buildUpsaleItem(
                icon: Icons.soup_kitchen,
                title: 'Norwegian soup',
                order: 'Order: 82',
              ),
              SizedBox(height: 24),
              Text(
                'Accepted orders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildOrderChart(),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: Colors.white,
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpsaleItem({
    required IconData icon,
    required String title,
    required String order,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 32,
            color: Colors.white,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                order,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderChart() {
    return Container(
      height: 250,
      child: CustomPaint(
        painter: _OrderChartPainter(),
      ),
    );
  }
}

class _OrderChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw grid lines
    final paint = Paint()
      ..color = Colors.grey[700]!
      ..strokeWidth = 1;
    for (int i = 0; i <= 5; i++) {
      canvas.drawLine(
        Offset(0, size.height * (i / 5)),
        Offset(size.width, size.height * (i / 5)),
        paint,
      );
    }
    for (int i = 0; i <= 7; i++) {
      canvas.drawLine(
        Offset(size.width * (i / 7), 0),
        Offset(size.width * (i / 7), size.height),
        paint,
      );
    }

    // Draw chart bars
    final barPaint = Paint()
      ..color = Color(0xFFC0E8FF)
      ..style = PaintingStyle.fill;
    final barWidth = size.width / 7;
    final barData = [
      450,
      300,
      350,
      400,
      350,
      450,
      200,
    ];
    for (int i = 0; i < barData.length; i++) {
      final barHeight = size.height * (barData[i] / 500);
      canvas.drawRect(
        Rect.fromLTWH(
          size.width * (i / 7),
          size.height - barHeight,
          barWidth,
          barHeight,
        ),
        barPaint,
      );
    }

    // Draw labels
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
    );
    final textPaint = TextPainter(
      text: TextSpan(
        text: 'Sun',
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(size.width * (0 / 7), size.height + 10));

    textPaint.text = TextSpan(
      text: 'Mon',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(size.width * (1 / 7), size.height + 10));

    textPaint.text = TextSpan(
      text: 'Tue',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(size.width * (2 / 7), size.height + 10));

    textPaint.text = TextSpan(
      text: 'Wed',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(size.width * (3 / 7), size.height + 10));

    textPaint.text = TextSpan(
      text: 'Thu',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(size.width * (4 / 7), size.height + 10));

    textPaint.text = TextSpan(
      text: 'Fri',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(size.width * (5 / 7), size.height + 10));

    textPaint.text = TextSpan(
      text: 'Sat',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(size.width * (6 / 7), size.height + 10));

    // Draw Y-axis labels
    textPaint.text = TextSpan(
      text: '500',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(0, 0));

    textPaint.text = TextSpan(
      text: '400',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(0, size.height * (1 / 5)));

    textPaint.text = TextSpan(
      text: '300',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(0, size.height * (2 / 5)));

    textPaint.text = TextSpan(
      text: '200',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(0, size.height * (3 / 5)));

    textPaint.text = TextSpan(
      text: '100',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(0, size.height * (4 / 5)));

    textPaint.text = TextSpan(
      text: '0',
      style: textStyle,
    );
    textPaint.layout();
    textPaint.paint(canvas, Offset(0, size.height));
  }

  @override
  bool shouldRepaint(_OrderChartPainter oldDelegate) {
    return false;
  }
}