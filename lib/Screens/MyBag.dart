import 'package:dapp/Screens/address/add_address_page.dart';
import 'package:dapp/Screens/payment/components/card/Credit.dart';
import 'package:dapp/components/credit_card.dart';
import 'package:dapp/components/shop_item_list.dart';
import 'package:dapp/constraints.dart';
import 'package:dapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

enum PaymentSources { google, paypal, apple,paytm }

class CheckOutPage extends StatefulWidget {
  CheckOutPage({Key key}) : super(key: key);
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  PaymentSources _site = PaymentSources.google;
  SwiperController swiperController = SwiperController();

  List<Product> products = [
    Product(
        'assets/car/1.jpg',
        'Boat roackerz 400 On-Ear Bluetooth Headphones',
        'description',
        450000),
    Product(
        'assets/images/b.jpg',
        'Boat roackerz 100 On-Ear Bluetooth Headphones',
        'description',
        450000),
    Product(
        'assets/images/c.jpg',
        'Boat roackerz 300 On-Ear Bluetooth Headphones',
        'description',
        500000)
  ];

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AddAddressPage())),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: PrimaryColor,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Check Out",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: PrimaryColor),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.wallet_travel),
            // onPressed: () => Navigator.of(context).push(
            //     MaterialPageRoute(builder: (_) => UnpaidPage())
            //     ),
          )
        ],
        title: Text(
          'Checkout',
          style: TextStyle(
              color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  height: 48.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            color: PrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        products.length.toString() + ' items',
                        style: TextStyle(
                            color: darkGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (_, index) => ShopItemList(products[index],onRemove: (){
                        setState(() {
                          products.remove(products[index]);
                        });
                      },),
                      itemCount: products.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Select Payment Method',
                    style: TextStyle(
                        fontSize: 20,
                        color: darkGrey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Swiper(
                    itemCount: 1,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Crid()));
                        },
                          child: CreditCard());
                    },
                    scale: 0.8,
                    controller: swiperController,
                    viewportFraction: 0.6,
                    loop: false,
                    fade: 0.7,
                  ),
                ),
                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right:20,left: 5),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Google",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16 ),),
                    trailing: Image.asset("assets/images/google.png",height: 25,),
                    leading:
                    Radio(
                      activeColor: Colors.green[800],
                      value: PaymentSources.google,
                      groupValue: _site,
                      onChanged: (PaymentSources value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Paypal",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16 ),),
                    trailing: Image.asset("assets/images/payp.png",height: 25,),
                    leading:
                    Radio(
                      activeColor: Colors.green[800],
                      value: PaymentSources.paypal,
                      groupValue: _site,
                      onChanged: (PaymentSources value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Paytm",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16 ),),
                    trailing: Image.asset("assets/images/paytms.png",height: 30,),
                    leading:
                    Radio(
                      activeColor: Colors.green[800],
                      value: PaymentSources.paytm,
                      groupValue: _site,
                      onChanged: (PaymentSources value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Apple Pay",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16 ),),
                    trailing: Image.asset("assets/images/apple.png",height: 25,),
                    leading:
                    Radio(
                      activeColor: Colors.green[800],
                      value: PaymentSources.apple,
                      groupValue: _site,
                      onChanged: (PaymentSources value) {
                        setState(() {
                          _site = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
                SizedBox(height: 24),
                Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom == 0
                              ? 20
                              : MediaQuery.of(context).padding.bottom),
                      child: checkOutButton,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    LinearGradient grT = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
