import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectit/models/post_it.dart';

class FirestorePostDTO {
  final List<PostIt>? postIts;

  FirestorePostDTO({
    this.postIts,
  });

  factory FirestorePostDTO.fromFirestore({
    required QuerySnapshot<Map<String, dynamic>> querySnapshot,
    SnapshotOptions? options,
  }) {
    final docs = querySnapshot.docs;

    FirestorePostDTO firestoreUserDTO =  FirestorePostDTO(
      postIts: docs.isNotEmpty ? docs.map((doc) {
        return PostIt.fromFirestoreDoc(
          snapshot: doc,
          options: options,
        );
      }).toList() : [],
    );

    return firestoreUserDTO;
  }

  Map<String, dynamic> toFirestore() {
    return {
      'postIts': postIts,
    };
  }
}