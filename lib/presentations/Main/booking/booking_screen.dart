import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';
class FloorMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floor Map'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(AppQueries.floorquery),
       variables: {
        "input": {
        "parkingSpaceId": "4c982dbb-09f3-46ef-b1dc-3d84b5f4eed5",
        "endAt": 158896522,
        "startAt": 1625566222,
        },
          }
        ),
        builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return CircularProgressIndicator();
          }

          final List<dynamic> floors = result.data?['parkingFloorMapPerDuration']['floors']?? [];

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: floors.map<Widget>((floor) => FloorWidget(floor)).toList(),
            ),
          );
        },
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
          'Floor ${floor['floorNumber']}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Column(
          children: floor['blocks'].map<Widget>((block) => BlockWidget(block)).toList(),
        ),
        SizedBox(height: 16),
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
          'Block ${block['blockCode']}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: block['spots'].map<Widget>((spot) => SpotWidget(spot)).toList(),
        ),
        SizedBox(height: 16),
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
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: spot['isOccupied'] ? Colors.red : null,
      ),
      child: Center(
        child: Text(
          '${spot['spotNumber']}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: spot['isOccupied'] ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}