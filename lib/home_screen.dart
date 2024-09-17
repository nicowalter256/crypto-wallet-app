import 'package:flutter/material.dart';
import 'package:dynamic_background/dynamic_background.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [

        ],
      )
    );
  }
}




/*
 DynamicBg(
        painterData: ScrollerPainterData(
          shape: ScrollerShape.squares,
          backgroundColor: ColorSchemes.gentleBlueBg,
          color: ColorSchemes.gentleBlueFg,
          shapeOffset: ScrollerShapeOffset.shiftAndMesh,
        ),
       // child: yourPageHere(),
      ),
 */