import 'dart:io';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

class InAppUpdate extends StatefulWidget {
  const InAppUpdate({super.key});

  @override
  State<InAppUpdate> createState() => _InAppUpdateState();
}

class _InAppUpdateState extends State<InAppUpdate> {
  final Uri _androidUrl =
      Uri.parse('https://play.google.com/store/apps/details?id=com.irootsm');
  final Uri _iosUrl =
      Uri.parse('https://play.google.com/store/apps/details?id=com.irootsm');

  Future<void> _launchStoreUrl() async {
    final url = Platform.isIOS ? _iosUrl : _androidUrl;
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Using UpgraderMessage to customize the update message
    final upgrader = Upgrader(
      durationUntilAlertAgain: const Duration(days: 1),
      minAppVersion: '1.0.22',
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      messages: UpgraderMessages(
          // title: "Update ST.MARY'S HIGHER SECONDARY",
          // body: "ST.MARY'S HIGHER SECONDARY recommends that you update to the latest version",
          // buttonTitleLater: 'No Thanks',
          // buttonTitleUpdate: 'Update Now',
          ),
      onUpdate: () {
        _launchStoreUrl();
        return true; // Return true to indicate update process has started
      },
    );

    return UpgradeAlert(
      upgrader: upgrader,
      child:
          const SizedBox.shrink(), // Minimal widget when no update is showing
    );
  }
}
