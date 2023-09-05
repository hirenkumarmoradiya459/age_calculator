import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class AgeStatsScreen extends StatefulWidget {
  @override
  _AgeStatsScreenState createState() => _AgeStatsScreenState();
}

class _AgeStatsScreenState extends State<AgeStatsScreen> {
  DateTime selectedBirthdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4285F4),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Age Stats'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset('assets/a3.json',width: 300,height: 300,),
            Text(
              'Select Your Birthdate:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _selectBirthdate(context);
              },
              child: Text('Select Birthdate'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
            ),
            SizedBox(height: 20),
            selectedBirthdate != null
                ? AgeStatsDisplay(birthdate: selectedBirthdate)
                : Container(),
          ],
        ),
      ),
    );
  }

  Future<void> _selectBirthdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedBirthdate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedBirthdate) {
      setState(() {
        selectedBirthdate = picked;
      });
    }
  }
}

class AgeStatsDisplay extends StatelessWidget {
  final DateTime birthdate;

  AgeStatsDisplay({required this.birthdate});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final age = now.year - birthdate.year;
    final leapYears = calculateLeapYears(birthdate.year, now.year);
    final daysLived = now.difference(birthdate).inDays;
    final hoursLived = daysLived * 24;

    return Column(
      children: [
        Text(
          'Age: $age years',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          'Leap Years: $leapYears',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          'Days Lived: $daysLived days',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          'Hours Lived: $hoursLived hours',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  int calculateLeapYears(int startYear, int endYear) {
    int leapYearCount = 0;
    for (int year = startYear; year <= endYear; year++) {
      if (year % 4 == 0) {
        if (year % 100 != 0 || (year % 100 == 0 && year % 400 == 0)) {
          leapYearCount++;
        }
      }
    }
    return leapYearCount;
  }
}