import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:test_effective/src/di/di_container.dart';
import 'package:test_effective/src/presentation/navigation/app_router.dart';
import 'package:test_effective/src/presentation/theme/app_theme.dart';

void main() {
  Logger.root
    ..level = Level.ALL
    ..onRecord.listen(_onRecord);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final _log = Logger('App');

  final appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {

    _log.info('build MainApp');

    return DiContainer(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: appRouter,
        theme: appTheme.light,
        darkTheme: appTheme.dark,
      ),
    );
  }
}

void _onRecord(LogRecord record) {
  final time = record.time;
  final formatedTime = '${time.hour}:${time.minute}:${time.second}';
  debugPrint('${record.level.name}: [${record.loggerName}]: $formatedTime: ${record.message}');
}
