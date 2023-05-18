import 'package:flutter/material.dart';

class TextOverInputWidget extends StatelessWidget {
  const TextOverInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      alignment: Alignment.centerLeft,
      child: const Text(
        'Email Address',
      ),
    );
  }
}
