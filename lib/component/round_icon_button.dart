import 'package:flutter/material.dart';

class roundIconButton extends StatelessWidget {
  roundIconButton({@required this.icon , @required this.onpress});
  final IconData icon ;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      shape:CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

