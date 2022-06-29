import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/apihelper/api.dart';
import 'package:untitled1/shared/components3.dart';
import 'package:untitled1/shared/constants.dart';

import '../layout/app_layout.dart';
import '../shared/component/components/birthdate.dart';
import '../shared/component/components/custom_button.dart';
import '../shared/component/components/gender_button.dart';
import '../shared/component/components/rescuer_number.dart';
import '../shared/component/components/terms_of_use.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool doctorVisible = false;
  bool patientVisible = false;

  bool hidePassword = true;
  bool confirmPassword = true;

  bool isSelected1 = false;
  bool isSelected2 = false;
  bool? uiType;
  int? value;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  dynamic postUserType;
  int? postSpecialization;

  dynamic postGender;

  register() {
    if (dropDownValue == 1) {
      postGender = 'M';
    } else {
      postGender = 'F';
    }
    if (dropValue == 1) {
      postSpecialization = 1;
    } else if (dropValue == 2) {
      postSpecialization = 2;
    } else if (dropValue == 3) {
      postSpecialization = 3;
    } else {
      postSpecialization = 4;
    }
    print(postSpecialization);

    if (isSelected1 == true) {
      postUserType = "1";
      uiType = true;
    } else {
      postUserType = "2";
      uiType = false;
    }

    String postBirthDate = formatDate(
        DateTime(birthDate!.year.toInt(), birthDate!.month.toInt(),
            birthDate!.day.toInt()),
        [yyyy, '-', mm, '-', dd]);

    Api().post(url: 'Authentication/Register', body: {
      "UserName": userNameController.text,
      "Email": emailController.text,
      "Password": passwordController.text,
      "BirthDate": postBirthDate + "T18:51:48.059Z",
      "MobileNumber": phoneController.text,
      "RescuerMobileNumber": rescuerPhoneController.text,
      "Address": addressController.text,
      "Gender": postGender,
      "UserTypeId": postUserType,
      "DoctorSpecializationId": postSpecialization
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff0064b0)),
                    ),
                  ),
                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        labelText: 'User Name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xff22c0e1),
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: phoneController,
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        labelText: 'Phone',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xff22c0e1),
                        )),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xff22c0e1),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Email Can\'t be blank';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'You Should Enter Your Password';
                      }
                      return null;
                    },
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      labelText: 'Password',
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xff22c0e1)),
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: confirmPassword,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'You should confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'not matches';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      labelText: 'Confirm Password',
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xff22c0e1)),
                      suffixIcon: IconButton(
                        icon: confirmPassword
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
                            confirmPassword = !confirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        labelText: 'Address',
                        prefixIcon: Icon(
                          Icons.location_city_outlined,
                          color: Color(0xff22c0e1),
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const GenderDropDownButton(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const BirthDate(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: isSelected1
                            ? const Color(0xff22c0e1)
                            : const Color(0xfff5f5f5),
                        child: MaterialButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 30.0),
                            child: Text(
                              'Patient',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected1
                                      ? Colors.white
                                      : const Color(0xff878787)),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isSelected1 = !isSelected1;
                              isSelected2 = false;
                              patientVisible = true;
                              doctorVisible = false;
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => const RescuerPerson()));
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        color: isSelected2
                            ? const Color(0xff22c0e1)
                            : const Color(0xfff5f5f5),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              isSelected2 = !isSelected2;
                              isSelected1 = false;
                              patientVisible = false;
                              doctorVisible = true;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 30.0),
                            child: Text(
                              'Doctor',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: isSelected2
                                      ? Colors.white
                                      : const Color(0xff878787)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Visibility(
                      visible: doctorVisible, child: BuildSpecialization()),
                  Visibility(
                    visible: patientVisible,
                    child: const RescuerNumber(),
                  ),
                  const TermsOfUse(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    title: 'Sign Up',
                    onPress: () async {
                      await register();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppLayout(
                                  type: uiType!,
                                )),
                      );
                      setState(() {});
                      // if (_formKey.currentState!.validate()) {
                      //   setState(() {});
                      // }
                    },
                    textColor: Colors.white,
                    bkColor: const Color(0xff22c0e1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
