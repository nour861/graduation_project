import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/component/components.dart';

class PatientHome extends StatelessWidget {
   PatientHome({Key? key}) : super(key: key);

  List name=[
    'Doctor_1',
    'Doctor_1',
    'Doctor_1',
    'Doctor_1',
    'Doctor_1',
    'Doctor_1',
    'Doctor_1',
    'Doctor_1',
    'Doctor_1',
    'Doctor_1',
  ];

  @override
  Widget build(BuildContext context) {
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
          Expanded(flex:2 ,child: doctorBuilder(name)),
          const SizedBox(height: 5,),
          // Text('Other Doctors',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          // SizedBox(height: 10,),
          // Expanded(flex: 1,child: patientBuilder()),
        ],
      ),
    );
  }
}
