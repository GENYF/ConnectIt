import 'package:flutter/material.dart';

import '../../components/post_it_card.dart';
import '../../models/sns_ids.dart';
import '../../utils/design.dart';
import 'components/user_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('ConnectIt'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
      centerTitle: false,
      scrolledUnderElevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('내 정보', style: DesignerTextStyle.title1),
              const SizedBox(height: defaultSpacing),
              const UserInfoCard(
                userProfileUrl: 'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                userName: 'Jason Thomas Mraz',
                userEmail: 'JasonMraz@gmail.com',
              ),
              const SizedBox(height: defaultDoubleSpacing),
              Text('내 포스트', style: DesignerTextStyle.title1),
              const SizedBox(height: defaultSpacing),
              PostItCard(
                title: 'Hello! I\'m Jason Mraz',
                description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500',
                keywords: const ['INTJ', 'Developer', 'Computer Science', 'Junior', 'Music', 'Photo', 'Movie', 'Book', 'Game', 'Travel', 'Coffee'],
                snsIds: SnsIds(
                  instagramId: 'instagram_id',
                  facebookId: 'facebook_id',
                  kakaotalkId: 'kakaotalk_id',
                ),
                isShowSnsIds: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
