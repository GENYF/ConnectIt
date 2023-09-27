import 'package:flutter/material.dart';

import '../../components/post_it_card.dart';
import '../../utils/design.dart';
import '../../utils/tester.dart';
import 'components/board_fab.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: BoardFAB(
        onTap: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
      scrolledUnderElevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultSpacing),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('포스트잇 목록', style: DesignerTextStyle.title1),
              const SizedBox(height: defaultSpacing),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: postItsTester.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostItCard(
                    title: postItsTester[index].title,
                    description: postItsTester[index].description,
                    keywords: postItsTester[index].keywords,
                    snsIds: postItsTester[index].snsIds,
                    isShowSnsIds: false,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: defaultSpacingHalf);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
