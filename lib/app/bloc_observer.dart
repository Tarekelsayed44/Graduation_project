// import 'package:bloc/bloc.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// part 'auth_state.dart';
//
// class HelloWorldBloc extends Bloc<AuthStates, AuthInitialState> {
//   final GraphQLClient client;
//
//   HelloWorldBloc({required this.client}) : super(());
//
//   @override
//   Stream<AuthStates> mapEventToState(HelloWorldEvent event) async* {
//     if (event is FetchHelloWorld) {
//       yield loginLoadingState();
//       final result = await client.query(
//           QueryOptions(document: QueryService.helloWorldQuery));
//       if (result.hasException) {
//         yield loginFailedState(message: 'failed');
//       } else {
//         final hello = result.data?['hello'];
//         yield loginSuccessState();
//       }
//     }
//   }
// }