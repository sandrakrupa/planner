import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(colors: [
        Color.fromRGBO(36, 52, 139, 0.872),
        Color.fromARGB(119, 188, 221, 249)
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
          .createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/tlo.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(163, 163, 169, 211).withOpacity(0.7),
              BlendMode.color,
            ),
          ),
        ),
      ),
    );
  }
}
