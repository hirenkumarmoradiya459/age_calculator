import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:age_calculator/Screen/planet_age_screen.dart';
import 'package:age_calculator/Screen/next_birthday_countdown.dart';
import 'package:age_calculator/Screen/age_calculator.dart';
import 'package:age_calculator/Screen/age_compare.dart';
import 'package:age_calculator/Screen/zodiac_sign.dart';
import 'package:age_calculator/Screen/age_stats.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:age_calculator/Screen/theme_controller.dart';
import 'package:age_calculator/Screen/splash_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurple,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final ThemeController _themeController = Get.put(ThemeController());
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<void> _handleRefresh() async{
  return await Future.delayed(Duration(seconds: 2));
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0.0,
          title: Text('Age Metrics'),
          actions: [
            IconButton(
              icon: Obx(() => _themeController.isDarkMode.value
                  ? Icon(Icons.wb_sunny)
                  : Icon(Icons.nightlight_round)),
              onPressed: () {
                _themeController.toggleTheme(); // Toggle the theme
              },
            ),
          ],
        ),
        body: LiquidPullToRefresh(
          onRefresh: _handleRefresh,
          color: Color(0xff006B7F),
          height: 100,
          backgroundColor: Color(0xffE2E2E2),
          animSpeedFactor: 1,
          // springAnimationDurationInMilliseconds: 1,
          showChildOpacityTransition: false,
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>AgeCalculatorScreen(),transition: Transition.zoom);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AgeCalculatorScreen()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff4CAF50),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff4CAF50).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Age Calculator',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Calculate your age accurately!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>NextBirthdayScreen(),transition: Transition.zoom);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => NextBirthdayScreen()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffFFC107),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffFFC107).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cake,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Next Birthday Countdown',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Calculate birthday countdown!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>PlanetAgeCalculatorScreen(),transition: Transition.zoom);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => PlanetAgeCalculatorScreen()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff9C27B0),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff9C27B0).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidMoon,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Planet Age Calculator',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Calculate your age on different planets!',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>ZodiacSignScreen(),transition: Transition.zoom);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ZodiacSignScreen()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffE91E63),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffE91E63).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.fish,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Zodiac Sign',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Discover Your Zodiac Sign',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>AgeStatsScreen(),transition: Transition.zoom);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AgeStatsScreen()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff4285F4),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff4285F4).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.chartLine,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Age Stat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Visualize Your Age Journey',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.snackbar("🚀 Exciting New Feature", "We're working hard on bringing you an amazing new feature. Stay tuned for updates!",snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.black,colorText: Colors.white,margin: EdgeInsets.all(10));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AgeStatsScreen()),
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffE2E2E2),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffE2E2E2).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // FaIcon(
                          //   FontAwesomeIcons.chartLine,
                          //   color: Colors.white,
                          //   size: 32,
                          // ),
                          SizedBox(height: 6),
                          Text(
                            'Cooming Soon!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          // Text(
                          //   'see which Zodiac Sign fit for you!',
                          //   style: TextStyle(
                          //     color: Colors.white.withOpacity(0.8),
                          //     fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
