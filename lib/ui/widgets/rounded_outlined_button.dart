import 'package:flutter/material.dart';
import 'package:tinder_new/util/constants.dart';

class RoundedOutlinedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const RoundedOutlinedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            //highlightedBorderColor: kAccentColor,
            side: const BorderSide(color: kSecondaryColor, width: 2.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: onPressed.call(),
          child: Text(text, style: Theme.of(context).textTheme.button),
        ));
  }
}
