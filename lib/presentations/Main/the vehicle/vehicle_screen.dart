import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:pick_park/shared/components/component.dart';

import '../../payment_screens/payment2.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';
import 'create_vehicle.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  String selectedVehicle = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          AppStrings.chooseVehicle.tr(),
          style: getBoldStyle(color: Colors.black, fontSize: 20),
        ),
        leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
    child: Query(
    options: QueryOptions(
    document: gql(AppQueries.vehicleQuery),
    ),
    builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
    if (result.hasException) {
    return Text('Error loading data');
    }

    if (result.isLoading) {
    return CircularProgressIndicator();
    }

    final List<dynamic> vehicles = result.data?['myVehicles']['data'] ?? [];

    return ListView.builder(
    itemCount: vehicles.length,
    itemBuilder: (BuildContext context, int index) {
      final vehicle = vehicles[index];
      final vehicleName = vehicle['description'];

    return Container(
    width: double.infinity,
    height: 75,
    decoration: BoxDecoration(
    border: Border.all(width: 2, color: Color(0xffE6E6E6)),
    borderRadius: BorderRadius.circular(30),
    color: Colors.white,
    ),
    child: Padding(
    padding: const EdgeInsets.all(5),
    child: Row(
    children: [
      Radio(
        value: vehicleName,
        groupValue: selectedVehicle,
        onChanged: (value) {
          setState(() {
            selectedVehicle = value.toString();
          });
        },
        activeColor: Color(0xff4B4EB0),
      ),
    Spacer(),
    Column(
    children: [
    Text(
    vehicle['description'],
    style: TextStyle(
    color: Color(0xff4B4EB0),
    fontSize: 18,
    ),
    ),
    Text(
    '${vehicle['plateLetters']} ${vehicle['plateDigits']}',
    style: TextStyle(
    color: Colors.black,
    fontSize: 12,
    ),
    ),
    ],
    ),
    SizedBox(
    width: 20,
    ),
    Image.asset(ImageAssets.carya),
    ],
    ),
    ),
    );
    }
    );
    }
    )
    )
    )
    );
  }
}