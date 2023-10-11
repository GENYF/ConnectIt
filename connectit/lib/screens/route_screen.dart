import 'package:connectit/providers/profile_provider.dart';
import 'package:connectit/screens/tab/tab_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              future: _initializationUser(context: context, user: user.data!),
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

  Future<bool> _initializationUser({required BuildContext context, required User user}) async {
    final profileProvider = context.read<ProfileProvider>();

    await profileProvider.initialize(user: user).then((value) async {
      await profileProvider.reload();
    });

    return true;
  }
}
