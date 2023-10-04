import 'package:flutter/material.dart';

class SnsIds {
  SnsIds({
    @required String? instagramId,
    @required String? facebookId,
    @required String? kakaotalkId,
  }) : _instagramId = instagramId,
       _facebookId = facebookId,
       _kakaotalkId = kakaotalkId;

  final String? _instagramId;
  final String? _facebookId;
  final String? _kakaotalkId;

  String? get instagramId => _instagramId;
  String? get facebookId => _facebookId;
  String? get kakaotalkId => _kakaotalkId;
}