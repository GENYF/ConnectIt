import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/application_user.dart';
import '../models/post_it.dart';

class FirestoreUserDTO {
  final ApplicationUser? user;
  final PostIt? postIt;

  FirestoreUserDTO({
    this.user,
    this.postIt,
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
      postIt: data?['postIt'] != null ? PostIt.fromFirestoreDoc(
        snapshot: snapshot,
        options: options,
      ) : null,
    );

    return firestoreUserDTO;
  }

  Map<String, dynamic> toFirestore() {
    return {
      'user': user?.toFirestore(),
      'postIt': postIt?.toFirestore(),
    };
  }
}