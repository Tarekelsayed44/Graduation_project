import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pick_park/presentations/Search/search.dart';
import 'package:pick_park/presentations/resources/styles_manager.dart';
import 'package:pick_park/shared/components/component.dart';

import '../../resources/string_manager.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  var lat;
  var long;
  late CameraPosition _kGooglePlex;
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    getService();
    getLatLng();

  }
  @override
  Widget build(BuildContext context) {
    List<Marker> _marker = [];
    List<Marker> list = [
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(31.046444, 31.361372),
        infoWindow: InfoWindow(),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),onTap: (){
        showProfileSheet(context: context);
      },
      ),
      Marker(
        markerId: MarkerId('2'),
        position: LatLng(31.046577, 31.369340),
        infoWindow: InfoWindow(),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),onTap: (){
        showProfileSheet(context: context);
      },
      ),
      Marker(
        markerId: MarkerId('3'),
        position: LatLng(31.037384, 31.361147),
        infoWindow: InfoWindow(),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),onTap: (){
        showProfileSheet(context: context);
      },
      ),
    ];
    _marker.addAll(list);
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: _kGooglePlex == null
              ? CircularProgressIndicator()
              : Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: _kGooglePlex,
                      markers: Set<Marker>.of(_marker),
                      mapType: MapType.normal,
                      myLocationEnabled: false,
                      compassEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notification_important_sharp,
                                color: Color(0xff4B4EB0),
                              ),
                            ),
                            radius: 20,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()));
                              },
                              icon: Icon(
                                Icons.search,
                                color: Color(0xff4B4EB0),
                              ),
                            ),
                            radius: 20,
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                  alignment: Alignment.topRight,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_disabled_outlined),
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(31.04094931, 31.378469), zoom: 14)));
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  //-------------------------------------Geolocator------------------------
  late Position cl;

  Future getService() async {
    bool service;
    LocationPermission per;
    service = await Geolocator.isLocationServiceEnabled();
    if (service == false) {
      showAlertDialog(
          context: context,
          backgroundColor: Colors.white,
          content: Text(
            AppStrings.locationServiceError.tr(),
            style: getSemiBoldStyle(color: Colors.black, fontSize: 20),
          ));
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per != LocationPermission.denied) {
        getLatLng();
      }
    }
  }

  Future<void> getLatLng() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    long = cl.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    print(_kGooglePlex);
    setState(() {});
  }
}

