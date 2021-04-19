import 'package:dapp/constraints.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:imageview360/imageview360.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<AssetImage> imageList = List<AssetImage>();
  bool autoRotate = true;
  int rotationCount = 2;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 50);
  bool imagePrecached = false;

  @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:PrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 450,
                        margin: EdgeInsets.only(left: 30),
                        padding: EdgeInsets.only(top: 150,),
                      decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),)
                        ),
                        child: (imagePrecached == true)
                            ? ImageView360(
                          key: UniqueKey(),
                          imageList: imageList,
                          autoRotate: false,
                          rotationCount: 2,
                          rotationDirection: RotationDirection.anticlockwise,
                          frameChangeDuration: Duration(milliseconds: 170),
                          swipeSensitivity: swipeSensitivity,
                          allowSwipeToRotate: allowSwipeToRotate,
                        )
                            : Text("Pre-Caching images..."),
                      ),
                    ],
                  ),
            SizedBox(height:22),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CAR",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Hyundai",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 13,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          unratedColor: Colors.grey,
                          onRatingUpdate: (rating) {
                            //print(rating);
                          },
                        )
                      ],
                    ),
                    Text(
                      "\₹450,000",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 343,
                  child: Text(
                    "The 2020 All New Honda City has been launched in India. A fifth generation for the City, it is being offered in three trims that include V, VX and ZX. There are five colours including radiant red metallic, platinum pearl white, modern steel metallic, golden brown metallic and lunar silver metallic. The prices range from Rs 10.89 lakh to Rs 14.64 lakh (all prices, ex-showroom, Delhi)",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 1,
                      height: 1.5,
                    ),
                  ),
                ),
              ),


            Container(
              height: 200,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          color: PrimaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.only(bottom: 10,top: 10),
                      //margin: EdgeInsets.only(bottom: 2,top: 2),
                      //height: 50,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          index == 0
                              ? Icon(
                            Icons.av_timer,
                            size: 40,
                            color: Colors.grey[300],
                          )
                              : Icon(
                            Icons.add_road,
                            size: 40,
                            color: Colors.grey[300],
                          ),
                          index == 0
                              ? Text(
                            "410 KM/h",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.5,
                                color: Colors.grey[300]),
                          )
                              : Text(
                            "13.6L",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.5,
                                color: Colors.grey[300]),
                          )
                        ],
                      ));
                },
              ),
            ),

          ],
        ),
        ),

    );
  }

  void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 36; i++) {
      imageList.add(AssetImage('assets/car/$i.jpg'));
      //* To precache images so that when required they are loaded faster.
      await precacheImage(AssetImage('assets/car/$i.jpg'), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }
}