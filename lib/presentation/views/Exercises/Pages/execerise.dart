import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExercisePage extends ConsumerStatefulWidget {
  static const routeIdentifier = "EXERCISE_PAGE";
  const ExercisePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Exercise Page"),
      ),
    );
  }
}
