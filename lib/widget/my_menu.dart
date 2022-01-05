import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_widget.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  double turn = 1;
  bool isRotated = false;
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 400,
      width: isRotated ? 80 : 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            child: IconWidget(
              text: "Home",
              icon: FontAwesomeIcons.home,
              isExpanded: isExpanded,
            ),
          ),
          Positioned(
            top: 50,
            child: IconWidget(
              text: "Profile",
              icon: FontAwesomeIcons.user,
              isExpanded: isExpanded,
            ),
          ),
          Positioned(
            top: 100,
            child: IconWidget(
              text: "Message",
              icon: FontAwesomeIcons.facebookMessenger,
              isExpanded: isExpanded,
            ),
          ),
          Positioned(
            top: 150,
            child: IconWidget(
              text: "Help",
              icon: FontAwesomeIcons.question,
              isExpanded: isExpanded,
            ),
          ),
          Positioned(
            top: 200,
            child: IconWidget(
              text: "Setting",
              icon: FontAwesomeIcons.servicestack,
              isExpanded: isExpanded,
            ),
          ),
          Positioned(
            top: 250,
            child: IconWidget(
              text: "Password",
              icon: FontAwesomeIcons.lock,
              isExpanded: isExpanded,
            ),
          ),
          Positioned(
            top: 300,
            child: IconWidget(
              text: "Sign out",
              icon: FontAwesomeIcons.signOutAlt,
              isExpanded: isExpanded,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: isExpanded ? -25 : -5,
                top: 175,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isRotated = !isRotated;
                      isExpanded = !isExpanded;
                    });
                  },
                  mouseCursor: SystemMouseCursors.click,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      border: Border.all(
                        color: Colors.indigo,
                        width: 5.0,
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 500),
                          turns: isRotated ? 1 : 0.5,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 32,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
