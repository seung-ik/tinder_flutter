import 'package:flutter/material.dart';
import 'package:tinder_new/data/db/entity/app_user.dart';
import 'package:tinder_new/ui/widgets/rounded_icon_button.dart';
import 'package:tinder_new/util/constants.dart';

class SwipeCard extends StatefulWidget {
  final AppUser person;

  const SwipeCard({super.key, required this.person});

  @override
  SwipeCardState createState() => SwipeCardState();
}

class SwipeCardState extends State<SwipeCard> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.725,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.network(widget.person.profilePhotoPath, fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Padding(
                  padding:
                      showInfo ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4) : const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: getUserContent(context)),
              showInfo ? getBottomInfo() : Container(),
            ],
          ),
        ),
      ],
    );
  }

  Widget getUserContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: widget.person.name,
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                TextSpan(text: '  ${widget.person.age}', style: const TextStyle(fontSize: 20)),
              ],
            )),
          ],
        ),
        RoundedIconButton(
          onPressed: () {
            setState(() {
              showInfo = !showInfo;
            });
          },
          iconData: showInfo ? Icons.arrow_downward : Icons.person,
          iconSize: 16,
          buttonColor: kColorPrimaryVariant,
        ),
      ],
    );
  }

  Widget getBottomInfo() {
    return Column(
      children: [
        const Divider(
          color: kAccentColor,
          thickness: 1.5,
          height: 0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: Colors.black.withOpacity(.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Opacity(
                  opacity: 0.8,
                  child: Text(
                    widget.person.bio.isNotEmpty ? widget.person.bio : "No bio.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
