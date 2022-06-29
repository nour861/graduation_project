
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/component/components.dart';

class Measurements extends StatelessWidget {
  const Measurements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measurements'),
      ),
      body:Column(
        children: [
          const SizedBox(height: 10,),
          measurementItem(icon: Icons.healing, title: 'Temperature', measurement: "35"),
          measurementItem(icon: Icons.healing, title: 'Heart Rate', measurement: "60"),
          measurementItem(icon: Icons.healing, title: 'Oxygen', measurement: "93"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Description Message',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Center(child: Text('Create complex layouts with ConstraintLayout by adding constraints from each view to other views and guidelines. Then preview your layout on any screen size by selecting one of various device configurations or by simply resizing the preview window.')),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}
