import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.favourite.tr(),style: getBoldStyle(color: Colors.black,fontSize: 20),),
      ),
    );
  }
}
