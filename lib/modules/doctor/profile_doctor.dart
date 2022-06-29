import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit.dart';
import '../../shared/components3.dart';
import '../../state.dart';

// ignore: use_key_in_widget_constructors
class ProfileDoctor extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var addressController = TextEditingController();
  var specialController = TextEditingController();

  int getAge(BuildContext context) {
    String birthdate = DoctorCubit.get(context).userModel!.data!.birthDate!;

    int get = int.parse(birthdate.substring(0, 4));
    print(DateTime.now().year - get);
    return (DateTime.now().year - get);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit()
        ..getDoctorData()
        ..getAllSpecialization(),
      child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {
          if (state is SuccessDoctorData) {
            nameController.text =
                DoctorCubit.get(context).userModel!.data!.userName!;
            phoneController.text =
                DoctorCubit.get(context).userModel!.data!.mobileNumber!;
            emailController.text =
                DoctorCubit.get(context).userModel!.data!.email!;
            ageController.text = getAge(context).toString();
            addressController.text =
                DoctorCubit.get(context).userModel!.data!.address!;
          }
          if (state is SuccessDoctorUpdate) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Updated Succesfully"),
              backgroundColor: Colors.blue[400],
              duration: Duration(milliseconds: 350),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Personal Information'),
                actions: [
                  IconButton(
                      onPressed: () {
                        DoctorCubit.get(context).updateDoctorProfile(
                            username: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            address: addressController.text);
                      },
                      icon: const Icon(Icons.save)),
                ],
              ),
              body: ConditionalBuilder(
                condition: DoctorCubit.get(context).userModel != null,
                fallback: (BuildContext context) =>
                    Center(child: CircularProgressIndicator()),
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: [
                      if (state is LoadingDoctorUpdate)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 15,
                      ),
                      buildImageCross(),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        prefix: Icons.title,
                        controller: nameController,
                        type: TextInputType.text,
                        label: 'Full Name',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        prefix: Icons.email,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: 'Email',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        prefix: Icons.phone,
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: 'Phone',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        onTab: () {
                          DoctorCubit.get(context).updateDate(
                              context: context, controller: ageController);
                        },
                        controller: ageController,
                        type: TextInputType.number,
                        prefix: Icons.cake_outlined,
                        label: 'Age',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BuildSpecialization(),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        prefix: Icons.location_city_outlined,
                        controller: addressController,
                        type: TextInputType.text,
                        label: 'Address',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
