import 'package:flutter/material.dart';

int? dropDownValue;

class GenderDropDownButton extends StatefulWidget {
  const GenderDropDownButton({Key? key}) : super(key: key);

  @override
  _GenderDropDownButtonState createState() => _GenderDropDownButtonState();
}

class _GenderDropDownButtonState extends State<GenderDropDownButton> {
  // int? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const ShapeDecoration(
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: dropDownValue,
            items: [
              DropdownMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.male, color: Color(0xff22c0e1)
                        //color: Color(0xff878787),
                        ),
                    Text("Male", style: TextStyle(fontSize: 18)),
                  ],
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Row(
                  children: const [
                    Icon(Icons.female, color: Color(0xff22c0e1)
                        // color: Color(0xff878787),
                        ),
                    Text("Female", style: TextStyle(fontSize: 18)),
                  ],
                ),
                value: 2,
              )
            ],
            onChanged: (int? value) {
              setState(() {
                dropDownValue = value;
              });
            },
            isExpanded: true,
            hint: Row(
              children: const [
                Icon(Icons.transgender_outlined, color: Color(0xff22c0e1)
                    //  color: Color(0xff878787),
                    ),
                Text(
                  " Gender",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )),
      ),
    );
  }
}
