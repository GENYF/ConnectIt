import 'package:connectit/models/post_it.dart';
import 'package:flutter/cupertino.dart';

import '../models/application_user.dart';
import '../services/firestore_service.dart';

class StorageProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  ApplicationUser? _user;
  List<PostIt>? _postIts;

  get postIts => _postIts;

  Future<void> initialize({required ApplicationUser user}) async {
    setUser(user: user);
    await _initializeStorage();
  }

  Future<void> refresh() async {
    await _load();
  }

  Future<void> _load() async {
    await _firestoreService.readStorageCollection(user: _user!).then((value) {
      _postIts = value?.postIts;
    });

    notifyListeners();
  }

  void setUser({required ApplicationUser user}) async {
    _user = user;
  }

  Future<void> _initializeStorage() async {
    await _firestoreService.createStorageCollection(user: _user!).then((_) async {
      await _load();
    });
  }

  Future<void> createPostIt({required PostIt postIt}) async {
    await _firestoreService.updateStorageCollection(user: _user!, postIt: postIt).then((_) async {
      await _load();
    });
  }

  Future<void> removePostIt({required PostIt postIt}) async {
    await _firestoreService.deleteStorageCollection(user: _user!, postIt: postIt).then((_) async {
      await _load();
    });
  }
}