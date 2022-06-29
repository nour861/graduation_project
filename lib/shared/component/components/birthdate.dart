import 'package:flutter/material.dart';

DateTime? birthDate;

class BirthDate extends StatefulWidget {
  const BirthDate({Key? key}) : super(key: key);

  @override
  State<BirthDate> createState() => _BirthDateState();
}

class _BirthDateState extends State<BirthDate> {
  //DateTime? birthDate;
  String? birthDateInString;
  bool isDateSelected = false;

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
      child: ListTile(
        leading: const Text(
          'BirthDate',
          style: TextStyle(color: Color(0xff22c0e1)),
        ),
        title: Text(
          birthDate == null ? 'Y-M-D' : birthDateInString!,
          style: TextStyle(color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
            icon: const Icon(Icons.calendar_today, color: Color(0xff22c0e1)),
            onPressed: () async {
              final datePick = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
              if (datePick != null && datePick != birthDate) {
                setState(() {
                  birthDate = datePick;
                  isDateSelected = true;
                  birthDateInString =
                      '${birthDate!.year}-${birthDate!.month}-${birthDate!.day}';
                });
              }
            }),
      ),
    );
  }
}
