import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/cubit/cubit_doctor/cubit.dart';
import 'package:untitled1/shared/cubit/cubit_doctor/state.dart';

import '../../shared/component/components.dart';

class PatientHome extends StatelessWidget {
   PatientHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
        builder: (context,state){
          var cubit = DoctorCubit.get(context);

          cubit.doctorData();
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                measurementItem(icon: Icons.healing, title: 'Temperature', measurement: "35"),
                measurementItem(icon: Icons.healing, title: 'Heart Rate', measurement: "60"),
                measurementItem(icon: Icons.healing, title: 'Oxygen', measurement: "93"),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:const [
                          Text('Description Message',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Center(child: Text('Create complex layouts with ConstraintLayout by adding constraints from each view to other views and guidelines. Then preview your layout on any screen size by selecting one of various device configurations or by simply resizing the preview window.',style: TextStyle(fontSize: 12),maxLines: 2,
                            overflow: TextOverflow.ellipsis,)),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                  ),
                ),
                const Text('My Doctors',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Expanded(flex:2 ,
                    child:ConditionalBuilder(condition: cubit.doctorJson !=null,
                  builder:(context)=>cubit.doctorJson!['Data']['Doctor']!=null? buildDoctorItem(cubit.doctorJson!,context) : Center(child: Text('Not Found',style: TextStyle(color: Colors.grey),)) ,
                  fallback:(context)=>Center(child: CircularProgressIndicator(),) ,) ),
                const SizedBox(height: 5,),
                // Text('Other Doctors',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                // SizedBox(height: 10,),
                // Expanded(flex: 1,child: patientBuilder()),
              ],
            ),
          );
        },
        listener: (context,state){});
  }
}
