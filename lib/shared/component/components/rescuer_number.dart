import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

final TextEditingController rescuerPhoneController = TextEditingController();

class RescuerNumber extends StatefulWidget {
  const RescuerNumber({Key? key}) : super(key: key);

  @override
  State<RescuerNumber> createState() => _RescuerNumberState();
}

class _RescuerNumberState extends State<RescuerNumber> {
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withOpacity(0.13)),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffeeeeee),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            // onInputValidated: (bool value) {
            //   print(value);
            // },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: rescuerPhoneController,
            formatInput: false,
            maxLength: 11,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            cursorColor: Colors.black,
            inputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
              border: InputBorder.none,
              hintText: 'Phone Number',
              hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
            ),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
          ),
          Positioned(
            left: 90,
            top: 8,
            bottom: 8,
            child: Container(
              height: 40,
              width: 1,
              color: Colors.black.withOpacity(0.13),
            ),
          )
        ],
      ),
    );
  }
}
