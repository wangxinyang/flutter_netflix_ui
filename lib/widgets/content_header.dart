import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sintel.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            child: SizedBox(
              width: 250,
              child: Image.asset("assets/images/sintel_title.png"),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  iconData: Icons.add,
                  text: "List",
                  onTab: () => print("List"),
                ),
                FlatButton(
                  onPressed: () => print("play"),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Play",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white,
                ),
                VerticalIconButton(
                  iconData: Icons.info_outline,
                  text: "Info",
                  onTab: () => print("Info"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
