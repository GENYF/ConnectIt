import 'package:connectit/oss_licenses.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/logger.dart';

class MiscOssLicenseSingle extends StatelessWidget {
  const MiscOssLicenseSingle({required this.package, super.key});

  final Package package;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${package.name} ${package.version}')),
      body: Container(
        color: Theme.of(context).canvasColor,
        child: ListView(
          children: <Widget>[
            if (package.description.isNotEmpty)
              Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                  child: Text(package.description, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold))),
            if (package.homepage != null)
              Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                  child: InkWell(
                    child: Text(package.homepage!, style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
                    onTap: () => _launchInBrowser(package.homepage!),
                  )),
            if (package.description.isNotEmpty || package.homepage != null)
              const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Text(_bodyText(), style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }

  String _bodyText() {
    return package.license!.split('\n').map((line) {
      if (line.startsWith('//')) line = line.substring(2);
      line = line.trim();
      return line;
    }).join('\n');
  }

  void _launchInBrowser(String url) async {
    Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      logger.e('[Launching in Browser] Failed');

      throw 'Could not launch $uri';
    }
  }
}
