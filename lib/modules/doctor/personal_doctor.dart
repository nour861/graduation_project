import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/doctor/profile_doctor.dart';

import '../../cubit.dart';
import '../../dialogs/privacy_policy_dialog.dart';
import '../../shared/components3.dart';
import '../../shared/constants.dart';
import '../../state.dart';
import '../sign_in_screen.dart';

class PersonalDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit()
        ..getDoctorData()
        ..getAllSpecialization(),
      child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: ConditionalBuilder(
              condition: (DoctorCubit.get(context).userModel != null &&
                  DoctorCubit.get(context).getDoctorData() != null),
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      Container(
                        width: 200,
                        height: 170,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/person.png',
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${DoctorCubit.get(context).userModel!.data!.userName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildMenuItem(
                          text: "Personal Information",
                          icon: Icons.person_outline_outlined,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileDoctor()));
                          }),
                      buildMenuItem(
                          text: "Notifications",
                          icon: Icons.notifications_none_outlined,
                          function: () {}),
                      buildMenuItem(
                          text: "Language",
                          icon: Icons.language,
                          function: () {
                            // showAlert(context);
                          }),
                      buildMenuItem(
                          text: 'Help Center',
                          icon: Icons.help_outline,
                          function: () {}),
                      buildMenuItem(
                          text: 'About Us', icon: Icons.group, function: () {}),
                      buildMenuItem(
                          text: 'Terms & Conditions',
                          icon: Icons.note_add_rounded,
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => PolicyDialog(
                                        fileName: 'terms_conditions.md')));
                          }),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          token = '';
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              'Log Out',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            )
                          ],
                        ),
                      )
                      // buildMenuItem(
                      //     text: 'Log Out',
                      //     iconColor: Colors.red,
                      //     icon: Icons.logout,
                      //     function: () {}),
                    ],
                  ),
                );
              },
              fallback: (BuildContext context) {
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
