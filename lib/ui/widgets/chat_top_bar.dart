import 'package:flutter/material.dart';
import 'package:tinder_new/data/db/entity/app_user.dart';
import 'package:tinder_new/util/constants.dart';

class ChatTopBar extends StatelessWidget {
  final AppUser user;

  const ChatTopBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kAccentColor, width: 1.0),
              ),
              child: CircleAvatar(radius: 22, backgroundImage: NetworkImage(user.profilePhotoPath)),
            )
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}
