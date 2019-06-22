import 'package:flutter/material.dart';
import 'package:mobile_isp/Service.dart';
import 'package:mobile_isp/mobile.dart';
import 'package:mobile_isp/mobilecell.dart';
import 'dart:async';
import 'griddetil.dart';

class ShowTestPoint extends StatefulWidget {
  final String title;
  ShowTestPoint({Key key, @required this.title}) : super(key: key);

  @override
  ShowTestPointState createState() => ShowTestPointState();
}

class ShowTestPointState extends State<ShowTestPoint> {
  //
  StreamController<int> streamController = new StreamController<int>();

  gridview(AsyncSnapshot<List<Mobile>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data.map(
          (mobile) {
            return GestureDetector(
              child: GridTile(child: MobileCell(context, mobile)),
              onTap: () {
                goToDetailsPage(context, mobile);
              },
            );
          },
        ).toList(),
      ),
    );
  }

  goToDetailsPage(BuildContext context, Mobile mobile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GridDetails(
              curMobile: mobile,
            ),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: StreamBuilder(
        initialData: 0,
        stream: streamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Text('${widget.title}');
        },
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: FutureBuilder<List<Mobile>>(
              future:
                  Services.getPhotos("testpoint", widget.title.toLowerCase()),
              builder: (context, snapshot) {
                // not setstate here
                //
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                }
                //
                if (snapshot.hasData) {
                  streamController.sink.add(snapshot.data.length);
                  // gridview
                  return gridview(snapshot);
                }

                return circularProgress();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
