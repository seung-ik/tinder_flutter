import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tinder_new/ui/widgets/image_portrait.dart';

class AddPhotoScreen extends StatefulWidget {
  final Function(String) onPhotoChanged;

  const AddPhotoScreen({super.key, required this.onPhotoChanged});

  @override
  AddPhotoScreenState createState() => AddPhotoScreenState();
}

class AddPhotoScreenState extends State<AddPhotoScreen> {
  final picker = ImagePicker();
  String? _imagePath;

  Future pickImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      widget.onPhotoChanged(pickedFile.path);

      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Add photo',
          style: Theme.of(context).textTheme.headline3,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    child: _imagePath == null
                        ? ImagePortrait(
                            imageType: ImageType.NONE,
                            imagePath: '',
                          )
                        : ImagePortrait(
                            imagePath: _imagePath!,
                            imageType: ImageType.FILE_IMAGE,
                          ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: _imagePath == null
                          ? ElevatedButton(
                              onPressed: pickImageFromGallery,
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                              ),
                              child: const Icon(Icons.add),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
