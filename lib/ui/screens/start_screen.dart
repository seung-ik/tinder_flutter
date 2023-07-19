import 'package:flutter/material.dart';
import 'package:tinder_new/util/constants.dart';
import 'package:tinder_new/ui/widgets/app_image_with_text.dart';
import 'package:tinder_new/ui/screens/login_screen.dart';
import 'package:tinder_new/ui/screens/register_screen.dart';

class StartScreen extends StatelessWidget {
  static const String id = 'start_screen';

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: kDefaultPadding,
          child: Container(
            margin: const EdgeInsets.only(bottom: 40, top: 120),
            child: Column(
              children: [
                AppIconTitle(),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Lorel ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Nulla in orci justo. Curabitur ac gravida quam.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(height: 60),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('images/google_logo.png', width:30, height:30, fit: BoxFit.fill ),
                      const Text(
                        'GOOGLE LOGIN',
                        style: TextStyle(fontSize: 20, color:Colors.green),
                      ),
                      Opacity(
                        opacity: 0.0,
                          child: Image.asset('images/google_logo.png', width:20, height:20, fit: BoxFit.fill),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),

                  child: const Text(
                    'EMAIL LOGIN',
                    style: TextStyle(fontSize: 20, color:Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text(
                    'CREATE ACCOUNT',
                    style: TextStyle(fontSize: 20, color:Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
