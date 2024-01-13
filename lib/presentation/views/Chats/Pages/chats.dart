import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/presentation/views/ComingSoon/Pages/coming_soon.dart';

class ChatsPage extends ConsumerStatefulWidget {
  static const routeIdentifier = "CHATS_PAGE";
  const ChatsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoonPage();
  }
}
