import 'package:audio_service/audio_service.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:radioapp/core/app_theme.dart';
import 'package:radioapp/core/view_model/audio_player_handler.dart';
import 'package:radioapp/features/dashboard/presentation/view/dashboard_view.dart';

late AudioPlayerHandler audioHandler;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.notification.request();

  audioHandler = await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'radio.channel',
      androidNotificationChannelName: 'Radio App',
      androidNotificationOngoing: true,
    ),
  );

  await dotenv.load(fileName: ".env");
  await EncryptedSharedPreferences.initialize(dotenv.env['ENCRYPT_PREF_KEY']!);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RadioHub',
      theme: AppTheme.darkTheme,
      home: const DashboardView(),
    );
  }
}
