import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:prayer_time_application/constants.dart';
import 'package:prayer_time_application/models/place.dart';
import 'package:prayer_time_application/providers/application_bloc.dart';
import 'package:provider/provider.dart';

class HalalFoodSearch extends StatefulWidget {
  static String routeName = "/halalfood";

  const HalalFoodSearch({Key? key}) : super(key: key);

  @override
  _HalalFoodSearchState createState() => _HalalFoodSearchState();
}

class _HalalFoodSearchState extends State<HalalFoodSearch> {
  Completer<GoogleMapController> _mapController = Completer();
  // late StreamSubscription locationSubscription;
  // late StreamSubscription boundsSubscription;
  final _locationController = TextEditingController();

  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    // //Listen for selected Location
    // locationSubscription =
    //     applicationBloc.selectedLocation.stream.listen((place) {
    //   if (place != null) {
    //     _locationController.text = place.name;
    //     _goToPlace(place);
    //   } else
    //     _locationController.text = "";
    // });

    // applicationBloc.bounds.stream.listen((bounds) async {
    //   final GoogleMapController controller = await _mapController.future;
    //   controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    // });
    super.initState();
  }

  @override
  void dispose() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    _locationController.dispose();
    // locationSubscription.cancel();
    // boundsSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: color2, //change your color here
          ),
          backgroundColor: color1,
          centerTitle: true,
          title: Text(
            "Halal Food",
            style: TextStyle(color: color2),
          ),
        ),
        body: (applicationBloc.currentLocation == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Column(children: [
                    Container(
                      child: Image.asset(
                        "assets/images/halalfood.jpeg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                      decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.circular(29.5),
                      ),
                      child: TextFormField(
                        style: TextStyle(color: color2),
                        controller: _locationController,
                        textCapitalization: TextCapitalization.words,
                        onChanged: (value) =>
                            applicationBloc.searchPlaces(value),
                        onTap: () => applicationBloc.clearSelectedLocation(),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: color2),
                          icon: Icon(
                            Icons.search,
                            color: color2,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ]),
                  Stack(
                    children: [
                      Container(
                        height: 400.0,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                applicationBloc.currentLocation!.latitude,
                                applicationBloc.currentLocation!.longitude),
                            zoom: 14,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },
                          markers: Set<Marker>.of(applicationBloc.markers),
                        ),
                      ),
                      if (applicationBloc.searchResults != null &&
                          applicationBloc.searchResults!.length != 0)
                        Container(
                            height: 300.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.6),
                                backgroundBlendMode: BlendMode.darken)),
                      if (applicationBloc.searchResults != null)
                        Container(
                          height: 300.0,
                          child: ListView.builder(
                              itemCount: applicationBloc.searchResults!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    applicationBloc
                                        .searchResults![index].description,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    applicationBloc.setSelectedLocation(
                                        applicationBloc
                                            .searchResults![index].placeId);
                                  },
                                );
                              }),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ));
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 14.0),
      ),
    );
  }
}
