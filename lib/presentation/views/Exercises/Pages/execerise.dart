import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/presentation/views/ComingSoon/Pages/coming_soon.dart';

class ExercisePage extends ConsumerStatefulWidget {
  static const routeIdentifier = "EXERCISE_PAGE";
  const ExercisePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoonPage();
  }
}
