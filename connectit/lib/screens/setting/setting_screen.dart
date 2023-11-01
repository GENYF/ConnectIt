import 'package:connectit/providers/profile_provider.dart';
import 'package:connectit/screens/setting/components/application_info.dart';
import 'package:connectit/screens/setting/components/open_source_information.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/custom_dialog.dart';
import '../../utils/design.dart';
import '../../utils/logger.dart';
import '../route_screen.dart';
import 'components/setting_label.dart';
import 'components/setting_listtile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('앱 설정'),
      centerTitle: true,
      scrolledUnderElevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child:SingleChildScrollView(
        child: Column(
          children: [
            const SettingLabel(optionName: '상세 정보'),
            SettingListTile(
              label: '애플리케이션 정보',
              onTapped: () => _onTappedAppInfo(context),
            ),
            const SizedBox(height: defaultSpacingQuarter),
            SettingListTile(
              label: '서비스 이용약관',
              onTapped: () => _launchInBrowser('https://ey-labs.notion.site/ConnectIt-ae4a7ce6b5c84203be5dbb23064007f0?pvs=4'),
            ),
            const SizedBox(height: defaultSpacingQuarter),
            SettingListTile(
              label: '개인정보 처리 방침',
              onTapped: () => _launchInBrowser('https://ey-labs.notion.site/ConnectIt-cfb3b40cea3f4c6591c801edf9b85ae2?pvs=4'),
            ),
            const SizedBox(height: defaultSpacingQuarter),
            SettingListTile(
              label: '오픈소스 정보',
              onTapped: () => _onTappedOssInfo(context),
            ),
            const SettingLabel(optionName: '계정 관리'),
            SettingListTile(
              label: '연결된 계정',
              onTapped: () => _onTappedAccount(context),
            ),
            const SizedBox(height: defaultSpacingQuarter),
            SettingListTile(
              label: '로그아웃',
              onTapped: () => _onTappedSignOut(context),
            ),
            const SizedBox(height: defaultSpacingQuarter),
            SettingListTile(
              label: '회원 탈퇴',
              onTapped: () => _onPressedWithdraw(context),
            ),
          ],
        ),
      ),
    );
  }

  void _onTappedAppInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          dialogTitle: '애플리케이션 정보',
          dialogContent: const ApplicationInfo(),
          buttonLabel: '확인',
          buttonOnPressed: () => Navigator.pop(context),
        );
      },
    );
  }

  void _onTappedOssInfo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const OpenSourceInformation(),
      ),
    );
  }

  void _onTappedAccount(BuildContext context) {
    ProfileProvider profileProvider = context.read<ProfileProvider>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          dialogTitle: '연결된 계정',
          dialogContent: Text(
            'E-mail: ${profileProvider.user.email}\nUser ID: ${profileProvider.user.uid}',
            style: DesignerTextStyle.paragraph2,
          ),
          buttonLabel: '확인',
          buttonOnPressed: () => Navigator.pop(context),
        );
      },
    );
  }

  void _onTappedSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          dialogTitle: '로그아웃 하시겠습니까?',
          dialogContent: Text(
            '로그아웃하셔도 다시 로그인하실 수 있습니다.',
            style: DesignerTextStyle.paragraph2,
          ),
          buttonLabel: '로그아웃',
          buttonOnPressed: () {
            ProfileProvider profileProvider = context.read<ProfileProvider>();

            profileProvider.signOut().then((_) {
              _pushRouteScreen(context);
            });
          },
        );
      },
    );
  }

  void _onPressedWithdraw(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          dialogTitle: '회원 탈퇴',
          dialogContent: Text(
            '회원 탈퇴 시 지금까지 저장된 정보는 전부 사라집니다.',
            style: DesignerTextStyle.paragraph2,
          ),
          buttonLabel: '회원 탈퇴',
          buttonOnPressed: () {
            ProfileProvider profileProvider = context.read<ProfileProvider>();

            profileProvider.withdraw().then((_) {
              _pushRouteScreen(context);
            });
          },
        );
      },
    );
  }

  void _pushRouteScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext content) => RouteScreen()),
          (route) => false,
    );
  }

  void _launchInBrowser(String url) async {
    Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      logger.e('[Launching in Browser] Failed');

      throw 'Could not launch $uri';
    }
  }
}