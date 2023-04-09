import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.chooseVehicle.tr(),style: getBoldStyle(color: Colors.black,fontSize: 20),),
      ),
    );
  }
}
