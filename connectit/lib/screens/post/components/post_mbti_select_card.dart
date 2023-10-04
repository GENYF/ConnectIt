import 'package:flutter/material.dart';

import '../../../enums/mbti.dart';
import '../../../utils/design.dart';

class PostMbtiSelectCard extends StatelessWidget {
  const PostMbtiSelectCard({
    required Function(MBTI? value) onSelected,
    super.key,
  }) :  _onSelected = onSelected;

  final Function(MBTI? value) _onSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(defaultSpacing),
          child: DropdownMenu<MBTI>(
            width: MediaQuery.of(context).size.width - 72,
            menuHeight: MediaQuery.of(context).size.height * 0.3,
            onSelected: (MBTI? value) => _onSelected(value),
            hintText: 'MBTI를 선택해주세요!',
            dropdownMenuEntries: MBTI.values.map((e) => DropdownMenuEntry(value: e, label: e.name)).toList(),
          )
      ),
    );
  }
}
