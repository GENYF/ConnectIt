import 'package:connectit/providers/board_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/post_it_card.dart';
import '../../models/post_it.dart';
import '../../providers/profile_provider.dart';
import '../../utils/design.dart';
import 'components/board_fab.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: BoardFAB(
        onTap: () => _onTapFAB(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('ConnectIt'),
      actions: [
        IconButton(
          onPressed: () => _onPressedAction(context),
          icon: const Icon(Icons.refresh_outlined),
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('포스트잇 목록', style: DesignerTextStyle.title1),
              const SizedBox(height: defaultSpacing),
              Consumer<BoardProvider>(
                builder: (BuildContext context, BoardProvider boardProvider, Widget? child) {
                  List<PostIt>? postIts = boardProvider.postIts;

                  if (postIts != null) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: postIts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PostItCard(
                          title: postIts[index].title!,
                          description: postIts[index].description!,
                          keywords: postIts[index].keywords!,
                          snsIds: postIts[index].snsIds!,
                          isShowSnsIds: false,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: defaultSpacingHalf);
                      },
                    );
                  } else {
                    return Text(
                      '현재 보드에 붙여져있는 포스트잇이 없습니다.',
                      style: DesignerTextStyle.paragraph3,
                    );
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedAction(BuildContext context) async {
    BoardProvider boardProvider = context.read<BoardProvider>();

    await boardProvider.refresh();
  }

  void _onTapFAB(BuildContext context) async {
    BoardProvider boardProvider = context.read<BoardProvider>();
    ProfileProvider profileProvider = context.read<ProfileProvider>();

    await boardProvider.addPostIt(postIt: profileProvider.postIt).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text(
            '내 포스트잇을 보드에 붙였습니다.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
  }
}
