import 'package:connectit/utils/design.dart';
import 'package:flutter/material.dart';

import 'components/login_buttons_by_platform.dart';
import 'components/signing_agreement_notice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/backgrounds/login_background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: const Alignment(0, -0.2),
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0.9),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'CONNECTIT',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      '흥미를 잇다. 사람을 잇다.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 150),
                    SigningAgreementNotice(
                      hasAgreed: _agreed,
                      onTappedAgreementButton: () => _onTappedAgreementButton(),
                    ),
                    const SizedBox(height: defaultSpacing),
                    LoginButtonsByPlatform(hasAgreed: _agreed),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTappedAgreementButton() {
    setState(() {
      _agreed = !_agreed;
    });
  }
}
