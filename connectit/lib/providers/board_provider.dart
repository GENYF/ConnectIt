import 'package:connectit/models/post_it.dart';
import 'package:flutter/cupertino.dart';

import '../models/application_user.dart';
import '../services/firestore_service.dart';

class BoardProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  ApplicationUser? _user;
  List<PostIt>? _postIts;

  get postIts => _postIts;

  Future<void> initialize({required ApplicationUser user}) async {
    setUser(user: user);
    await _load();
  }

  Future<void> refresh() async {
    await _load();
  }

  Future<void> _load() async {
    await _firestoreService.readPostCollection(user: _user!).then((value) {
      _postIts = value?.postIts;
    });

    notifyListeners();
  }

  void setUser({required ApplicationUser user}) async {
    _user = user;
  }

  Future<void> addPostIt({required PostIt postIt}) async {
    await _firestoreService.createPostCollection(user: _user!, postIt: postIt).then((_) async {
      await _load();
    });
  }

  Future<void> updatePostIt({required PostIt postIt}) async {
    await _firestoreService.updatePostCollection(user: _user!, postIt: postIt).then((_) async {
      await _load();
    });
  }
}