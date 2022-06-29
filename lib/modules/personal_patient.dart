import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/patient/patient_profile.dart';
import 'package:untitled1/modules/sign_in_screen.dart';
import 'package:untitled1/shared/cubit/cubit_patient/cubit_patien.dart';
import 'package:untitled1/shared/cubit/cubit_patient/patient_state.dart';

import '../dialogs/privacy_policy_dialog.dart';
import '../shared/components3.dart';
import '../shared/constants.dart';

class PersonalPatient extends StatelessWidget {
  //  final String s;
  //
  // // ignore: use_key_in_widget_constructors
  // PersonalPatient( {this}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientCubit()..getData(),
      child: BlocConsumer<PatientCubit, PatientStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: ConditionalBuilder(
              condition: PatientCubit.get(context).userModel != null &&
                  PatientCubit.get(context).getData() != null,
              fallback: (BuildContext context) {
                return Center(child: CircularProgressIndicator());
              },
              builder: (BuildContext context) => Container(
                padding: const EdgeInsets.only(top: 20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
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
                        '${PatientCubit.get(context).userModel!.data!.userName}',
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
                                  builder: (context) => ProfilePatient()));
                        }),
                    buildMenuItem(
                        text: "Notifications",
                        icon: Icons.notifications_none_outlined,
                        function: () {}),
                    buildMenuItem(
                        text: "Language",
                        icon: Icons.language,
                        function: () {
                          // selectItem(context, 0);
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
