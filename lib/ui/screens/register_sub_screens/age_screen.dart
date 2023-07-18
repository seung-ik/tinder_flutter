import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeScreen extends StatefulWidget {
  final Function(num) onChanged;

  const AgeScreen({super.key, required this.onChanged});

  @override
  AgeScreenState createState() => AgeScreenState();
}

class AgeScreenState extends State<AgeScreen> {
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'age is',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: NumberPicker(
              itemWidth: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                value: age,
                minValue: 0,
                maxValue: 120,
                onChanged: (value) => {
                      setState(() {
                        age = value;
                      }),
                      widget.onChanged(value)
                    }),
          ),
        ),
      ],
    );
  }
}
