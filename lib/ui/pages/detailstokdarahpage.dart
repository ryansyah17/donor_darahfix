import 'dart:async';
import 'dart:math';
// import 'dart:ffi';
// import 'dart:math';

import 'package:donor_darah/models/jadwal.dart';
import 'package:donor_darah/models/stokdarah.dart';
// import 'package:donor_darah/provider/stokdarah_provider.dart';
import 'package:donor_darah/services/stokdarah_services.dart';
import 'package:donor_darah/shared/shared.dart';
import 'package:donor_darah/ui/pages/googlemapapi.dart';
// import 'package:donor_darah/ui/widgets/informasidarah_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
// import 'package:provider/provider.dart';

var isShow = false.obs;
var typegol = "".obs;
var quantity = 1.obs;

class DetailStokDarahPage extends StatefulWidget {
  const DetailStokDarahPage({Key? key}) : super(key: key);

  @override
  State<DetailStokDarahPage> createState() => DetailStokDarahPageState();
}

class DetailStokDarahPageState extends State<DetailStokDarahPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation =
      LatLng(-0.9248589249455207, 100.43458092566632);
  static const LatLng destinationLatlng =
      LatLng(-0.927758013599195, 100.43052011032438);

  Set<Marker> _marker = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  late StreamSubscription<LocationData> subscription;

  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;
  StokdarahService service = StokdarahService();

  @override
  void initState() {
    super.initState();
    service.getStokdarah();
    location = Location();
    polylinePoints = PolylinePoints();

    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;

      updatePinsOnMap();
    });

    setInitialLocation();
  }

  void setInitialLocation() async {
    await location.getLocation().then((value) {
      currentLocation = value;
      setState(() {});
    });

    destinationLocation = LocationData.fromMap({
      "latitude": destinationLatlng.latitude,
      "longitude": destinationLatlng.longitude,
    });
  }

  void showLocationPins() {
    var sourceposition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    var destinationPosition =
        LatLng(destinationLatlng.latitude, destinationLatlng.longitude);

    _marker.add(Marker(
      markerId: MarkerId('sourcePosition'),
      position: sourceposition,
    ));

    _marker.add(
      Marker(
        markerId: MarkerId('destinationPosition'),
        position: destinationPosition,
      ),
    );

    setPolylinesInMap();
  }

  void setPolylinesInMap() async {
    var result = await polylinePoints.getRouteBetweenCoordinates(
      GoogleMapApi().url,
      PointLatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
      PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((pointLatLng) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    setState(() {
      _polylines.add(Polyline(
        width: 5,
        polylineId: PolylineId('polyline'),
        color: Colors.blueAccent,
        points: polylineCoordinates,
      ));
    });
  }

  void updatePinsOnMap() async {
    CameraPosition cameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing: 30,
      target: LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    );

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    var sourcePosition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    setState(() {
      _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

      _marker.add(Marker(
        markerId: MarkerId('sourcePosition'),
        position: sourcePosition,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primer,
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                  onTap: () {
                    print("object");
                    service.getStokdarah();
                    setState(() {});
                  },
                  child: Icon(Icons.refresh)))
        ],
        title: Text(
          "Track order",
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : Stack(
              children: <Widget>[
                _buildGoogleMap(context),
                _buildContainer(),
                _cobacoba(),
              ],
            ),
    );
  }

  Widget _cobacoba() {
    return Column(
        children:
            // stokDarahProvider.stokDarah.map((e) => _stokdarah(e)).toList()
            // mockStokdarah.map((e) => _stokdarah(e)).toList());
            listStokDarah.map((element) => _stokdarah(element)).toList());
  }

  Widget _stokdarah(Data stokdarah) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              context: context,
              builder: (context) {
                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: primer,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Golongan Darah',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Tersedia',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 50, right: 10, bottom: 5),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/blood-drop.png'))),
                            ),
                            Container(
                              child: Text(
                                'A',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                stokdarah.goldarahA.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 50, right: 10, bottom: 5),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/blood-drop.png'))),
                            ),
                            Container(
                              child: Text(
                                'B',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                stokdarah.goldarahB!.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 50, right: 10, bottom: 5),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/blood-drop.png'))),
                            ),
                            Container(
                              child: Text(
                                'AB',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                stokdarah.goldarahAb!.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),
                            //
                          ],
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 50, right: 10, bottom: 5),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/blood-drop.png'))),
                            ),
                            Container(
                              child: Text(
                                'O',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                stokdarah.goldarahO!.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Obx(
                                    () => Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              quantity.value =
                                                  max(1, quantity.value - 1);
                                            });
                                          },
                                          child: Container(
                                            height: 26,
                                            width: 26,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(width: 1),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/btn_min.png'))),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child: Text(
                                            "${quantity.value}",
                                            textAlign: TextAlign.center,
                                            style: blackFontStyle2,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              quantity.value =
                                                  min(999, quantity.value + 1);
                                            });
                                          },
                                          child: Container(
                                            height: 26,
                                            width: 26,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(width: 1),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/btn_add.png'))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        service
                                            .putStokDarah(
                                                typegol.value, quantity.string)
                                            .then((value) =>
                                                Navigator.pop(context));
                                      },
                                      child: Text("Ambil Darah"))
                                ],
                              ),
                              Spacer(),
                              Obx(() => isShow.value == false
                                  ? GestureDetector(
                                      onTap: () {
                                        isShow.value = !isShow.value;
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        width: 200,
                                        decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(typegol.value == ""
                                                ? "Pilih Gol Darah"
                                                : typegol.value)),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              isShow.value = !isShow.value;
                                              typegol.value = "A";
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(child: Text("A")),
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              isShow.value = !isShow.value;
                                              typegol.value = "B";
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(child: Text("B")),
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              isShow.value = !isShow.value;
                                              typegol.value = "AB";
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(child: Text("AB")),
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              isShow.value = !isShow.value;
                                              typegol.value = "O";
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(child: Text("O")),
                                            )),
                                      ],
                                    )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              });
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          // color: primer,
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            color: primer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'Lihat Stok Darah',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        height: 150.0,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: mockJadwal.map((e) => _boxes(e)).toList())),
      ),
    );
  }

  Widget _boxes(Jadwal jadwal) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(jadwal.latitude!, jadwal.longitude!);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                child: Text(
                                  jadwal.nameStand!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Icon(Icons.timelapse),
                                    ),
                                    Container(
                                      child: Text(
                                        jadwal.waktu!,
                                        style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Icon(Icons.location_on),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(left: 10),
                                    width: 170,
                                    // color: Colors.black,
                                    child: Text(
                                      jadwal.location!,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 12),
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black,
                                image: DecorationImage(
                                    image: NetworkImage(jadwal.picture!),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target:
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 20,
        ),
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.blueGrey,
            width: 10,
          )
        },
        markers: {
          Marker(
            markerId: MarkerId('gramercy'),
            position: LatLng(-0.927115004362968, 100.42774221215359),
            infoWindow: InfoWindow(title: 'Gramercy Tavern'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
          ),
          Marker(
            markerId: MarkerId('bernardin'),
            position: LatLng(-0.930514848138482, 100.4316722452977),
            infoWindow: InfoWindow(title: 'Le Bernardin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
          ),
          Marker(
            markerId: MarkerId('bluehill'),
            position: LatLng(40.732128, -73.999619),
            infoWindow: InfoWindow(title: 'Blue Hill'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
          ),
          Marker(
            icon: currentLocationIcon,
            markerId: MarkerId("currentLocation"),
            position:
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),
          // Marker(
          //   icon: sourceIcon,
          //   markerId: MarkerId("source"),
          //   position: sourceLocation,
          // ),
          Marker(
            icon: destinationIcon,
            markerId: MarkerId("destination"),
            position: destinationLatlng,
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
          showLocationPins();
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 25,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
