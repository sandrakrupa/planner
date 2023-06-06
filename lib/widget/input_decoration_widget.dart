import 'package:flutter/material.dart';

class InputDecorationWidget extends StatelessWidget {
  final Widget child;
  const InputDecorationWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 101, 101, 101).withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
