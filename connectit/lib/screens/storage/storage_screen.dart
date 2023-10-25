import 'package:flutter/material.dart';

import '../../components/post_it_card.dart';
import '../../components/section_title.dart';
import '../../models/post_it.dart';
import '../../utils/design.dart';
import '../../utils/tester.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

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
          icon: const Icon(Icons.notifications_outlined),
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
          padding: const EdgeInsets.symmetric(vertical: defaultSpacing),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSpacing),
                child: SectionTitle(title: '내가 선택한 포스트잇', isAction: false),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (PostIt postIt in postItsTester)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
                        child: PostItCard(
                          title: postIt.title!,
                          description: postIt.description!,
                          keywords: postIt.keywords!,
                          snsIds: postIt.snsIds!,
                          isShowSnsIds: true,
                          isOnTap: false,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: defaultDoubleSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
