import 'package:prayer_time_application/models/place.dart';
import 'package:prayer_time_application/models/place_search.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyBVH-CjhhEsKA7I4wvv2b3bQvONuk0WTEE';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=%28cities%29&key=$key');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['predictions'] as List;
    return jsonResult.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url =
        Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String,dynamic>;
    return Place.fromJson(jsonResult);
  }

  Future<List<Place>> getPlaces(double lat, double lng,String placeType) async {
    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=distance&key=$key');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
