import 'package:connectit/providers/board_provider.dart';
import 'package:connectit/providers/profile_provider.dart';
import 'package:connectit/providers/storage_provider.dart';
import 'package:connectit/screens/route_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => BoardProvider()),
        ChangeNotifierProvider(create: (_) => StorageProvider()),
      ],
      child: MaterialApp(
        title: 'ConnectIt',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
          ),
        ),
        home: const RouteScreen(),
      ),
    );
  }
}