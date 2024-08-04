import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/core/colors.dart';
import 'package:step_counter/features/stop_watch/bloc/stop_watch_bloc.dart';
import 'package:step_counter/features/stop_watch/ticker.dart';

import '../features/stop_watch/components/stopwatch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: Stack(
          children: [
            Container(
              height: size.height / 3,
              width: size.width,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 0))
                  ],
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(180),
                      bottomLeft: Radius.circular(180))),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Steps',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 55),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '1145',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const StopWatch(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
