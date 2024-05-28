import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );

  Set<Marker> markers = {};
  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 95,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sua Localização atual:',
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Mudar localização?',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SizedBox(
                height: 150,
                // width: 90,
                child: GoogleMap(
                  initialCameraPosition: initialCameraPosition,
                  markers: markers,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getCurrentPosition() async {
    Position position = await _determinePosition();

    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
        position.latitude,
        position.longitude,
      ),
      zoom: 14,
    )));

    markers.clear();

    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude),
      ),
    );

    setState(() {});
    // late Location location = Location();
    // location.getLocation().then(
    //   (location) {
    //     currentLocation =
    //         LatLng(location.latitude ?? 0, location.longitude ?? 0);
    //   },
    // );
  }

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
