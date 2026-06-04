import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/providers/app_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  container.read(syncManagerProvider).demarrerEcoute();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const SiraApp(),
    ),
  );
}
