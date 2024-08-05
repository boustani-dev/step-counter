import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_counter/app/home_screen.dart';
import 'package:step_counter/features/history/bloc/history_bloc.dart';
import 'package:step_counter/features/history/view/history_screen.dart';
import 'package:step_counter/features/stop_watch/bloc/stop_watch_bloc.dart';
import 'package:step_counter/features/stop_watch/ticker.dart';

import 'data/provider/isar_service.dart';
import 'features/step_counter/bloc/step_counter_bloc.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarServices().db; // Ensure the database is initialized
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
          BlocProvider(
            create: (_) => HistoryBloc(),
          ),
        ],
        child: const HomeScreen(),
      ),
      routes: {
        HistoryScreen.routeName: (context) => const HistoryScreen(),
      },
    );
  }
}
