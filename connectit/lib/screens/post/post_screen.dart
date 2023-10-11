import 'package:connectit/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../enums/mbti.dart';
import '../../utils/design.dart';
import 'components/post_mbti_select_card.dart';
import '../../components/next_button.dart';
import 'components/post_sns_ids_edit_card.dart';
import 'components/post_text_edit_card.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _hobbiesController = TextEditingController();
  final TextEditingController _topicsController = TextEditingController();
  final TextEditingController _kakaoTalkIdController = TextEditingController();
  final TextEditingController _instagramIdController = TextEditingController();
  final TextEditingController _facebookIdController = TextEditingController();

  String _selectedMBTI = MBTI.values.first.name;

  @override
  void initState() {
    _initField();
    super.initState();
  }

  @override
  void dispose() {
    _disposField();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('내 포스트 작성'),
      centerTitle: true,
      scrolledUnderElevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(defaultSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('포스트 제목', style: DesignerTextStyle.title1),
                    PostTextEditCard(
                      textEditingController: _titleController,
                      hintText: '간단히 나를 표현해주세요!',
                      maxLength: 32,
                    ),
                    const SizedBox(height: defaultDoubleSpacing),
                    Text('포스트 내용', style: DesignerTextStyle.title1),
                    PostTextEditCard(
                      textEditingController: _descriptionController,
                      hintText: '자유롭게 나를 표현해주세요!',
                      maxLength: 256,
                      maxLines: 5,
                    ),
                    const SizedBox(height: defaultDoubleSpacing),
                    Text('나의 MBTI', style: DesignerTextStyle.title1),
                    PostMbtiSelectCard(
                      onSelected: (MBTI? value) => _onSelectedMbti(value),
                      initialSelection: _selectedMBTI,
                    ),
                    const SizedBox(height: defaultDoubleSpacing),
                    Text('나의 취미', style: DesignerTextStyle.title1),
                    PostTextEditCard(
                      textEditingController: _hobbiesController,
                      hintText: '취미를 쉼표(,)로 구분하여 적어주세요!',
                      maxLength: 128,
                      maxLines: 3,
                    ),
                    const SizedBox(height: defaultDoubleSpacing),
                    Text('나의 관심사', style: DesignerTextStyle.title1),
                    PostTextEditCard(
                      textEditingController: _topicsController,
                      hintText: '관심사를 쉼표(,)로 구분하여 적어주세요!',
                      maxLength: 128,
                      maxLines: 3,
                    ),
                    const SizedBox(height: defaultDoubleSpacing),
                    Text('나의 SNS ID', style: DesignerTextStyle.title1),
                    PostSnsIdsEditCard(
                      kakaoTalkIdController: _kakaoTalkIdController,
                      instagramIdController: _instagramIdController,
                      facebookIdController: _facebookIdController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultSpacing),
            child: NextButton(
              onPressed: () => _onPressedSave(),
              label: '포스트 저장하기',
            ),
          ),
        ],
      ),
    );
  }

  void _initField() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ProfileProvider profileProvider = context.read<ProfileProvider>();

      _titleController.text = profileProvider.postIt?.title ?? '';
      _descriptionController.text = profileProvider.postIt?.description ?? '';
      _hobbiesController.text = profileProvider.postIt?.hobbies.join(', ') ?? '';
      _topicsController.text = profileProvider.postIt?.topics.join(', ') ?? '';

      setState(() {
        _selectedMBTI = profileProvider.postIt?.mbti ?? '';
      });

      if (profileProvider.postIt?.snsIds != null) {
        _kakaoTalkIdController.text = profileProvider.postIt?.snsIds?.kakaotalk ?? '';
        _instagramIdController.text = profileProvider.postIt?.snsIds?.instagram ?? '';
        _facebookIdController.text = profileProvider.postIt?.snsIds?.facebook ?? '';
      }
    });
  }

  void _disposField() {
    _titleController.dispose();
    _descriptionController.dispose();
    _hobbiesController.dispose();
    _topicsController.dispose();
    _kakaoTalkIdController.dispose();
    _instagramIdController.dispose();
    _facebookIdController.dispose();
  }

  void _onSelectedMbti(MBTI? value) {
    setState(() {
      _selectedMBTI = value!.name;
    });
  }

  Future<void> _onPressedSave() async {
    ProfileProvider profileProvider = context.read<ProfileProvider>();

    if (_kakaoTalkIdController.text.isNotEmpty || _facebookIdController.text.isNotEmpty || _instagramIdController.text.isNotEmpty) {
      profileProvider.setPostIt(
        title: _titleController.text,
        description: _descriptionController.text,
        mbti: _selectedMBTI,
        hobbies: _hobbiesController.text,
        topics: _topicsController.text,
        kakaotalkId: _kakaoTalkIdController.text,
        instagramId: _instagramIdController.text,
        facebookId: _facebookIdController.text,
      ).then((_) {
        Navigator.pop(context);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text(
            'SNS ID를 하나 이상 입력해주세요.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
