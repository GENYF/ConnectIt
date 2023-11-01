import 'package:flutter/material.dart';

import '../../../utils/design.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    required String? userProfileUrl,
    required String userName,
    required String userEmail,
    super.key,
  }) :  _userProfileUrl = userProfileUrl,
        _userName = userName,
        _userEmail = userEmail;

  final String? _userProfileUrl;
  final String _userName;
  final String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(defaultSpacingHalf),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_userProfileUrl != null && _userProfileUrl!.isNotEmpty)
              ClipRRect(
                  borderRadius: BorderRadius.circular(64.0),
                  child: Image.network(
                    _userProfileUrl!,
                    width: 64.0,
                    height: 64.0,
                  )
              )
            else
              const CircleAvatar(
                radius: 32.0,
                child: Icon(
                  Icons.person,
                  size: 48.0,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(defaultSpacing),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _userName,
                    style: DesignerTextStyle.title2,
                  ),
                  const SizedBox(height: defaultSpacingQuarter),
                  Text(
                    _userEmail,
                    style: DesignerTextStyle.caption2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}