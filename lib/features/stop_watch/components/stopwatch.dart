import 'package:flutter/material.dart';
import 'package:step_counter/core/colors.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height / 4.5,
      width: size.height / 4.5,
      child: Stack(
        children: [
          Container(
            height: size.height / 4.5,
            width: size.height / 4.5,
            decoration: const BoxDecoration(
                color: AppColors.primary, shape: BoxShape.circle),
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 30,
              strokeCap: StrokeCap.butt,
              backgroundColor: Colors.white,
              color: AppColors.secondary.withOpacity(0.8),
            ),
          ),
          Positioned(
            top: 80,
            left: 55,
            child: Text(
              '15:00',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
