import 'package:flutter/material.dart';
import 'package:tinder_new/ui/widgets/bordered_text_field.dart';

class SexualScreen extends StatelessWidget {
  final Function(String?) myGenderOnChanged;
  final Function(String?) myWantGenderOnChanged;
  final String? selectedGender;
  final String? selectedWantGender;

  const SexualScreen(
      {super.key, required this.selectedGender,  required this.selectedWantGender, required this.myGenderOnChanged, required this.myWantGenderOnChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '나의 성별',
          style: Theme.of(context).textTheme.headline3,
        ),

        const SizedBox(height: 25),
        Row(
          children: [
            Radio<String?>(
              value: 'male',
              groupValue: selectedGender,
              onChanged: myGenderOnChanged
            ),
            Text('남자'),
            Radio<String?>(
                value: 'female',
                groupValue: selectedGender,
                onChanged: myGenderOnChanged
            ),
            Text('여자'),
          ],
        ),
        Text(
          '찾는 성별',
          style: Theme.of(context).textTheme.headline3,
        ),
        Row(
          children: [
            Radio<String?>(
                value: 'male',
                groupValue: selectedWantGender,
                onChanged: myWantGenderOnChanged
            ),
            Text('남자'),
            Radio<String?>(
              value: 'female',
              groupValue: selectedWantGender,
              onChanged: myWantGenderOnChanged
            ),
            Text('여자'),
          ],
        ),
      ],
    );
  }
}
