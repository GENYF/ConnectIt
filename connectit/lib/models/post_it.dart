import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/sns_ids.dart';

class PostIt {
  String? title;
  String? description;
  String? mbti;
  List<String>? hobbies;
  List<String>? topics;
  List<String>? keywords;
  SnsIds? snsIds;

  PostIt.initialize({
    required this.title,
    required this.description,
    required this.mbti,
    required this.hobbies,
    required this.topics,
    required this.snsIds,
  }) : keywords = [mbti!] + hobbies! + topics!;

  PostIt.fromFirestore({
    required DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  }) {
    final data = snapshot.data()?['myPost'];

    title = data?['title'];
    description = data?['description'];
    mbti = data?['mbti'];
    hobbies = data?['hobbies'] is Iterable ? List.from(data?['hobbies']) : [];
    topics = data?['topics'] is Iterable ? List.from(data?['topics']) : [];
    keywords = [mbti!] + hobbies! + topics!;
    snsIds = SnsIds.fromFirestore(
      snapshot: snapshot,
      options: options,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title ?? '',
      'description': description ?? '',
      'mbti': mbti ?? '',
      'hobbies': hobbies ?? [],
      'topics': topics ?? [],
      'snsIds': snsIds?.toFirestore(),
    };
  }
}