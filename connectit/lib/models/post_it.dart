import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/sns_ids.dart';

class PostIt {
  String? uid;
  String? title;
  String? description;
  String? mbti;
  List<String>? hobbies;
  List<String>? topics;
  List<String>? keywords;
  SnsIds? snsIds;

  PostIt.initialize({
    required this.uid,
    required this.title,
    required this.description,
    required this.mbti,
    required this.hobbies,
    required this.topics,
    required this.snsIds,
  }) : keywords = [mbti!] + hobbies! + topics!;

  PostIt.fromFirestoreDoc({
    required DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  }) {
    final data = snapshot.data()?['postIt'];

    uid = data?['uid'];
    title = data?['title'];
    description = data?['description'];
    mbti = data?['mbti'];
    hobbies = data?['hobbies'] is Iterable ? List.from(data?['hobbies']) : [];
    topics = data?['topics'] is Iterable ? List.from(data?['topics']) : [];
    keywords = [mbti!] + hobbies! + topics!;
    snsIds = SnsIds.fromFirestoreDoc(
      snapshot: snapshot,
      options: options,
    );
  }

  PostIt.fromFirestoreData({
    required Map<String, dynamic>? data,
  }) {
    uid = data?['uid'];
    title = data?['title'];
    description = data?['description'];
    mbti = data?['mbti'];
    hobbies = data?['hobbies'] is Iterable ? List.from(data?['hobbies']) : [];
    topics = data?['topics'] is Iterable ? List.from(data?['topics']) : [];
    keywords = [mbti!] + hobbies! + topics!;
    snsIds = SnsIds.fromFirestoreData(
      data: data?['snsIds'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid ?? '',
      'title': title ?? '',
      'description': description ?? '',
      'mbti': mbti ?? '',
      'hobbies': hobbies ?? [],
      'topics': topics ?? [],
      'snsIds': snsIds?.toFirestore(),
    };
  }
}