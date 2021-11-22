import 'package:flutter/material.dart';
import 'package:bloc_demo/models/albums_list.dart';
import 'package:bloc_demo/screens/second_page.dart';
import 'txt.dart';

class ListRow extends StatelessWidget {
  final Album album;
  ListRow({required this.album});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.yellow
      ),
      // color: Colors.yellow,
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      // padding: EdgeInsets.only(left: 20,right: 20,top: 5,),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PageScreen()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt(text: album.title),
            Txt(text: '操事'),
            // Divider(),
          ],
        ),
      )
    );
  }
}

