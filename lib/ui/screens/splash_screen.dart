import 'package:flutter/material.dart';
import 'package:tinder_new/ui/screens/start_screen.dart';
import 'package:tinder_new/ui/screens/top_navigation_screen.dart';
import 'package:tinder_new/util/constants.dart';
import 'package:tinder_new/util/shared_preferences_utils.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkIfUserExists();
  }

  Future<void> checkIfUserExists() async {
    String? userId = await SharedPreferencesUtil.getUserId();
    if (context.mounted) {
      Navigator.pop(context);
      if (userId != null) {
        Navigator.pushNamed(context, TopNavigationScreen.id);
      } else {
        Navigator.pushNamed(context, StartScreen.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: kDefaultPadding,
          child: Container(),
        ),
      ),
    );
  }
}
