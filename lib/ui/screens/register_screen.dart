import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tinder_new/data/db/remote/response.dart';
import 'package:tinder_new/data/model/user_registration.dart';
import 'package:tinder_new/data/provider/user_provider.dart';
import 'package:tinder_new/ui/screens/register_sub_screens/add_photo_screen.dart';
import 'package:tinder_new/ui/screens/register_sub_screens/age_screen.dart';
import 'package:tinder_new/ui/screens/register_sub_screens/email_and_password_screen.dart';
import 'package:tinder_new/ui/screens/register_sub_screens/name_screen.dart';
import 'package:tinder_new/ui/screens/top_navigation_screen.dart';
import 'package:tinder_new/ui/widgets/custom_modal_progress_hud.dart';
import 'package:tinder_new/util/constants.dart';
import 'package:tinder_new/util/utils.dart';
import 'package:tinder_new/ui/screens/start_screen.dart';


class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final UserRegistration _userRegistration = UserRegistration();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final int _endScreenIndex = 3;
  int _currentScreenIndex = 0;
  bool _isLoading = false;
  late UserProvider _userProvider;
  final log = Logger('_RegisterScreenState');

  @override
  void initState() {
    log.fine('initState');

    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);


  }

  void registerUser() async {
    log.fine('registerUser');

    setState(() {
      _isLoading = true;
    });

    log.fine('_userProvide call');
    await _userProvider
        .registerUser(_userRegistration, _scaffoldKey)
        .then((response) {
      if (response is Success) {
        Navigator.pop(context);
        Navigator.pushNamed(context, TopNavigationScreen.id);
      }
    });

    setState(() {
      _isLoading = false;
    });
  }

  void goBackPressed() {
    if (_currentScreenIndex == 0) {
      Navigator.pop(context);
      Navigator.pushNamed(context, StartScreen.id);
    } else {
      setState(() {
        _currentScreenIndex--;
      });
    }
  }

  Widget getSubScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return NameScreen(
            onChanged: (value) => {_userRegistration.name = value});
      case 1:
        return AgeScreen(
            onChanged: (value) => {_userRegistration.age = value.toInt()});
      case 2:
        return AddPhotoScreen(
            onPhotoChanged: (value) =>
                {_userRegistration.localProfilePhotoPath = value});
      case 3:
        return EmailAndPasswordScreen(
            emailOnChanged: (value) => {_userRegistration.email = value},
            passwordOnChanged: (value) => {_userRegistration.password = value});
      default:
        return Container();
    }
  }

  bool canContinueToNextSubScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return (_userRegistration.name.length >= 2);
      case 1:
        return (_userRegistration.age >= 13 && _userRegistration.age <= 120);
      case 2:
        return _userRegistration.localProfilePhotoPath.isNotEmpty;
      default:
        return false;
    }
  }

  String getInvalidRegistrationMessage() {
    switch (_currentScreenIndex) {
      case 0:
        return "Name is too short";
      case 1:
        return "Invalid age";
      case 2:
        return "Invalid photo";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        appBar: AppBar(title: const Text('Register')),
        body: CustomModalProgressHUD(
          inAsyncCall: _isLoading,
          offset: null,
          child: Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                LinearPercentIndicator(
                    lineHeight: 5,
                    percent: (_currentScreenIndex / _endScreenIndex),
                    progressColor: kAccentColor,
                    padding: EdgeInsets.zero),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      padding: kDefaultPadding.copyWith(
                          left: kDefaultPadding.left / 2.0,
                          right: 0.0,
                          bottom: 4.0,
                          top: 4.0),
                      child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: Icon(
                          _currentScreenIndex == 0
                              ? Icons.clear
                              : Icons.arrow_back,
                          color: kSecondaryColor,
                          size: 42.0,
                        ),
                        onPressed: () {
                          goBackPressed();
                        },
                      )),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      padding: kDefaultPadding.copyWith(top: 0, bottom: 0),
                      child: getSubScreen()),
                ),
                Container(
                  padding: kDefaultPadding,
                  child: _currentScreenIndex == _endScreenIndex
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            _isLoading == false
                                ? registerUser()
                                : null;
                          },
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text(
                            'CONTINUE',
                            style: TextStyle(fontSize: 24),
                          ),
                          onPressed: () {
                            if (canContinueToNextSubScreen()) {
                              setState(() {
                                _currentScreenIndex++;
                              });
                            } else {
                              showSnackBarNew(context,
                                  getInvalidRegistrationMessage());
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
