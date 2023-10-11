import 'package:connectit/providers/profile_provider.dart';
import 'package:connectit/screens/tab/tab_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/board_provider.dart';
import 'loading_screen.dart';
import 'login/login_screen.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          return FutureBuilder(
              future: _initializationProvider(context: context, user: user.data!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const TabScreen();
                } else {
                  return const LoadingScreen();
                }
              }
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }

  Future<bool> _initializationProvider({required BuildContext context, required User user}) async {
    final profileProvider = context.read<ProfileProvider>();
    final boardProvider = context.read<BoardProvider>();

    await profileProvider.initialize(user: user).then((_) async {
      await boardProvider.initialize(user: profileProvider.user);
    });

    return true;
  }
}
