import 'package:clubs_booking/screens/login_screen.dart';
import 'package:clubs_booking/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClubsBooking());
}
class ClubsBooking extends StatelessWidget {
  const ClubsBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'SignupScreen': (context) =>  SignupScreen(),
        'LoginScreen': (context) =>  LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginScreen',
    );
  }
}
