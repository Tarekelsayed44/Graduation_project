import 'package:flutter/material.dart';

import '../../shared/components/component.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Text('login'),
                Icon(Icons.arrow_back)
              ],
            ),
            defaultFormField(
              type: TextInputType.emailAddress,
              label: 'Email',
              prefix: Icons.email, controller: TextEditingController(),
            ),
            SizedBox(height: 15,),
            defaultFormField(
              type: TextInputType.visiblePassword,
              prefix: Icons.lock,
              suffix: Icons.remove_red_eye, controller: TextEditingController(),
              label: 'password',
            ),
          ],
        )
    );
  }
}

