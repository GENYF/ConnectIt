import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../utils/design.dart';

class ApplicationInfo extends StatefulWidget {
  const ApplicationInfo({super.key});

  @override
  State<ApplicationInfo> createState() => _ApplicationInfoState();
}

class _ApplicationInfoState extends State<ApplicationInfo> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    _initPackageInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '앱 버전: ${_packageInfo.version}\n빌드 번호: ${_packageInfo.buildNumber}',
      style: DesignerTextStyle.paragraph2,
    );
  }

  Future<void> _initPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      _packageInfo = packageInfo;
    });
  }
}
