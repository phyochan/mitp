import 'package:flutter/material.dart';
import 'package:mobile_isp/showTestPoint.dart';

class TestPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency Test Point"),
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final titles = ['Oppo', 'Vivo', 'Huawei','Xiaomi', 'Other'];

  final image = [
    AssetImage('assets/images/oppo.png'),
    AssetImage('assets/images/vivo.png'),
    AssetImage('assets/images/huawei.png'),
    AssetImage('assets/images/xiaomi.png'),
    AssetImage('assets/images/other.png')
    
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        //                           <-- Card widget
        child: ListTile(
          leading: CircleAvatar(backgroundImage: image[index]),
          title: Text(titles[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShowTestPoint(title: titles[index])),
            );
          },
        ),
      );
    },
  );
}
