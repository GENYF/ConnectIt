import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/application_user.dart';
import '../models/post_it.dart';

class FirestoreUserDTO {
  final ApplicationUser? user;
  final PostIt? postIt;
  final List<String>? activePost;
  final List<String>? passivePost;

  FirestoreUserDTO({
    this.user,
    this.postIt,
    this.activePost,
    this.passivePost,
  });

  factory FirestoreUserDTO.fromFirestore({
    required DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  }) {
    final data = snapshot.data();

    FirestoreUserDTO firestoreUserDTO =  FirestoreUserDTO(
      user: data?['info'] != null ? ApplicationUser.fromFirestore(
        snapshot: snapshot,
        options: options,
      ) : null,
      postIt: data?['postIt'] != null ? PostIt.fromFirestore(
        snapshot: snapshot,
        options: options,
      ) : null,
      activePost: data?['activePostIt'] is Iterable ? List.from(data?['activePostIt']) : [],
      passivePost: data?['passivePostIt'] is Iterable ? List.from(data?['passivePostIt']) : [],
    );

    return firestoreUserDTO;
  }

  Map<String, dynamic> toFirestore() {
    return {
      'user': user?.toFirestore(),
      'postIt': postIt?.toFirestore(),
      'activePost': activePost,
      'passivePost': passivePost,
    };
  }
}