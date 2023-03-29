import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../presentations/resources/string_manager.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,);
  List<Marker> _marker =[];
  List<Marker> list =[
    Marker(markerId: MarkerId('1'),
      position:  LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(),
     icon: BitmapDescriptor.defaultMarker,
     // icon: BitmapDescriptor.fromAssetImage(configuration, assetName),
    )];
@override
void initState(){
  super.initState();
  _marker.addAll(list);
}
  @override
  Widget build(BuildContext context) {
  int selectedIndex =0;
    return  Scaffold(
      body: SafeArea(
        child: Expanded(
          child: GoogleMap(
            initialCameraPosition:_kGooglePlex ,
            markers: Set<Marker>.of(_marker) ,
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: false,
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },

          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14)
          ));
          setState(() {

          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
        BottomNavigationBarItem(icon:Icon(Icons.home),label: AppStrings.home.tr()),
        BottomNavigationBarItem(icon:Icon(Icons.list_alt),label: AppStrings.book.tr()),
        BottomNavigationBarItem(icon:Icon(Icons.bookmark),label: AppStrings.favourite.tr()),
        BottomNavigationBarItem(icon:Icon(Icons.directions_car),label: AppStrings.theCar.tr()),
        BottomNavigationBarItem(icon:Icon(Icons.person),label: AppStrings.account.tr()),
      ],
        backgroundColor: Colors.white,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor:Color(0xff4B4EB0),
        unselectedItemColor: Color(0xff9E9E9E),
        showSelectedLabels:true ,
        showUnselectedLabels: true,

      ),
    );
  }
}
