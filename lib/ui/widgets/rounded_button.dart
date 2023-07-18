import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const RoundedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        // disabledColor: kAccentColor.withOpacity(0.25),
        // padding: EdgeInsets.symmetric(vertical: 14),
        // highlightElevation: 0,
        // elevation: 0,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(text, style: Theme.of(context).textTheme.button),
        onPressed: () {},
      ),
    );
  }
}
