import 'package:flutter/material.dart';
import '../../../utils/design.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    required String label,
    required Function() onTapped,
    super.key,
  }) : _label = label,
       _onTapped = onTapped;

  final String _label;
  final Function() _onTapped;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        _label,
        style: DesignerTextStyle.paragraph2,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => _onTapped(),
    );
  }
}
