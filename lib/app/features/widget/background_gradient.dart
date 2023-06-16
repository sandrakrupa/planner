import 'package:flutter/material.dart';

class BackgroundGradientWidget extends StatelessWidget {
  const BackgroundGradientWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 238, 246, 253),
          Color.fromARGB(255, 206, 232, 254)
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
    );
  }
}
