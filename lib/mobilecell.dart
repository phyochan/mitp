import 'package:flutter/material.dart';
import 'mobile.dart';
 
class MobileCell extends StatelessWidget {
  const MobileCell(this.context, this.mobile);
  @required
  final Mobile mobile;
  final BuildContext context;
 
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding:
            EdgeInsets.only(left: 5.0, right: 5.0, bottom: 0.0, top: 5.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: FadeInImage.assetNetwork(            
                   image:mobile.photo,
                  placeholder: "assets/images/placeholder.jpg",
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                 mobile.name,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}