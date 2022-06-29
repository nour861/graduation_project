import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modules/doctor/details.dart';
import '../../modules/doctor/measurements.dart';

Widget buildPersonItem(var name,context) {
  return Padding(
    padding: const EdgeInsets.all(9),
    child: Row(
      children: [
         InkWell(
           onTap: (){
             navigateTo(context, const Details());
           },
           child: CircleAvatar(
            radius: 30.0,
            child:ClipOval(
              child: Image.asset('assets/images/person.png',
                fit: BoxFit.cover,
              ),
            ),
        ),
         ),
        const SizedBox(width: 20),
        Text('$name',style: TextStyle(fontSize: 18),),
        const Spacer(),
        IconButton(icon: const Icon(Icons.chat), onPressed:(){}),
        const SizedBox(
          width: 8,
        ),
        IconButton(onPressed: () {navigateTo(context, Measurements());}, icon: const Icon(Icons.science_rounded))
      ],
    ),
  );
}

Widget buildDoctorItem(var name,context) {
  return Padding(
    padding: const EdgeInsets.all(9),
    child: Row(
      children: [
         InkWell(
           onTap: (){
             navigateTo(context, const Details());
           },
           child: CircleAvatar(
             radius: 30.0,
            child: ClipOval(
              child: Image.asset('assets/images/person.png',
                fit: BoxFit.cover,
              ),
            ),
        ),
         ),
        const SizedBox(width: 20),
        Text('$name'),
        const Spacer(),
        IconButton(icon: const Icon(Icons.chat), onPressed:(){}),
        const SizedBox(
          width: 8,
        ),
      ],
    ),
  );
}

Widget patientBuilder(List name,context) {
  return ListView.separated(
      itemBuilder: (context, index) => buildPersonItem(name[index],context),
      separatorBuilder: (context, index) => const SizedBox(height: 1,),
      itemCount: name.length);
}

Widget doctorBuilder(List name) {
  return ListView.separated(
      itemBuilder: (context, index) => buildDoctorItem(name[index],context),
      separatorBuilder: (context, index) => const SizedBox(height: 1,),
      itemCount: name.length);
}

Widget measurementItem(
    {@required String? title,
    @required String? measurement,
    @required IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                      fontSize: 14, fontStyle: FontStyle.italic),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text('$measurement',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ],
            )),
            Center(child: Icon(icon)),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
    ),
  );
}

Widget notificationItem(var name) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        CircleAvatar(
          radius: 30.0,
          child: ClipOval(
            child: Image.asset('assets/images/person.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
         Expanded(child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('$name',style: TextStyle(fontSize: 20),),
             SizedBox(height: 5,),
             Text('The patient is in an emergency case',style: TextStyle(fontSize: 14,color: Colors.grey)),
           ],
         )),
        const CircleAvatar(
          radius: 6.0,
          backgroundColor: Colors.red,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}

Widget notificationBuilder(List name) {
  return ListView.separated(
      itemBuilder: (context, index) => notificationItem(name[index]),
      separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 3,
              color: Colors.grey,
            ),
          ),
      itemCount: name.length);
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateOff(context,widget)=>Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>widget), (route) => false);

