import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _filterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GraphQLClient client = GraphQLProvider.of(context).value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _filterController,
              decoration: InputDecoration(
                labelText: 'Filter',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _executeQuery(client);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Query(
              options: QueryOptions(
                document: gql(AppQueries.searchquery),
              ),
              builder: (QueryResult? result,
                  {VoidCallback? refetch, FetchMore? fetchMore}) {
                if(result!.isLoading){
                  return CircularProgressIndicator();
                }
                if(result.hasException){
                  print(result.exception);
                }
                if(result.data==null){
                  Text('Data not found');
                }
                final data = result.data;
                // Render your UI based on the retrieved data
                return ListView.builder(
                  itemCount: data!['parkingSpaces']['data']['items'].length,
                  itemBuilder: (context, index) {
                    final item = data!['parkingSpaces']['data']['items'][index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text(item['address']),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _executeQuery(GraphQLClient client) async {
    final QueryOptions options = QueryOptions(
      document: gql(AppQueries.searchquery),
      variables: <String, dynamic>{
        'filter': _filterController.text,
        'paginate': null, // Provide your pagination values if needed
      },
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print('Query failed: ${result.exception.toString()}');
    } else {
      print('Query successful!');
      print('Response: ${result.data}');
    }
  }
}

