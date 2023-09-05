import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AgeCompareScreen extends StatefulWidget {
  @override
  _AgeCompareScreenState createState() => _AgeCompareScreenState();
}

class _AgeCompareScreenState extends State<AgeCompareScreen> {
  DateTime _firstDate = DateTime.now();
  DateTime _secondDate = DateTime.now();
  String _ageComparison = '';

  void _calculateAgeComparison() {
    Duration difference = _firstDate.difference(_secondDate);

    int years = (difference.inDays / 365).floor();
    int months = ((difference.inDays % 365) / 30).floor();
    int days = (difference.inDays % 30);

    String comparisonResult = '';

    if (difference.inDays == 0) {
      comparisonResult = 'Both have the same age';
    } else if (difference.isNegative) {
      comparisonResult = 'Second person is older by ';
    } else {
      comparisonResult = 'First person is older by ';
    }

    setState(() {
      _ageComparison = '$comparisonResult $years years, $months months, and $days days.';
    });
  }

  Future<void> _selectFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _firstDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _firstDate) {
      setState(() {
        _firstDate = picked;
      });
    }
  }

  Future<void> _selectSecondDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _secondDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _secondDate) {
      setState(() {
        _secondDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Compare'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectFirstDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Select First Birthdate',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(DateFormat('dd-MM-yyyy').format(_firstDate)),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectSecondDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Select Second Birthdate',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(DateFormat('dd-MM-yyyy').format(_secondDate)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateAgeComparison,
              child: Text('Compare Ages'),
            ),
            SizedBox(height: 16.0),
            Text(
              _ageComparison,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}