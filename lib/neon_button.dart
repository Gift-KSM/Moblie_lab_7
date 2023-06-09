import 'package:flutter/material.dart';

class NeonButton extends StatefulWidget {
  final Color shadowColor;
  const NeonButton(this.shadowColor, {Key? key}) : super(key: key);

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) => setState(() {
                      isPressed = true;
                    }),
                onPointerUp: (e) => setState(() {
                      isPressed = false;
                    }),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          for (double i = 1; i < 5; i++)
                            BoxShadow(
                                color: widget.shadowColor,
                                blurRadius: (isPressed ? 5 : 3) * i,
                                blurStyle: BlurStyle.outer),
                        ]),
                    child: TextButton(
                      onHover: (hovered) => setState(() {
                        isPressed = hovered;
                      }),
                      style: TextButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Neon Button',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              shadows: [
                                // Shadow(color: shadowColor, blurRadius: 3),
                                // Shadow(color: shadowColor, blurRadius: 6),
                                // Shadow(color: shadowColor, blurRadius: 9),
                                for (double i = 1; i < (isPressed ? 8 : 4); i++)
                                  Shadow(color: widget.shadowColor, blurRadius: 3 * i),
                              ]),
                        ),
                      ),
                    ),
                )
   );
  }
}
