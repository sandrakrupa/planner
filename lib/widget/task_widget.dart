import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 100,
      color: Colors.transparent,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 17, 28, 108),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(194, 178, 173, 173)
                  .withOpacity(0.2),
              spreadRadius: 7,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('BTS, BTS', style: textMDbold),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Color.fromARGB(215, 90, 95, 107),
                      ),
                      Text('9.00 AM - 11.00 AM',
                          style: textSMregulargrey300),
                    ],
                  ),
                  const Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: Color.fromARGB(215, 90, 95, 107),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Bangtan, Bangtan, Bangtan',
                    style: textSMregular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
