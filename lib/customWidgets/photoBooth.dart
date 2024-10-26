import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Photobooth extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.green[200],
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.account_circle_sharp),
              Expanded(child: Column(children: [Text('UserName'),Text('Userdata')],)),
              Icon(Icons.more_vert)
            ],
          ),
          Expanded(child: Container(color: Colors.pink[200],)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.heart_broken),
                  Icon(Icons.message),
                  Icon(Icons.share)
                ],
              ),
              Icon(Icons.bookmark_border)
            ],
          )
        ],
      ),
    );
  }
}