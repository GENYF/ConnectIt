import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../../../oss_licenses.dart';
import '../../../utils/design.dart';
import 'misc_oss_license_single.dart';

class OpenSourceInformation extends StatelessWidget {
  const OpenSourceInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          '오픈소스 정보',
          style: DesignerTextStyle.header1,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Package>>(
          future: _loadLicenses(),
          initialData: const [],
          builder: (context, snapshot) {
            return ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final package = snapshot.data![index];

                return Card(
                  margin: const EdgeInsets.only(
                    left: defaultSpacing,
                    right: defaultSpacing,
                    top: defaultSpacingHalf,
                    bottom: defaultSpacingHalf,
                  ),
                  child: ListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
                    ),
                    tileColor: Colors.white,
                    title: Text('${package.name} ${package.version}'),
                    subtitle: package.description.isNotEmpty ? Text(package.description) : null,
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _onTappedOssLicense(context, package),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<Package>> _loadLicenses() async {
    final lm = <String, List<String>>{};

    await for (var l in LicenseRegistry.licenses) {
      for (var p in l.packages) {
        final lp = lm.putIfAbsent(p, () => []);
        lp.addAll(l.paragraphs.map((p) => p.text));
      }
    }

    final licenses = ossLicenses.toList();

    for (var key in lm.keys) {
      licenses.add(Package(
        name: key,
        description: '',
        authors: [],
        version: '',
        license: lm[key]!.join('\n\n'),
        isMarkdown: false,
        isSdk: false,
        isDirectDependency: false,
      ));
    }

    return licenses..sort((a, b) => a.name.compareTo(b.name));
  }

  void _onTappedOssLicense(BuildContext context, Package package) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MiscOssLicenseSingle(package: package),
      ),
    );
  }
}
