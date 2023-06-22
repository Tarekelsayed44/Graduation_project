import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pick_park/presentations/resources/assets_manager.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../../app/Graphql/app_queries.dart';
import '../../../app/app_pref.dart';
import '../../resources/language_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';

//final instance = GetIt.instance;
class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  // final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    // final token = context.watch<TokenCache>().token;
     return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.account.tr(),
          style: getBoldStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body:  Query(
        options: QueryOptions(document: gql(AppQueries.me),
          // variables: {
          //  // 'token': token,
          // }
    ),
    builder: (QueryResult? result,
    {VoidCallback? refetch, FetchMore? fetchMore}) {
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
      List? user = result.data?['me']['name']?['me']['verifiedEmail'];
      return ListView(
        padding: EdgeInsets.all(22),
        children: [
          CircleAvatar(
            radius: 70,
            child: Image.asset(ImageAssets.profile),
          ),

          Text(
            result.data!['me']['data']['name'],
            style: getRegularStyle(color: Colors.black, fontSize: 32),
            textAlign: TextAlign.center,
          ),
          Text(
            result.data?['me']['data']['verifiedEmail'],
            style: getRegularStyle(color: Colors.black, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              AppStrings.changeAccount.tr(),
              style: getRegularStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text(
              AppStrings.paymentMethods.tr(),
              style: getRegularStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              AppStrings.notifications.tr(),
              style: getRegularStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text(
              AppStrings.privacy.tr(),
              style: getRegularStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.error),
            title: Text(
              AppStrings.contactUs.tr(),
              style: getRegularStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.visibility),
            title: Text(
              AppStrings.darkAppearance.tr(),
              style: getRegularStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.language),
          //   title: Text(AppStrings.changeLanguage.tr()),
          //   trailing: Transform(
          //     alignment: Alignment.center,
          //     transform: Matrix4.rotationY( isRtl() ? math.pi : 0),
          //   ),
          //   onTap: () {
          //     _changelanguage();
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text(
              AppStrings.logout.tr(),
              style: getRegularStyle(color: Colors.red, fontSize: 20),
            ),
          )
        ],
      );
    }));
  }

// _changelanguage() {
//   _appPreferences.changeAppLanguage();
//   Phoenix.rebirth(context);
// }
// bool isRtl() {
//   return context.locale == ARABIC_LOCAL;
// }
}
