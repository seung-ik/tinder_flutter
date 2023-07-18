import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_new/data/db/entity/app_user.dart';
import 'package:tinder_new/data/provider/user_provider.dart';
import 'package:tinder_new/ui/screens/chat_screen.dart';
import 'package:tinder_new/ui/widgets/portrait.dart';
import 'package:tinder_new/ui/widgets/rounded_button.dart';
import 'package:tinder_new/ui/widgets/rounded_outlined_button.dart';
import 'package:tinder_new/util/utils.dart';

class MatchedScreen extends StatelessWidget {
  static const String id = 'matched_screen';

  final String myProfilePhotoPath;
  final String myUserId;
  final String otherUserProfilePhotoPath;
  final String otherUserId;

  const MatchedScreen(
      {super.key, required this.myProfilePhotoPath, required this.myUserId, required this.otherUserProfilePhotoPath, required this.otherUserId});

  void sendMessagePressed(BuildContext context) async {
    AppUser? user = await Provider.of<UserProvider>(context, listen: false).user;

    if (context.mounted) {
      Navigator.pop(context);
      Navigator.pushNamed(context, ChatScreen.id, arguments: {
        "chat_id": compareAndCombineIds(myUserId, otherUserId),
        "user_id": user!.id,
        "other_user_id": otherUserId,
      });
    }
  }

  void keepSwipingPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 42.0,
            horizontal: 18.0,
          ),
          margin: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('images/tinder_icon.png', width: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Portrait(imageUrl: myProfilePhotoPath), Portrait(imageUrl: otherUserProfilePhotoPath)],
              ),
              Column(
                children: [
                  ElevatedButton(
                    child: const Text('SEND MESSAGE'),
                    onPressed: () {
                      sendMessagePressed(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      child: const Text('KEEP SWIPING'),
                      onPressed: () {
                        keepSwipingPressed(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
