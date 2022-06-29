import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/cubit/cubit_doctor/cubit.dart';
import 'package:untitled1/shared/cubit/cubit_doctor/state.dart';

class AddPatient extends StatelessWidget {
  var patientId=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <DoctorCubit,DoctorStates>(
    builder: (context,state){
      var cubit=DoctorCubit.get(context);

      addPatient(){
        int id=int.parse(patientId.text);
       return  cubit.addPatient(id);
      }
      return Scaffold(
        appBar: AppBar(title: Text('Add Patient')),
        body: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextFormField(
        controller:patientId ,
        keyboardType: TextInputType.number,
        validator: (String? value){
        if(value!.isEmpty){
        return 'patient id must not be empty';
        }
        return null;
        },
        decoration: InputDecoration(
        label: Text('Enter Patient Id'),
        prefixIcon: Icon(Icons.numbers)
        ),
        ),
        SizedBox(height: 20,),
        TextButton(onPressed: ()async{
          if(patientId!=''){
            int id=int.parse(patientId.text);
            print(id);
            DoctorCubit.get(context).addPatient(id);
            patientId.clear();
            await DoctorCubit.get(context).getPatientData();
          }
        }, child: Text('Add Patient')),
  ],
  ),
  ),
      );
  },
    listener: (context,state){});
  }
}
