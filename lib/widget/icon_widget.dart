import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    required this.text,
    required this.icon,
    required this.isExpanded,
    Key? key,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final bool isExpanded;

  @override
  _IconWidgetState createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  Color contColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      height: 40,
      width: 300,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onExit: (a) {
          setState(() {
            contColor = Colors.white;
          });
        },
        onEnter: (a) {
          setState(() {
            contColor = Colors.black12;
          });
        },
        onHover: (a) {},
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: contColor,
          ),
          duration: const Duration(milliseconds: 300),
          child: Stack(
            children: [
              Positioned(
                left: 5,
                top: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FaIcon(
                    widget.icon,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: widget.isExpanded ? 1 : 0,
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: widget.isExpanded ? 25 : 0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
