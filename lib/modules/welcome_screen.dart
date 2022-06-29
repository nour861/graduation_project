import 'package:flutter/material.dart';
import 'package:untitled1/modules/sign_in_screen.dart';
import 'package:untitled1/modules/sign_up_screen.dart';

import '../shared/component/components/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff22c0e1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Image(
                  image: AssetImage(
                    'assets/images/logo.jpg',
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white54,
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Welcome To Rescuer!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xff0064b0)),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const SignIn()));
                        },
                        title: 'Sign In',
                        textColor: Colors.white,
                        bkColor: const Color(0xff22c0e1),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        onPress: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => SignUp()));
                        },
                        title: 'Sign Up',
                        textColor: const Color(0xff22c0e1),
                        bkColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
