import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ZodiacSignScreen extends StatefulWidget {
  @override
  _ZodiacSignScreenState createState() => _ZodiacSignScreenState();
}

class _ZodiacSignScreenState extends State<ZodiacSignScreen> {
  DateTime selectedBirthdate = DateTime.now();
  String zodiacSign = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE91E63),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Zodiac Sign Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset('assets/a2.json',width: 400,height: 400,),
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
                ? ZodiacSignDisplay(
              birthdate: selectedBirthdate,
              zodiacSign: zodiacSign,
            )
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
        zodiacSign = calculateZodiacSign(selectedBirthdate);
      });
    }
  }

  String calculateZodiacSign(DateTime birthdate) {
    if ((birthdate.month == 3 && birthdate.day >= 21) || (birthdate.month == 4 && birthdate.day <= 19)) {
      return 'Aries';
    } else if ((birthdate.month == 4 && birthdate.day >= 20) || (birthdate.month == 5 && birthdate.day <= 20)) {
      return 'Taurus';
    } else if ((birthdate.month == 5 && birthdate.day >= 21) || (birthdate.month == 6 && birthdate.day <= 20)) {
      return 'Gemini';
    } else if ((birthdate.month == 6 && birthdate.day >= 21) || (birthdate.month == 7 && birthdate.day <= 22)) {
      return 'Cancer';
    } else if ((birthdate.month == 7 && birthdate.day >= 23) || (birthdate.month == 8 && birthdate.day <= 22)) {
      return 'Leo';
    } else if ((birthdate.month == 8 && birthdate.day >= 23) || (birthdate.month == 9 && birthdate.day <= 22)) {
      return 'Virgo';
    } else if ((birthdate.month == 9 && birthdate.day >= 23) || (birthdate.month == 10 && birthdate.day <= 22)) {
      return 'Libra';
    } else if ((birthdate.month == 10 && birthdate.day >= 23) || (birthdate.month == 11 && birthdate.day <= 21)) {
      return 'Scorpio';
    } else if ((birthdate.month == 11 && birthdate.day >= 22) || (birthdate.month == 12 && birthdate.day <= 21)) {
      return 'Sagittarius';
    } else if ((birthdate.month == 12 && birthdate.day >= 22) || (birthdate.month == 1 && birthdate.day <= 19)) {
      return 'Capricorn';
    } else if ((birthdate.month == 1 && birthdate.day >= 20) || (birthdate.month == 2 && birthdate.day <= 18)) {
      return 'Aquarius';
    } else {
      return 'Pisces';
    }
  }
}

class ZodiacSignDisplay extends StatelessWidget {
  final DateTime birthdate;
  final String zodiacSign;

  ZodiacSignDisplay({required this.birthdate, required this.zodiacSign});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Zodiac Sign:',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          zodiacSign,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}