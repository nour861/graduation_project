import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../modules/doctor/profile_doctor.dart';
import 'constants.dart';

//build home layout
Widget buildMenuItem({
  required String text,
  required IconData icon,
  required Function function,
  Color iconColor = const Color(0xFF6D6F6F),
}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: ListTile(
      minLeadingWidth: 3,
      leading: Icon(
        icon,
        size: 30,
        color: iconColor,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 20, color: iconColor),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    ),
  );
}

void selectItem(context, int index) {
  //Navigator.pop(context);
  switch (index) {
    case 0:
      navigateTo(context, ProfileDoctor());
      break;
  }
}

void navigateTo(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

//build doctor & patient

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTab,
  bool? focus = false,
  bool isPassword = false,
  // required String? Function(String?)? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onTap: () {
        onTab!();
      },
      obscureText: isPassword,
      // onFieldSubmitted: (s) {
      //   onSubmit!(s);
      // },
      // onChanged: (s) {
      //   onChange!(s);
      // },
      // validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        border: InputBorder.none,
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 15.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
Widget buildImageCross() => Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar(
            radius: 60.0,
            //   backgroundImage: NetworkImage(
            //       'https://avatars.githubusercontent.com/u/34492145?v=4'),
            //
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),
          CircleAvatar(
            radius: 19.0,
            backgroundColor: Colors.white,
            // child: Icon(
            //   Icons.camera_alt,
            //   size: 20,
            //   color: Colors.white,
            // ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 2.0,
              end: 2.0,
            ),
            child: CircleAvatar(
              radius: 16.0,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

////choose your major in profile

// Widget chooseYourMajor() {
//   return DropdownButtonFormField(
//     hint: Text('Select Your Major'),
//     decoration: InputDecoration(
//         labelText: 'Major', border: InputBorder.none, filled: true
//         // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
//         ),
//     items: [
//       DropdownMenuItem<int>(
//           value: 1,
//           child: Row(
//             children: [
//
//             ],
//           )),
//       DropdownMenuItem<int>(
//         value: 2,
//         child: Row(
//           children: [
//
//           ],
//         ),
//       )
//     ],
//     onChanged: (Object? value) {},
//   );
// }

class BuildSpecialization extends StatefulWidget {
  // int value;
  // BuildSpecialization({required this.value});
  // const BuildSpecialization({Key? key}) : super(key: key);

  @override
  _BuildSpecializationState createState() => _BuildSpecializationState();
}

class _BuildSpecializationState extends State<BuildSpecialization> {
  // int? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(
              FontAwesomeIcons.stethoscope,
            ),
            labelText: 'Major',
            border: InputBorder.none,
            filled: true),
        value: dropValue,
        onChanged: (int? value) {
          setState(() {
            dropValue = value;
          });
        },
        items: [
          DropdownMenuItem(
            child: Row(
              children: const [
                Text("أمراض القلب", style: TextStyle(fontSize: 15)),
              ],
            ),
            value: 1,
          ),
          DropdownMenuItem(
            child: Row(
              children: const [
//
                Text("امراض جلدية", style: TextStyle(fontSize: 15)),
              ],
            ),
            value: 2,
          ),
          DropdownMenuItem(
            child: Row(
              children: const [
//
                Text("جراحة العظام", style: TextStyle(fontSize: 15)),
              ],
            ),
            value: 3,
          ),
          DropdownMenuItem(
            child: Row(
              children: const [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       child:
//                           Icon(FontAwesomeIcons.brain, color: Color(0xff22c0e1)
// // color: Color(0xff878787),
//                               ),
//                     ),
                Text("الأنف والأذن والحنجرة", style: TextStyle(fontSize: 15)),
              ],
            ),
            value: 4,
          ),
        ],
        // isExpanded: true,
//           hint: Row(
//             children: const [
//               Icon(FontAwesomeIcons.stethoscope, color: Color(0xff22c0e1)
// //  color: Color(0xff878787),
//                   ),
//               Text(
//                 " Major",
//                 style: TextStyle(fontSize: 18),
//               ),
        // ],
      ),
    );
  }
}
