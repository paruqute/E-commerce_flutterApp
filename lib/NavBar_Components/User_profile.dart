import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constraints.dart';
import '../constraints.dart';
import '../constraints.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(
            color:backgroundColor, fontWeight: FontWeight.w500, fontSize: 18.0),),
      ),
      body: Container(

        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 110,
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/a.jpg'),
                    ),
                    Positioned(
                      right: -1,
                      bottom: 0,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.grey),
                          ),
                          color: Color(0xFFF6F9F5),
                          onPressed: () {},
                          child: Icon(Icons.camera_alt,size: 20,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/user (1).svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/social-care.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: 'assets/icons/exit.svg',
              press: () {},
            ),
          ],
        )
      ),
    );
  }
}



class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white54,
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: PrimaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
