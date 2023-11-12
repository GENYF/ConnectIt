import 'package:connectit/models/application_user.dart';
import 'package:connectit/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/post_it.dart';
import '../models/sns_ids.dart';
import '../services/authentication_service.dart';

class ProfileProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  final AuthenticationService _authenticationService = AuthenticationService();

  ApplicationUser? _user;
  PostIt? _postIt;

  get user => _user;
  get postIt => _postIt;
  
  Future<void> initialize({required User user}) async {
    await setUser(user: user).then((_) async {
      await _load();
    });
  }

  Future<void> _load() async {
    await _firestoreService.readUserCollection(user: _user!).then((value) {
      _user = value?.user;
      _postIt = value?.postIt;
    });

    notifyListeners();
  }

  Future<void> setUser({
    required User user,
  }) async {
    _user = ApplicationUser.initialize(
      uid: user.uid,
      name: user.displayName ?? 'Anonymous',
      email: user.email,
      photoURL: user.photoURL,
    );

    await _firestoreService.createUserCollection(user: _user!);

    notifyListeners();
  }

  Future<void> setPostIt({
    required String title,
    required String description,
    required String mbti,
    required String hobbies,
    required String topics,
    required String kakaotalkId,
    required String instagramId,
    required String facebookId,
  }) async {
    _postIt = PostIt.initialize(
      uid: _user!.uid,
      title: title,
      description: description,
      mbti: mbti,
      hobbies: hobbies.replaceAll(' ', '').split(','),
      topics: topics.replaceAll(' ', '').split(','),
      snsIds: SnsIds.initialize(
        kakaotalk: kakaotalkId,
        instagram: instagramId,
        facebook: facebookId,
      ),
    );

    await _firestoreService.updateUserCollection(
      user: _user!,
      postIt: postIt,
    );

    notifyListeners();
  }

  Future<void> signOut() async {
    await _authenticationService.signOut();

    notifyListeners();
  }

  Future<void> withdraw () async {
    await _firestoreService.deleteUserCollection(uid: _user!.uid!);
    await _firestoreService.deleteBoardCollection(uid: _user!.uid!);
    await _firestoreService.deleteStorageCollection(uid: _user!.uid!);

    await signOut();
  }
}
