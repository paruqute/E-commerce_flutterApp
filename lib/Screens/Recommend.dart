import 'package:dapp/Screens/Details.dart';
import 'package:flutter/material.dart';
import '../constraints.dart';

class Recomends extends StatelessWidget {
  const Recomends({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: <Widget>[
          RecomendCard(
            image: "assets/images/a.jpg",
            title: "Art",
            country: "India",
            price: 440,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                ),
              );
            },
          ),

          RecomendCard(
            image: "assets/car/1.jpg",
            title: "Car",
            country: "India",
            price: 450000,
            press: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(),
              ),
            );
            },
          ),
          RecomendCard(
            image: "assets/images/c.jpg",
            title: "Frames",
            country: "India",
            price: 440,
            press: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(),
              ),
            );
            },
          ),


        ],
    );
  }
}

class RecomendCard extends StatelessWidget {
  const RecomendCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: DefaultPadding,
        top: DefaultPadding / 2,
        bottom: DefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
              child: Image.asset(image)),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(DefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: PrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: PrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\₹$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: PrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}