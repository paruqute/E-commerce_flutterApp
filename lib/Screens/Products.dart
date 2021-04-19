import 'package:dapp/Screens/BottamNav.dart';
import 'package:dapp/Screens/Nav.dart';
import 'package:dapp/Screens/Recommend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constraints.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30,left: 280),
              decoration: BoxDecoration(
                color: PrimaryColor
              ),
              height: 60,
              width: double.infinity,
              child: IconButton(
                icon: Icon(Icons.shopping_basket_rounded,size: 25,color: Colors.white,),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: DefaultPadding * 1),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      left: DefaultPadding,
                      right: DefaultPadding,
                      top: 15+DefaultPadding,
                      bottom: 25+ DefaultPadding,
                    ),
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Welcome',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline5
                              .copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            horizontal: DefaultPadding),
                        padding: EdgeInsets.symmetric(
                            horizontal: DefaultPadding),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
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
                            Expanded(
                              child: TextField(
                                onChanged: (value) {},
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: PrimaryColor.withOpacity(0.5),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            SvgPicture.asset("assets/search.svg"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [

                Container(
                  height: 24,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: DefaultPadding / 2),
                        child: Text(
                          "Recommended",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight
                              .bold),
                        ),
                      ),
                    ],
                  ),
                ), SizedBox(width: 105,),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: PrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "More",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Recomends(),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: DefaultPadding / 2),
                        child: Text(
                          "Featured Products",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight
                              .bold),
                        ),
                      ),
                    ],
                  ),
                ), SizedBox(width: 90,),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: PrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "More",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Recomends(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Nav(),
    );
  }
}
