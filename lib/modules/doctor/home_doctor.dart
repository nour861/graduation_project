import 'package:flutter/material.dart';

import '../../shared/component/components.dart';

class DoctorHomeScreen extends StatelessWidget {
  
  var control;
  List name=[
    'patient_1',
    'patient_2',
    'patient_3',
    'patient_4',
    'patient_5',
    'patient_6',
    'patient_7',
    'patient_8',
    'patient_9',
    'patient_10',
  ];

  DoctorHomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            TextFormField(
              controller: control,
              decoration: InputDecoration(
                hintText:'Search',
                fillColor: Colors.grey[200],
                suffixIcon: Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: patientBuilder(name,context),
            ),
          ],
        ),
      ),
    );
  }
}
