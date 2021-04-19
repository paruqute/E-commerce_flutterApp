
import 'package:dapp/models/credit_card.dart';
import 'package:flutter/material.dart';


class BackCard extends StatelessWidget {
  final CreditCard card;

  const BackCard({Key key, this.card}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: card.colors[1]),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 50,
                color: card.colors[0],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 10,
                    right: 5),
                padding: EdgeInsets.only(right:10),
                height: 38,
                width: 50,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(card.securityCode),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 10,top: 5),
                child: Text("Service Hotline / 028-6577",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
