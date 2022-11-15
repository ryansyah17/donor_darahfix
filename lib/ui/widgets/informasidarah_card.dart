import 'dart:async';

import 'package:donor_darah/models/jadwal.dart';
import 'package:donor_darah/ui/pages/detailstokdarahpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StokDarahCard extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  // late double lat;
  // late double long;

  final Jadwal? jadwal;

  StokDarahCard(this.jadwal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(jadwal!.picture!),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                                child: Text(
                              jadwal!.nameStand!,
                              style: TextStyle(
                                  color: Color(0xff6200ee),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  child: Text(
                                "4.1",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                ),
                              )),
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: Colors.amber,
                                  size: 15.0,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: Colors.amber,
                                  size: 15.0,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: Colors.amber,
                                  size: 15.0,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: Colors.amber,
                                  size: 15.0,
                                ),
                              ),
                              Container(
                                child: Icon(
                                  FontAwesomeIcons.solidStarHalf,
                                  color: Colors.amber,
                                  size: 15.0,
                                ),
                              ),
                              Container(
                                  child: Text(
                                "(946)",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18.0,
                                ),
                              )),
                            ],
                          )),
                          SizedBox(height: 5.0),
                          Container(
                              child: Text(
                            "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18.0,
                            ),
                          )),
                          SizedBox(height: 5.0),
                          Container(
                              child: Text(
                            "Closed \u00B7 Opens 17:00 Thu",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  // Future<void> _gotoLocation(double lat, double long) async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //     target: LatLng(lat, long),
  //     zoom: 15,
  //     tilt: 50.0,
  //     bearing: 45.0,
  //   )));
  // }
}
