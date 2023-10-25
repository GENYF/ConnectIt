import 'package:flutter/material.dart';

import '../../components/post_it_card.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
                child: Text('내가 때어간 포스트잇', style: DesignerTextStyle.title1),
              ),
              const SizedBox(height: defaultSpacing),
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
                          isOnTap: true,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: defaultDoubleSpacing),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
                child: Text('나를 때어간 포스트잇', style: DesignerTextStyle.title1),
              ),
              const SizedBox(height: defaultSpacing),
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
                          isOnTap: true,
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
