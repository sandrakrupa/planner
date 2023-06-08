import 'package:flutter/material.dart';

Gradient navyBlueGradient = const LinearGradient(
  colors: [
    Color.fromARGB(255, 17, 28, 108),
    Color.fromARGB(187, 113, 129, 254),
  ],
  begin: Alignment.center,
  end: Alignment.topCenter,
);

Gradient redGradient = const LinearGradient(
  colors: [
    Color.fromARGB(255, 148, 54, 54),
    Color.fromARGB(184, 248, 166, 166),
  ],
  begin: Alignment.center,
  end: Alignment.topCenter,
);

BoxShadow greyShadow = BoxShadow(
  color: const Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
  spreadRadius: 5,
  blurRadius: 7,
  offset: const Offset(0, 3),
);
