import 'package:dog_breeds/components/decoration/app_icon.dart';
import 'package:dog_breeds/model/book_data.dart';
import 'package:dog_breeds/screens/menu_screen/book_card.dart';
import 'package:flutter/material.dart';

import 'menu_screen/arc_clipper.dart';

class GradientMenuScreen extends StatelessWidget {
  final BookData book;

  const GradientMenuScreen({this.book});

  static List<Color> gradient = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildBackground(context),
          _buildForeground(context),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: ClipPath(
            clipper: ArcClipper(),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: gradient,
                  )),
                ),
                Center(
                  child: SizedBox(
                    height: deviceSize.height / 8,
                    width: deviceSize.width / 2,
                    child: AppIcon(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(),
        ),
      ],
    );
  }

  Widget _buildForeground(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(48),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookCard(
                image: AppIcon(),
                title: Text('Dogs'),
                description: Text('Bottom text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
