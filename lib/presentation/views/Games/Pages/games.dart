import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/presentation/views/ComingSoon/Pages/coming_soon.dart';

class GamesPage extends ConsumerStatefulWidget {
  static const routeIdentifier = "GAMES_PAGE";
  const GamesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GamesPageState();
}

class _GamesPageState extends ConsumerState<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoonPage();
  }
}
