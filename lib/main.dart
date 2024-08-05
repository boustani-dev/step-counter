import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/app/home_screen.dart';
import 'package:step_counter/features/stop_watch/bloc/stop_watch_bloc.dart';
import 'package:step_counter/features/stop_watch/ticker.dart';

import 'features/step_counter/bloc/step_counter_bloc.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Step Counter',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => StopWatchBloc(ticker: const Ticker()),
          ),
          BlocProvider(
            create: (_) => StepCounterBloc(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
