import 'package:flutter/material.dart';

class ShadowImage extends StatelessWidget {
  final double heightValue;

  const ShadowImage({
    Key? key,
    required this.heightValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightValue,
      child: Image.asset('assets/images/shadow.png'),
    );
  }
}
