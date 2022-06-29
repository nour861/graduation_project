import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/modules/welcome_screen.dart';

import '../layout/app_layout.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? finalEmail;
  bool? isPatient;

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      await Future.delayed(
          const Duration(milliseconds: 1500),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => finalEmail == null
                      ? const WelcomeScreen()
                      : AppLayout(type: isPatient!))));
    });
    super.initState();
  }

  Future getValidationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainedEmail = prefs.getString('newEmail');
    setState(() {
      finalEmail = obtainedEmail;
      isPatient = true;
    });
    print(finalEmail);
    isPatient = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff22c0e1),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: const Center(
          child: Image(
            image: AssetImage(
              'assets/images/logo.jpg',
            ),
            width: 200,
          ),
        ),
      ),
    );
  }
}
