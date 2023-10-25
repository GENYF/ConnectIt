import 'package:cloud_firestore/cloud_firestore.dart';

class SnsIds {
  String? kakaotalk;
  String? instagram;
  String? facebook;

  SnsIds.initialize({
    this.kakaotalk,
    this.instagram,
    this.facebook,
  });

  SnsIds.fromFirestoreDoc({
    required DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  }) {
    final data = snapshot.data()?['postIt']['snsIds'];

    kakaotalk = data?['kakaotalk'];
    instagram =  data?['instagram'];
    facebook = data?['facebook'];
  }

  SnsIds.fromFirestoreData({
    required Map<String, dynamic>? data,
  }) {
    kakaotalk = data?['kakaotalk'];
    instagram =  data?['instagram'];
    facebook = data?['facebook'];
  }

  Map<String, dynamic> toFirestore() {
    return {
      'kakaotalk': kakaotalk ?? '',
      'instagram': instagram ?? '',
      'facebook': facebook ?? '',
    };
  }
}