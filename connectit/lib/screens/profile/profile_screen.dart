import 'package:connectit/components/next_button.dart';
import 'package:connectit/models/application_user.dart';
import 'package:connectit/providers/profile_provider.dart';
import 'package:connectit/screens/post/post_screen.dart';
import 'package:connectit/screens/profile/components/profile_section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/post_it_card.dart';
import '../../models/post_it.dart';
import '../../utils/design.dart';
import 'components/profile_info_card.dart';

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
          child: Consumer<ProfileProvider>(
            builder: (BuildContext context, ProfileProvider profileProvider, Widget? child) {
              ApplicationUser user = profileProvider.user;
              PostIt? postIt = profileProvider.postIt;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const ProfileSectionTitle(
                    title: '내 정보',
                    isEditable: false,
                  ),
                  ProfileInfoCard(
                    userProfileUrl: user.photoURL!,
                    userName: user.name!,
                    userEmail: user.email!,
                  ),
                  const SizedBox(height: defaultDoubleSpacing),
                  ProfileSectionTitle(
                    title: '내 포스트',
                    isEditable: true,
                    onPressed: () => _onPressedMyPost(context),
                  ),
                  if (postIt != null) ... [
                    PostItCard(
                      title: postIt.title!,
                      description: postIt.description!,
                      keywords: postIt.keywords!,
                      snsIds: postIt.snsIds!,
                      isShowSnsIds: true,
                    ),
                  ]
                  else ... [
                    Text(
                      '아직 작성한 포스트가 없습니다.',
                      style: DesignerTextStyle.paragraph3,
                    ),
                    const SizedBox(height: defaultSpacing),
                    NextButton(
                      onPressed: () => _onPressedMyPost(context),
                      label: '새 포스트 작성하기',
                    ),
                  ],
                  const SizedBox(height: defaultDoubleSpacing),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _onPressedMyPost(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PostScreen(),
      ),
    );
  }
}
