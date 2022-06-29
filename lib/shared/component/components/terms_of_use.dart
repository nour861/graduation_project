import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../dialogs/privacy_policy_dialog.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: 'By Creating an account, you are agree to our ',
          style: Theme.of(context).textTheme.bodyText1,
          children: [
            TextSpan(
              text: 'terms&conditions ',
              style: const TextStyle(
                  color: Color(0xff0064b0),
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return PolicyDialog(fileName: 'terms_conditions.md');
                      });
                },
            ),
            const TextSpan(text: 'and '),
            TextSpan(
                text: 'privacy policy ',
                style: const TextStyle(
                    color: Color(0xff0064b0),
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return PolicyDialog(fileName: 'privacy_policy.md');
                        });
                  }),
          ],
        ),
      ),
    );
  }
}
