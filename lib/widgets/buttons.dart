import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color fontColor;
  final bool isLarge;
  final Function onPressed;

  const BuildButton({
    super.key,
    this.color = const Color(0xFF505050),
    required this.text,
    this.fontColor = Colors.white,
    this.isLarge = false,
    this.onPressed = defaultFunction,
  });

  static void defaultFunction() {
    print('default function');
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey key = GlobalKey();

    void _getPositionAndSize() {
      RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
      Offset position =
          box.localToGlobal(Offset.zero); //this is global position
      double y = position.dy;
      double x = position.dx;
      double width = box.size.width;
      double height = box.size.height;
      print('x: $x, y: $y, width: $width, height: $height');
    }

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        key: key,
        height: 70,
        width: isLarge
            ? ((MediaQuery.of(context).size.width - (70 * 4)) / 5) + 140
            : 70,
        child: ElevatedButton(
          onPressed: (() => {onPressed()}),
          style: ElevatedButton.styleFrom(
            shape: isLarge
                ? const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  )
                : const CircleBorder(),
            backgroundColor: color,
            padding: isLarge ? const EdgeInsets.only(left: 25) : null,
          ),
          child: Align(
            alignment: isLarge ? Alignment.centerLeft : Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: fontColor,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
