import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationUser {
  String? uid;
  String? name;
  String? email;
  String? photoURL;

  ApplicationUser.initialize({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
  });

  ApplicationUser.fromFirestore({
    required DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  }) {
    final data = snapshot.data()?['info'];

    uid = data?['uid'];
    name = data?['name'];
    email = data?['email'];
    photoURL = data?['photoURL'];
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid ?? '',
      'name': name ?? '',
      'email': email ?? '',
      'photoURL': photoURL ?? '',
    };
  }
}
