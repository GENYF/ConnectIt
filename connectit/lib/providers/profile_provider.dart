import 'package:connectit/models/application_user.dart';
import 'package:connectit/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/post_it.dart';
import '../models/sns_ids.dart';

class ProfileProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  ApplicationUser? _user;
  PostIt? _postIt;

  get user => _user;
  get postIt => _postIt;
  
  Future<void> initializeUser({required User user}) async {
    _user = ApplicationUser.initialize(
      uid: user.uid,
      name: user.displayName!,
      email: user.email!,
      photoURL: user.photoURL!,
    );

    await _firestoreService.setUser(user: _user!);
    await _firestoreService.getUser(user: _user!).then((value) {
      _user = value?.user;
      _postIt = value?.postIt;
    });
  }

  Future<void> updatePostIt({
    required String title,
    required String description,
    required String mbti,
    required String hobbies,
    required String topics,
    required String kakakotalkId,
    required String instagramId,
    required String facebookId,
  }) async {
    _postIt = PostIt.initialize(
      title: title,
      description: description,
      mbti: mbti,
      hobbies: hobbies.replaceAll(' ', '').split(','),
      topics: topics.replaceAll(' ', '').split(','),
      snsIds: SnsIds.initialize(
        kakaotalk: kakakotalkId,
        instagram: instagramId,
        facebook: facebookId,
      ),
    );

    await _firestoreService.updateUser(
      user: _user!,
      postIt: postIt,
    );
  }
}
