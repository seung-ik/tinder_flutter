import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String id;
  String name;
  int age;
  String profilePhotoPath;
  String gender;
  String wantGender;
  String bio = "";

  AppUser(
      {required this.id,
      required this.name,
      required this.age,
      required this.profilePhotoPath,
      required this.gender,
      required this.wantGender});

  AppUser.fromSnapshot(DocumentSnapshot snapshot) :
    id = snapshot['id'],
    name = snapshot['name'],
    age = snapshot['age'],
    gender = snapshot['gender'],
    wantGender = snapshot['wantGender'],
    profilePhotoPath = snapshot['profile_photo_path'],
    bio = snapshot.get('bio') ?? '';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'profile_photo_path': profilePhotoPath,
      'bio': bio,
      'gender': gender,
      'wantGender': wantGender
    };
  }
}
