import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class PersonData extends StatelessWidget {
  Map<String,dynamic>?json;
   PersonData (this.json);

   userType (){
     if(json!['UserTypeId']==1){
       return 'Patient';
     }
  return 'Doctor';
  }
   gender (){
     if(json!['Gender']==0){
       return 'male';
     }
  return 'female';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ConditionalBuilder(
        condition: json!=null,
        builder: (context)=>Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 170,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/person.png',
                      ),
                    )),
              ),
              SizedBox(height: 20,),
              buildItem('Name', '${json!['UserName']}'),
              buildItem('Email', '${json!['Email']}'),
              buildItem('Address', '${json!['Address']}'),
              buildItem('Phone', '${json!['MobileNumber']}'),
              buildItem('BarthDate', '${json!['BirthData']}'),
              buildItem('type', userType()),
              buildItem('gender', gender()),
            ],
          ),
        ),
        fallback:(context)=> Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
Widget buildItem(dataType,data){
  return Row(
    children: [
      Text(dataType+':',style: s,),
      Spacer(),
      Text(data,style: s,),
    ],
  );
}

TextStyle s=TextStyle(fontSize: 20,fontWeight: FontWeight.w300);