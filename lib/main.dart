import 'package:bharatnova_app/presentation/screens/home_screen.dart';
import 'package:bharatnova_app/providers/feed_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/utils/permission_handler_service.dart';
import 'providers/location_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PermissionService.requestAllPermissions();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => FeedProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}