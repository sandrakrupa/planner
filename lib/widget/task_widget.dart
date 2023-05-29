import 'package:flutter/material.dart';
import 'package:planner/core/fonts_palette.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
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
              color: Color.fromARGB(194, 223, 218, 218).withOpacity(0.2),
              spreadRadius: 2,
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
                        color: Color.fromARGB(255, 78, 78, 99),
                      ),
                      Text('9.00 AM - 11.00 AM', style: textSMboldgrey600),
                    ],
                  ),
                  const Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: Color.fromARGB(255, 78, 78, 99),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Bangtan, Bangtan, Bangtan', style: textSMregular),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
