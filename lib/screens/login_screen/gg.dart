import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../shared/components/component.dart';
class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My app bar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('login'),
          Icon(Icons.back_hand),
          Text('akdkdbabjdadmlamdkd amldaalmdmlmmm ddaldmaldmalmdls'),
          defaultTextButton(function: (){}, text: 'too height',),
          defaultButton(function: (){}, text: 'btn'),
          defaultFormField(type: TextInputType.emailAddress,  label: 'email', prefix: Icons.email, controller: TextEditingController())
        ],
      ),
    );
  }
}
