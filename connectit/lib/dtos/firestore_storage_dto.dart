import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectit/models/post_it.dart';

class FirestoreStorageDTO {
  final List<PostIt>? postIts;

  FirestoreStorageDTO({
    this.postIts,
  });

  factory FirestoreStorageDTO.fromFirestore({
    required DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  }) {
    final data = snapshot.data();

    FirestoreStorageDTO firestoreStorageDTO =  FirestoreStorageDTO(
      postIts: data?['postIts'] is List ? (data?['postIts'] as List).map((item) => PostIt.fromFirestoreData(data: item)).toList() : [],
    );

    return firestoreStorageDTO;
  }

  Map<String, dynamic> toFirestore() {
    return {
      'postIts': postIts,
    };
  }
}