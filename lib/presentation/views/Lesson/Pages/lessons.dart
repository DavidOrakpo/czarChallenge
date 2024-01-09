import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonsPage extends ConsumerStatefulWidget {
  static const routeIdentifier = "LESSONS_PAGE";
  const LessonsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LessonsPageState();
}

class _LessonsPageState extends ConsumerState<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Lessons Page"),
      ),
    );
  }
}
