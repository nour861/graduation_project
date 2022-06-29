import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../layout/app_layout.dart';
import '../shared/component/components/custom_button.dart';
import '../shared/constants.dart';
import 'sign_up_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hidePassword = true;

  var formKey = GlobalKey<FormState>();
  var signInEmailController = TextEditingController();
  var signInPasswordController = TextEditingController();

  bool? uiType;
  login() async {
    http.Response response = await http.post(
        Uri.parse(
            'http://rescuerapp-001-site1.gtempurl.com/api/Authentication/Login'),
        body: jsonEncode({
          "Email": signInEmailController.text,
          "Password": signInPasswordController.text
        }),
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });

    var body = jsonDecode(response.body);

    token = body['token'];

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    // prefs.setString('token', token!);
    //
    // print(prefs.getString('token'));
  }

  Future<void> getUser() async {
    http.Response res = await http.get(
        Uri.parse('http://rescuerapp-001-site1.gtempurl.com/api/User/UserData'),
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });

    var userBody = jsonDecode(res.body);
    var userTypeId = userBody["Data"]["UserTypeId"];
    print(userTypeId);
    print(token);

    if (userTypeId == 1) {
      uiType = true;
    } else {
      uiType = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff22c0e1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                  //  height: MediaQuery.of(context).size.height / 4,
                  ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                //  height: MediaQuery.of(context).size.height / 1.5,
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'Welcome Back!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color(0xff0064b0)),
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: signInEmailController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xff22c0e1),
                                )),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: signInPasswordController,
                            obscureText: hidePassword,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'password is too short';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              border: InputBorder.none,
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xff22c0e1),
                              ),
                              suffixIcon: IconButton(
                                icon: hidePassword
                                    ? const Icon(
                                        Icons.visibility_outlined,
                                        color: Color(0xff22c0e1),
                                      )
                                    : const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Color(0xff22c0e1),
                                      ),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('Forget your Password?',
                                  style: TextStyle(color: Color(0xff0064b0))),
                            ),
                          ),
                          CustomButton(
                            title: 'Sign In',
                            onPress: () async {
                              if (formKey.currentState!.validate()) {
                                await login();
                                await getUser();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (ctx) {
                                  return AppLayout(
                                    type: uiType!,
                                  );
                                }));
                              }

                              setState(() {});
                            },
                            textColor: Colors.white,
                            bkColor: const Color(0xff22c0e1),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => const SignUp()));
                                },
                                child: const Text(
                                  'Don\'t Have Account? Sign Up Here',
                                  style: TextStyle(color: Color(0xff0064b0)),
                                )),
                          ),
                        ],
                      ),
                    ),
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
