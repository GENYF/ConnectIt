import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectit/dtos/firestore_user_dto.dart';
import 'package:connectit/models/application_user.dart';
import 'package:connectit/models/post_it.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();

  factory FirestoreService() {
    return _instance;
  }

  FirestoreService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// USERS COLLECTION

  Future<void> setUser({required ApplicationUser user}) async {
    await _firestore.collection('users').doc(user.uid).set({
      'myInfo': user.toFirestore(),
    });
  }

  Future<FirestoreUserDTO?> getUser({required ApplicationUser user}) async {
    FirestoreUserDTO firestoreUserDTO = FirestoreUserDTO();

    firestoreUserDTO = await _firestore.collection('users').doc(user.uid).get().then((value) {
      return FirestoreUserDTO.fromFirestore(snapshot: value);
    });

    return firestoreUserDTO;
  }

  Future<void> updateUser({
    required ApplicationUser user,
    PostIt? postIt,
    List<String>? activePost,
    List<String>? passivePost,
  }) async {
    await _firestore.collection('users').doc(user.uid).update({
      'myInfo': user.toFirestore(),
      'myPost': postIt?.toFirestore(),
      'activePost': activePost ?? [],
      'passivePost': passivePost ?? [],
    });
  }
}