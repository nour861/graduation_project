import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../shared/component/components/custom_button.dart';

class PolicyDialog extends StatelessWidget {
  PolicyDialog({Key? key, this.radius = 8, required this.fileName})
      : assert(fileName.contains('.md'),
            'the file must contain the .md extension'),
        super(key: key);
  final double radius;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 150))
                .then((value) => rootBundle.loadString('assets/$fileName')),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Markdown(data: snapshot.data.toString());
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
          CustomButton(
            onPress: () {
              Navigator.of(context).pop();
            },
            title: 'Accept',
            textColor: const Color(0xff4e5e78),
            bkColor: Colors.white,
          )
        ],
      ),
    );
  }
}
