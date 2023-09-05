import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PlanetAgeCalculatorScreen extends StatefulWidget {
  @override
  _PlanetAgeCalculatorScreenState createState() =>
      _PlanetAgeCalculatorScreenState();
}

class _PlanetAgeCalculatorScreenState extends State<PlanetAgeCalculatorScreen> {
  TextEditingController _earthAgeController = TextEditingController();
  Map<String, double> _planetRelativeAges = {
    'Mercury': 0.2408467,
    'Venus': 0.61519726,
    'Mars': 1.8808158,
    'Jupiter': 11.862615,
    'Saturn': 29.447498,
    'Uranus': 84.016846,
    'Neptune': 164.79132,
  };

  Map<String, double> _calculatedAges = {};

  void _calculateAges(double earthAge) {
    _planetRelativeAges.forEach((planet, orbitalPeriod) {
      _calculatedAges[planet] = earthAge / orbitalPeriod;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9C27B0),
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Planet Age Calculator')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Lottie.asset('assets/a1.json', width: 400, height: 400),
            TextField(
              controller: _earthAgeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Earth Age'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double earthAge = double.tryParse(_earthAgeController.text) ?? 0.0;
                _calculateAges(earthAge);
                setState(() {});
              },
              child: Text('Calculate'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _calculatedAges.length,
              itemBuilder: (context, index) {
                String planet = _calculatedAges.keys.elementAt(index);
                double age = _calculatedAges[planet] ?? 0.0;
                return ListTile(
                  title: Text('$planet Age'),
                  subtitle: Text(age.toStringAsFixed(2)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}