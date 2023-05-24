import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';

import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';
import 'create_vehicle.dart';

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
      body: Container(
          child: Query(
            options: QueryOptions(document: gql(AppQueries.vehicleQuery)),
            builder: (QueryResult? result,{VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result!.data == null) {
                return Center(
                  child: Text("Data not found"),
                );
              }

              if (result!.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              List vehicle = result.data!['MyVehicles'];

              return ListView.builder(
                itemCount: vehicle.length,
                itemBuilder: (context, index) {
                  final vehicles = vehicle[index];

                  return ExpansionTile(
                    title: Text(
                      vehicles['title'],
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(vehicles['description'].toString()),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Chip(
                                  avatar: Icon(Icons.timer),
                                  label: Text(vehicles['createdAt']),
                                ),
                                Chip(
                                  avatar: Icon(Icons.av_timer),
                                  label: Text(vehicles['deadline']),
                                ),
                              ],
                            ),
                            Center(
                              child: Chip(
                                label: Text(vehicles['vehicle']),
                                avatar: Icon(Icons.account_circle),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  child: Row(
                                    children: [Icon(Icons.edit), Text("Edit Todo")],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CreatevehiclePage(),
                                        ));
                                  },
                                ),
                                FloatingActionButton(
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete),
                                      Text("Delete vehicle")
                                    ],
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            },
          )),
    );
  }
}
