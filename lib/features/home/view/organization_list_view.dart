import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:protect_ua_women/features/home/home.dart';

class OrganizationListView extends StatelessWidget {
  const OrganizationListView({Key? key, required this.pois}) : super(key: key);

  final Future<List<POI>> pois;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          'Points of interest',
          style: TextStyle(
            color: Color.fromRGBO(27, 50, 132, 1),
            fontWeight: FontWeight.w300,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Ink(
              width: 30,
              height: 30,
              decoration: const ShapeDecoration(
                color: Color.fromRGBO(27, 50, 132, 1),
                shape: CircleBorder(),
              ),
              child: IconButton(
                splashRadius: 15,
                iconSize: 10,
                onPressed: () => AutoRouter.of(context).pop(),
                icon: const Icon(
                  Icons.close_rounded,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: FutureBuilder(
          future: pois,
          builder: (BuildContext context, AsyncSnapshot<List<POI>> snapshot) {
            if (snapshot.hasData) {
              List<POI> poiList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: poiList.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: OrganizationCard(poi: poiList[index]
                      // currentPosition: snapshot.data!,
                      ),
                ),
              );
            } else {
              return const Center(
                child: SpinKitCircle(color: primaryColor),
              );
            }
          },
        ),
      ),
    );
  }
}
