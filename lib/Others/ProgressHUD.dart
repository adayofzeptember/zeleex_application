import 'package:flutter/material.dart';
import 'Plate.dart';

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
    this.color =ZeleexColor.zeleexGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Center(child: CircularProgressIndicator(color: Colors.white,)),
       
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
 