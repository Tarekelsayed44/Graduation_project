import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/app/Graphql/app_queries.dart';
import 'package:pick_park/presentations/resources/string_manager.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';

import '../../../app/app_pref.dart';

class Tags extends StatefulWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  Widget build(BuildContext context) {
    TokenCache tokenCache = TokenCache();
    tokenCache.token;
    final token =  tokenCache.token;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( onPressed: () { Navigator.pop(context) ;}, icon: Icon(Icons.arrow_back,color: Colors.black),),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          AppStrings.tags.tr(),
          textAlign: TextAlign.start,
          style: getBoldStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Query(
        options: QueryOptions(
          document: gql(AppQueries.myTag),
          pollInterval: const Duration(seconds: 10),
            // variables: {
            //   'token': token,
            // }
        ),
        builder: (QueryResult result, { VoidCallback? refetch, FetchMore? fetchMore }) {
          if (result.hasException) {
             print(result.exception.toString());
          }
          if (result.isLoading) {
            return const Text('Loading');
          }
          List? myTags = result.data?['id']?['tagUID']?['createdAt'];
          if (myTags == null) {
            return const Text('No repositories');
          }
          return ListView.builder(
              itemCount: myTags.length,
              itemBuilder: (context, index) {
                final repository = myTags[index];
                return Text(repository['name']);
              });
        },
      )
      );
  }
}
