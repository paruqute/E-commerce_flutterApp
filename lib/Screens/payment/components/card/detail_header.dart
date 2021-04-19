import 'package:dapp/components/glitch.dart';
import 'package:dapp/constraints.dart';
import 'package:flutter/material.dart';


class DetailHeader extends StatelessWidget {
  final double sheetProgress;

  const DetailHeader({Key key, this.sheetProgress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Align(
        alignment: Alignment.topCenter,
        child: Transform.scale(
          scale: 1 - (sheetProgress * 20),
          alignment: Alignment.topCenter,
          child: Column(
            children: [

          GlithEffect(
            child: Text(
              'Rotate the card to view the security code', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            ),)
            ],
          ),
        ),
      ),
    );
  }
}
