
import 'package:flutter/material.dart';
import 'package:zeleex_application/Plate.dart';

class ProgressHUD extends StatelessWidget {

  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;


  ProgressHUD({
    key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 1,
    this.color = Palette.kToDark,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
            child: new CircularProgressIndicator()
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}