// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:pick_park/app/Graphql/app_mutation.dart';
//
// Future<String> createPaymentToken() async {
//   final QueryOptions options = QueryOptions(
//     document: gql(AppMutations.paymobPayment),
//   );
//
//   final QueryResult result = await gclient.query(options);
//
//   if (result.hasException) {
//     // Handle error response
//     throw Exception('Failed to create payment token: ${result.exception.toString()}');
//   }
//
//   // Access the response data
//   final String token = result.data!['createPaymentToken']['token'] as String;
//
//   return token;
// }