import 'package:connectit/enums/sign_in_method.dart';
import 'package:connectit/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  static final AuthenticationService _instance = AuthenticationService._internal();

  factory AuthenticationService() {
    return _instance;
  }

  AuthenticationService._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  SignInMethod? get signInMethod => _getCurrentLoginPlatform();

  Future<UserCredential?> signIn({SignInMethod? signInMethod}) async {
    switch (signInMethod) {
      case SignInMethod.GOOGLE:
        return await _signInWithGoogle();
      case SignInMethod.APPLE:
        return await _signInWithApple();
      default:
        throw Exception('login failure');
    }
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      UserCredential? userCredential;
      _googleSignIn.signIn().then((googleSignInAccount) {
        googleSignInAccount!.authentication.then((googleSignInAuthentication) {
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          _firebaseAuth.signInWithCredential(credential).then((userCredential) {
            userCredential = userCredential;
          }).catchError((e) {
            logger.e('[구글 로그인] failed to get firebase user credentials');
          });
        }).catchError((e) {
          logger.e('[구글 로그인] failed to get access token or idToken');
          return null;
        });
      }).catchError((e) {
        logger.e('[구글 로그인] 로그인 취소');
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      logger.e("파이어베이스 구글 로그인 에러.\n$e");
      rethrow;
    }
  }

  Future<UserCredential> _signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final AuthCredential credential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      logger.e("파이어베이스 애플 로그인 에러.\n$e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    SignInMethod? signInMethod = _getCurrentLoginPlatform();

    switch (signInMethod!) {
      case SignInMethod.APPLE:
        await _signOutFromApple();
        break;
      case SignInMethod.GOOGLE:
        await _signOutFromGoogle();
        break;
    }

    await _firebaseAuth.signOut().then((_) async {
      await _clearData();
    });
  }

  Future<void> _signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Future<void> _signOutFromApple() async {
    await _firebaseAuth.signOut();
  }

  /// append datas to delete when user signs out
  Future<void> _clearData() async {
    // 디스크 저장 내용 삭제
    await SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.clear();
    });
  }
}

extension Utils on AuthenticationService {
  SignInMethod? _getCurrentLoginPlatform() {
    User user = FirebaseAuth.instance.currentUser!;
    List<UserInfo> providerData = user.providerData;
    if (providerData.length != 1) {
      logger.e('provider data length not 1');
    }

    UserInfo currentProviderData = providerData.first;
    SignInMethod? currentSignInMethod;
    for (var platform in SignInMethod.values) {
      if (platform.domain == currentProviderData.providerId) {
        currentSignInMethod = platform;
      }
    }
    return currentSignInMethod;
  }
}
