import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';

import '../../../shared/components/component.dart';
import '../../resources/styles_manager.dart';

class FloorMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.floorMap.tr(),
            textAlign: TextAlign.start,
            style: getBoldStyle(
              color: Colors.black,
              fontSize: 25,
            )),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Query(
                options: QueryOptions(document: gql(AppQueries.floorquery), variables: {
                  "input": {
                    "parkingSpaceId": "4c982dbb-09f3-46ef-b1dc-3d84b5f4eed5",
                    "endAt": 158896522,
                    "startAt": 1625566222,
                  },
                }),
                builder: (QueryResult result,
                    {VoidCallback? refetch, FetchMore? fetchMore}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }
                  if (result.isLoading) {
                    return CircularProgressIndicator();
                  }
                  final List<dynamic> floors =
                      result.data?['parkingFloorMapPerDuration']['floors'] ?? [];
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
                      child: Column(
                        children:
                            floors.map<Widget>((floor) => FloorWidget(floor)).toList(),

                      ),
                    ),
                  );
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20,left: 10,right: 10,top: 40),
                  child: defaultButton(
                      function: () {
                        // Navigator.push(
                        //     context, MaterialPageRoute(
                        //     builder: (context) => verificationOtp()));
                      },
                      text: AppStrings.containue.tr(),
                      color: Color(0xff4B4EB0),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      isUpperCase: true),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FloorWidget extends StatelessWidget {
  final dynamic floor;

  const FloorWidget(this.floor);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         '${AppStrings.floor.tr()} ${floor['floorNumber']}',
          style: getBoldStyle(color: Color(0xff4B4EB0),fontSize: 18),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: floor['blocks']
              .map<Widget>((block) => BlockWidget(block))
              .toList(),
        ),

      ],
    );
  }
}

class BlockWidget extends StatelessWidget {
  final dynamic block;

  const BlockWidget(this.block);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppStrings.block.tr()} ${block['blockCode']}',
          style: getSemiBoldStyle(color: Colors.black,fontSize: 18),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              block['spots'].map<Widget>((spot) => SpotWidget(spot)).toList(),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class SpotWidget extends StatelessWidget {
  final dynamic spot;

  const SpotWidget(this.spot);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 99,
      height: 46,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff4B4EB0),width: 2),
        borderRadius: BorderRadius.circular(12),
        color: spot['isOccupied'] ? Colors.red : Color(0xffEDEFFF),
      ),
      child: Center(
        child: Text(
          '${spot['spotNumber']}',
          style:getBoldStyle(color:Colors.black),
            // color: spot['isOccupied'] ? Colors.white : Colors.black,
          ),
        ),
    );
  }
}
