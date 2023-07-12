import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../app/app_pref.dart';
import '../../../shared/components/component.dart';
import '../../Search/search.dart';
import '../../resources/string_manager.dart';
import '../../resources/styles_manager.dart';

const String parkingSpacesQuery = r'''
  query Query {
    parkingSpaces {
      data {
        items {
          lat
          long
          id
          
        }
      }
    }
  }
''';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String price="";
  var  lat;
  var long;
  late CameraPosition _kGooglePlex;
  Completer<GoogleMapController> _controller = Completer();
 // PriceCache priceCache =PriceCache();
  @override
  void initState() {
    super.initState();
    getService();
    getLatLng();
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> _marker = [];

    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: _kGooglePlex == null
              ? CircularProgressIndicator()
              : Stack(
            children: [
          Query(
          options: QueryOptions(
          document: gql(parkingSpacesQuery),
        ),
          builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text('Error: ${result.exception}');
            }

            if (result.isLoading) {
              return CircularProgressIndicator();
            }

            List<ParkingSpace> parkingSpaces = extractParkingSpaces(
                result.data);
            _marker = createMarkers(parkingSpaces);

            return GoogleMap(
              initialCameraPosition: _kGooglePlex,
              markers: Set<Marker>.of(_marker),
              mapType: MapType.normal,
              myLocationEnabled: false,
              compassEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          } ),
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
                              builder: (context) => MyHomePage(),
                            ),
                          );
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
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(31.04094931, 31.378469),
                zoom: 14,
              ),
            ),
          );
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
        ),
      );
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

  void showProfileSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Text('Profile Sheet'),
          ),
        );
      },
    );
  }

  List<ParkingSpace> extractParkingSpaces(Map<String, dynamic>? data) {
    List<ParkingSpace> parkingSpaces = [];
    if (data != null) {
      final List<dynamic> items = data['parkingSpaces']['data']['items'];
      for (final item in items) {
        final double lat = item['lat'];
        final double  long = item['long'];
        final String id = item['id'];
       // final double price =item['price'];
        parkingSpaces.add(ParkingSpace(lat: lat, long: long, id: id));
        //priceCache.setPrice(price);
      }
    }
    return parkingSpaces;
  }

  List<Marker> createMarkers(List<ParkingSpace> parkingSpaces) {
    List<Marker> markers = [];
    for (final parkingSpace in parkingSpaces) {
      Marker marker = Marker(
        markerId: MarkerId(parkingSpace.id),
        position: LatLng(parkingSpace.lat, parkingSpace.long),
        infoWindow: InfoWindow(),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onTap: () {
          showProfileSheet(context);
        },
      );
      markers.add(marker);
    }
    return markers;
  }
}

class ParkingSpace {
  final double lat;
  final double long;
  final String id;
  //final double price;
  ParkingSpace({required this.lat, required this.long, required this.id,
  //  required this.price
  });
}