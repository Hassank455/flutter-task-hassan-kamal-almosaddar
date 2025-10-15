import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/bloc_observer.dart';
import 'package:flutter_task/core/di/dependency_injection.dart';
import 'package:flutter_task/flutter_task_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>([setupGetIt()]);
  Bloc.observer = MyBlocObserver();
  runApp(const FlutterTaskApp());
}
