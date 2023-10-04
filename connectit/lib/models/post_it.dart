import '../models/sns_ids.dart';

class PostIt {
  PostIt({
    required String title,
    required String description,
    required String mbti,
    required List<String> hobbies,
    required List<String> topics,
    required SnsIds snsIds,
  })  : _title = title,
        _description = description,
        _keywords = [mbti] + hobbies + topics,
        _snsIds = snsIds;

  final String _title;
  final String _description;
  final List<String> _keywords;
  final SnsIds _snsIds;

  String get title => _title;
  String get description => _description;
  List<String> get keywords => _keywords;
  SnsIds get snsIds => _snsIds;
}