import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:test_effective/src/di/di_container.dart';
import 'package:test_effective/src/presentation/navigation/app_router.dart';
import 'package:test_effective/src/presentation/theme/app_theme.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    final time = record.time;
    final formatedTime = '${time.hour}:${time.minute}:${time.second}';
    debugPrint(
      '${record.level.name}: [${record.loggerName}]: $formatedTime: ${record.message}',
    );
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DiContainer(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: appRouter,
        theme: AppTheme().light,
      ),
    );
  }
}
