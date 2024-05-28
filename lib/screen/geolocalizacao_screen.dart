import 'package:adventure_ai/screen/geolocalizacao/current_location_screen.dart';
import 'package:adventure_ai/screen/geolocalizacao/nearby_places_screen.dart';
import 'package:adventure_ai/screen/geolocalizacao/polyline_screen.dart';
import 'package:adventure_ai/screen/geolocalizacao/search_places_screen.dart';
import 'package:adventure_ai/screen/geolocalizacao/simple_map_screen.dart';
import 'package:flutter/material.dart';

class GeolocalizacaoScreen extends StatefulWidget {
  const GeolocalizacaoScreen({Key? key}) : super(key: key);

  @override
  _GeolocalizacaoScreenState createState() => _GeolocalizacaoScreenState();
}

class _GeolocalizacaoScreenState extends State<GeolocalizacaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Google Maps"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const SimpleMapScreen();
                  }));
                },
                child: const Text("Simple Map")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const CurrentLocationScreen();
                  }));
                },
                child: const Text("User current location")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const SearchPlacesScreen();
                  }));
                },
                child: const Text("Search Places")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const NearByPlacesScreen();
                  }));
                },
                child: const Text("Near by Places")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const PolylineScreen();
                  }));
                },
                child: const Text("Polyline between 2 points"))
          ],
        ),
      ),
    );
  }
}
