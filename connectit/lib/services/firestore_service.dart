import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectit/dtos/firestore_storage_dto.dart';
import 'package:connectit/dtos/firestore_user_dto.dart';
import 'package:connectit/models/application_user.dart';
import 'package:connectit/models/post_it.dart';

import '../dtos/firestore_post_dto.dart';
import '../utils/logger.dart';

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
    }, SetOptions(merge: true)).onError((error, stackTrace) {
      logger.e('[Firestore] 유저 생성 실패\n$error\n$stackTrace');

      throw Exception(error);
    });
  }

  Future<FirestoreUserDTO?> readUserCollection({required ApplicationUser user}) async {
    FirestoreUserDTO firestoreUserDTO = FirestoreUserDTO();

    firestoreUserDTO = await _firestore.collection('users').doc(user.uid).get().then((snapshot) {
      return FirestoreUserDTO.fromFirestore(snapshot: snapshot);
    }).onError((error, stackTrace) {
      logger.e('[Firestore] 유저 정보 읽기 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });

    return firestoreUserDTO;
  }

  Future<void> updateUserCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    await _firestore.collection('users').doc(user.uid).update({
      'info': user.toFirestore(),
      'postIt': postIt.toFirestore(),
    }).onError((error, stackTrace) {
      logger.e('[Firestore] 유저 정보 업데이트 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });
  }

  Future<void> deleteUserCollection({required String uid}) async {
    await _firestore.collection('users').doc(uid).delete().onError((error, stackTrace) {
      logger.e('[Firestore] 유저 정보 삭제 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });
  }

  /// BOARD COLLECTION

  Future<void> createBoardCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    await _firestore.collection('board').doc(user.uid).set({
        'postIt': postIt.toFirestore(),
      }, SetOptions(merge: true),
    ).onError((error, stackTrace) {
      logger.e('[Firestore] 게시글 생성 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });
  }

  Future<FirestorePostDTO?> readBoardCollection({required ApplicationUser user}) async {
    FirestorePostDTO firestorePostDTO = FirestorePostDTO();

    firestorePostDTO = await _firestore.collection('board').get().then((querySnapshot) {
      return FirestorePostDTO.fromFirestore(querySnapshot: querySnapshot);
    }).onError((error, stackTrace) {
      logger.e('[Firestore] 게시글 읽기 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });

    return firestorePostDTO;
  }

  Future<void> updateBoardCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    final docReference = _firestore.collection('board').doc(user.uid);

    await docReference.get().then((snapshot) {
      if (snapshot.exists) {
        docReference.update({
          'postIt': postIt.toFirestore(),
        }).onError((error, stackTrace) {
          logger.e('[Firestore] 게시글 업데이트 실패\n$error\n$stackTrace');

          throw Exception(error);
        });
      }
    }).onError((error, stackTrace) {
      logger.e('[Firestore] 게시글 업데이트 실패\n$error\n$stackTrace');;

      throw Exception(error);
    });
  }

  Future<void> deleteBoardCollection({required String uid}) async {
    await _firestore.collection('board').doc(uid).delete().onError((error, stackTrace) {
      logger.e('[Firestore] 게시글 삭제 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });
  }

  /// STORAGE COLLECTION

  Future<void> createStorageCollection({required ApplicationUser user}) async {
    final docReference = _firestore.collection('storage').doc(user.uid);

    await docReference.get().then((snapshot) {
      if (!snapshot.exists) {
        docReference.set({
          'postIts': [],
        }, SetOptions(merge: false)).onError((error, stackTrace) {
          logger.e('[Firestore] 스토리지 생성 실패\n$error\n$stackTrace');
          
          throw Exception(error);
        });
      }
    }).onError((error, stackTrace) {
      logger.e('[Firestore] 스토리지 생성 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });
  }

  Future<FirestoreStorageDTO?> readStorageCollection({required ApplicationUser user}) async {
    FirestoreStorageDTO firestoreStorageDTO = FirestoreStorageDTO();

    firestoreStorageDTO = await _firestore.collection('storage').doc(user.uid).get().then((snapshot) {
      return FirestoreStorageDTO.fromFirestore(snapshot: snapshot);
    }).onError((error, stackTrace) {
      logger.e('[Firestore] 스토리지 읽기 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });

    return firestoreStorageDTO;
  }

  Future<void> updateAddStorageCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    await _firestore.collection('storage').doc(user.uid).update({
      'postIts': FieldValue.arrayUnion([postIt.toFirestore()]),
    }).onError((error, stackTrace) {
      logger.e('[Firestore] 스토리지 포스트잇 추가 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });
  }

  Future<void> updateSubStorageCollection({
    required ApplicationUser user,
    required PostIt postIt,
  }) async {
    await _firestore.collection('storage').doc(user.uid).update({
      'postIts': FieldValue.arrayRemove([postIt.toFirestore()]),
    }).onError((error, stackTrace) {
      logger.e('[Firestore] 스토리지 포스트잇 삭제 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });
  }

  Future<void> deleteStorageCollection({required String uid}) async {
    await _firestore.collection('storage').doc(uid).delete().onError((error, stackTrace) {
      logger.e('[Firestore] 스토리지 삭제 실패\n$error\n$stackTrace');
      
      throw Exception(error);
    });
  }
}