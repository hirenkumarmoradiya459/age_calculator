import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class NextBirthdayScreen extends StatefulWidget {
  @override
  _NextBirthdayScreenState createState() => _NextBirthdayScreenState();
}

class _NextBirthdayScreenState extends State<NextBirthdayScreen> {
  DateTime selectedBirthdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFC107),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Next Birthday Countdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset("assets/birthday.json",width: 400,height: 400,),
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
                ? CountdownTimer(birthdate: selectedBirthdate)
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

class CountdownTimer extends StatelessWidget {
  final DateTime birthdate;

  CountdownTimer({required this.birthdate});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final nextBirthday = DateTime(now.year, birthdate.month, birthdate.day);

    if (nextBirthday.isBefore(now)) {
      nextBirthday.add(Duration(days: 365));
    }

    final daysUntilNextBirthday = nextBirthday.difference(now).inDays;

    return Column(
      children: [
        Text(
          'Days Until Next Birthday:',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          '$daysUntilNextBirthday days',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}