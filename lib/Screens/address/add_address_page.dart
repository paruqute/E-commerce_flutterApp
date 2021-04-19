import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dapp/Screens/address/User_location.dart';
import '../../constraints.dart';
import '../../constraints.dart';
import '../../constraints.dart';
import '../../constraints.dart';
import '../../constraints.dart';
import '../../constraints.dart';
import '../../constraints.dart';
import '../../constraints.dart';
import '../../constraints.dart';
import 'address_form.dart';
class AddAddressPage extends StatefulWidget {

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _product=TextEditingController();

  TextEditingController _state=TextEditingController();

  TextEditingController _city=TextEditingController();

  TextEditingController _name=TextEditingController();

  TextEditingController _phone=TextEditingController();

  TextEditingController _house=TextEditingController();

  TextEditingController _landmark=TextEditingController();

  TextEditingController _district=TextEditingController();
  TextEditingController _pincode=TextEditingController();


  final GlobalKey _formGlobalKey=GlobalKey();



  FocusNode _phoneFocusNode, _nameFocusNode,_houseFocusNode,_districtFocusNode,_landmarkFocusNode,_productFocusNode,
      _stateFocusNode,_cityFocusNode,_pincodeFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneFocusNode=FocusNode();
    _nameFocusNode=FocusNode();
    _houseFocusNode=FocusNode();
    _pincodeFocusNode=FocusNode();
    _landmarkFocusNode=FocusNode();
    _districtFocusNode=FocusNode();
    _productFocusNode=FocusNode();
    _stateFocusNode=FocusNode();
    _cityFocusNode=FocusNode();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneFocusNode=FocusNode();
    _nameFocusNode=FocusNode();
    _houseFocusNode=FocusNode();
    _pincodeFocusNode=FocusNode();
    _landmarkFocusNode=FocusNode();
    _districtFocusNode=FocusNode();
    _productFocusNode=FocusNode();
    _stateFocusNode=FocusNode();
    _cityFocusNode=FocusNode();

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
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
          'Address',
          style: TextStyle(
              color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formGlobalKey,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextFormField(
                  controller: _name,
                  autofocus: true,
                  focusNode: _nameFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_nameFocusNode);
                  },
                  decoration: InputDecoration(

                    hintText: "Full Name (Required) *",


                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                    ),

                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _phone,
                  focusNode: _phoneFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_nameFocusNode);
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10)
                  ],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(

                    hintText: "Phone Number (Required) *",

                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.length!=10) {
                      return 'Enter a valid phone number';
                    }

                    return null;
                  },
                ),
               SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(

                        controller:_pincode,
                        focusNode:_pincodeFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nameFocusNode);
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                        ],
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(


                          hintText: "Pin Code (Required)*",

                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Your Pin Code';
                          }
                          return null;
                        },
                      ),
                      flex: 4,
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child:GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>GpsUser()));
                        },
                        child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            color: PrimaryColor.withOpacity(0.5)

                          ),
                          child:Row(
                            children: [
                              SizedBox(width: 5,),
                              Icon(Icons.my_location, color: backgroundColor,size: 20,),
                              SizedBox(width: 5,),
                              Text("Use my location",style: TextStyle(
                                color: backgroundColor,
                                fontSize: 15,

                              ),)
                            ],

                          ),

                        ),
                      ),

                      flex: 4,
                    ),
                  ],
                ),

                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(

                        controller:_state,
                        focusNode:_stateFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nameFocusNode);
                        },

                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(


                          hintText: "State",

                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Your State';
                          }
                          return null;
                        },
                      ),
                      flex: 4,
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextFormField(
                        controller: _city,
                        focusNode: _cityFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_nameFocusNode);
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(5),
                        ],
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(


                          hintText: "City (Required) *",

                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Your City';
                          }
                          return null;
                        },
                      ),
                      flex: 4,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _house,
                  focusNode: _houseFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_nameFocusNode);
                  },

                  decoration: InputDecoration(

                    hintText: "House No",

                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your House No';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _district,
                  focusNode:_districtFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_nameFocusNode);
                  },
                  decoration: InputDecoration(


                    hintText: "District",

                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your district';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _landmark,
                  focusNode: _landmarkFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_nameFocusNode);
                  },
                  decoration: InputDecoration(


                    hintText: "Landmark",

                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your locality';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20,),

                SizedBox(height: 20,),

                SizedBox(height: 20),
                Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom == 0
                              ? 20
                              : MediaQuery.of(context).padding.bottom),
                      child: InkWell(

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
                            child: Text("Pay Now",
                                style: const TextStyle(
                                    color: const Color(0xfffefefe),
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0)),
                          ),
                        ),
                        onTap: (){
                          final FormState form = _formGlobalKey.currentState;
                          if(form.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAddressForm()));
                          }

                        },
                      ),
                    ))



              ],
            ),
          ),
        ),
      ),

    );
  }
}
