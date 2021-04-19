
import 'package:dapp/Screens/MyBag.dart';
import 'package:dapp/Screens/viewpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constraints.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
        Padding(
        padding: const EdgeInsets.only(bottom: DefaultPadding),
        child: SizedBox(
          height: 580,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: DefaultPadding * 2),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: IconCard(icon: "assets/reply-message.svg")),
                      GestureDetector(
                        onTap: (){

                        },
                          child: IconCard(icon: "assets/paintbrush.svg")),
                      IconCard(icon: "assets/crop.svg"),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DemoPage()));
                        },
                          child: IconCard(icon: "assets/3d-film.svg")),
                      IconCard(icon: ""),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                height: size.height ,
                width: size.width * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(63),
                    bottomLeft: Radius.circular(63),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 60,
                      color: PrimaryColor.withOpacity(0.29),
                    ),
                  ],
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/car/1.jpg"),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 500,right: 120),
                  child: Column(
                    children: [
                      Text("NAME   :  ART",style: TextStyle(color: Colors.white),),
                      Text("PRICE   :  ₹440",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
            // TitleAndPrice(title: "Angelica", country: "Russia", price: 440),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: size.width / 2,
                    height: 60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                        ),
                      ),
                      color: PrimaryColor,
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOutPage(),
                          ),
                        );
                      },
                      child: Text("Add to Cart"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class IconCard extends StatelessWidget {
  const IconCard({
    Key key,
    this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(DefaultPadding / 2),
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: PrimaryColor.withOpacity(0.22),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          ),
        ],
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
