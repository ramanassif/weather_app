import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GenericLoader extends StatelessWidget {
  const GenericLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.twistingDots(
      leftDotColor: Colors.black,
      rightDotColor: Colors.grey,
      size: 24,
    ));
  }
}
