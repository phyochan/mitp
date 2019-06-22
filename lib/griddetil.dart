import 'package:flutter/material.dart';
import 'mobile.dart';


class GridDetails extends StatefulWidget {
  final Mobile curMobile;
  GridDetails({@required this.curMobile});

  @override
  GridDetailsState createState() => GridDetailsState();
}

class GridDetailsState extends State<GridDetails> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "image${widget.curMobile.id}",
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/placeholder.jpg",
                image: widget.curMobile.photo,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            OutlineButton(
              child: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
