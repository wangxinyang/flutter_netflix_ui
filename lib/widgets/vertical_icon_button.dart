import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final Function onTab;
  final IconData iconData;
  final String text;
  const VerticalIconButton({
    Key key,
    this.onTab,
    this.iconData,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Column(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
