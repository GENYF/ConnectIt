import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectit/dtos/firestore_storage_dto.dart';
import 'package:connectit/dtos/firestore_user_dto.dart';
import 'package:connectit/models/application_user.dart';
import 'package:connectit/models/post_it.dart';

import '../dtos/firestore_post_dto.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();

  factory FirestoreService() {
    return _instance;
  }

  FirestoreService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// USERS COLLECTION
  Future<void> createUserCollection({required ApplicationUser user}) async {
    await _firestore.collection('users').doc(user.uid).set({
      'info': user.toFirestore(),
    }, SetOptions(merge: true));
  }

  Future<FirestoreUserDTO?> readUserCollection({required ApplicationUser user}) async {
    FirestoreUserDTO firestoreUserDTO = FirestoreUserDTO();

    firestoreUserDTO = await _firestore.collection('users').doc(user.uid).get().then((snapshot) {
      return FirestoreUserDTO.fromFirestore(snapshot: snapshot);
    });

    return firestoreUserDTO;
  }

  Future<void> updateUserCollection({
    required ApplicationUser user,
    required PostIt postIt,
    List<String>? activePost,
    List<String>? passivePost,
  }) async {
    await _firestore.collection('users').doc(user.uid).update({
      'info': user.toFirestore(),
      'postIt': postIt.toFirestore(),
      'activePostIt': activePost ?? [],
      'passivePostIt': passivePost ?? [],
    });
  }

  Future<void> deleteUserCollection({required ApplicationUser user}) async {
    await _firestore.collection('users').doc(user.uid).delete();
  }

  /// BOARD COLLECTION
  Future<void> createPostCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    await _firestore.collection('board').doc(user.uid).set({
        'postIt': postIt.toFirestore(),
      }, SetOptions(merge: true),
    );
  }

  Future<FirestorePostDTO?> readPostCollection({required ApplicationUser user}) async {
    FirestorePostDTO firestorePostDTO = FirestorePostDTO();

    firestorePostDTO = await _firestore.collection('board').get().then((querySnapshot) {
      return FirestorePostDTO.fromFirestore(querySnapshot: querySnapshot);
    });

    return firestorePostDTO;
  }

  Future<void> updatePostCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    await _firestore.collection('board').doc(user.uid).update({
      'postIt': postIt.toFirestore(),
    });
  }

  Future<void> deletePostCollection({required ApplicationUser user}) async {
    await _firestore.collection('board').doc(user.uid).delete();
  }

  /// STORAGE COLLECTION
  Future<void> createStorageCollection({required ApplicationUser user}) async {
    final docReference = _firestore.collection('storage').doc(user.uid);

    await docReference.get().then((snapshot) {
      if (!snapshot.exists) {
        docReference.set({
          'postIts': [],
        }, SetOptions(merge: false));
      }
    });
  }

  Future<FirestoreStorageDTO?> readStorageCollection({required ApplicationUser user}) async {
    FirestoreStorageDTO firestoreStorageDTO = FirestoreStorageDTO();

    firestoreStorageDTO = await _firestore.collection('storage').doc(user.uid).get().then((snapshot) {
      return FirestoreStorageDTO.fromFirestore(snapshot: snapshot);
    });

    return firestoreStorageDTO;
  }

  Future<void> updateStorageCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    await _firestore.collection('storage').doc(user.uid).update({
      'postIts': FieldValue.arrayUnion([postIt.toFirestore()]),
    });
  }

  Future<void> deleteStorageCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    await _firestore.collection('storage').doc(user.uid).update({
      'postIts': FieldValue.arrayRemove([postIt.toFirestore()]),
    });
  }
}