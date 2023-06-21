import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final GraphQLClient _client = GraphQLClient(
    link: HttpLink('https://pickpark-api.onrender.com/graphql'),
    cache: GraphQLCache(),
  );

  Future<void> _performSearch() async {
    final String searchQuery = _searchController.text;

    final QueryOptions options = QueryOptions(
      document: gql(AppQueries.searchquery),
      variables: <String, dynamic>{
        'query': searchQuery,
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      // Handle any errors
      print('GraphQL Error: ${result.exception.toString()}');
    } else {
      // Handle successful search results
      final List<dynamic> searchResults = result.data!['search'];

      // Process and display the search results
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Search',
            ),
          ),
          ElevatedButton(
            onPressed: _performSearch,
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}