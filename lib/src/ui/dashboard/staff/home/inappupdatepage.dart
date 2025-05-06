// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:upgrader/upgrader.dart';
// import 'package:url_launcher/url_launcher.dart';

// class InAppUpdate extends StatefulWidget {
//   const InAppUpdate({super.key});

//   @override
//   State<InAppUpdate> createState() => _InAppUpdateState();
// }

// class _InAppUpdateState extends State<InAppUpdate> {
//   final Uri _androidUrl = Uri.parse(
//       'https://play.google.com/store/apps/details?id=com.irootsm');
//   final Uri _iosUrl = Uri.parse(
//       'https://play.google.com/store/apps/details?id=com.irootsm');

//   Future<void> _launchStoreUrl() async {
//     final url = Platform.isIOS ? _iosUrl : _androidUrl;
//     if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Using UpgraderMessage to customize the update message
//     final upgrader = Upgrader(
//       durationUntilAlertAgain: const Duration(days: 1),
//       minAppVersion: '1.0.21',
//       dialogStyle: Platform.isIOS
//           ? UpgradeDialogStyle.cupertino
//           : UpgradeDialogStyle.material,
//       showIgnore: false,
//       showLater: false,
//       messages: UpgraderMessages(
//           // title: "Update ST.MARY'S HIGHER SECONDARY",
//           // body: "ST.MARY'S HIGHER SECONDARY recommends that you update to the latest version",
//           // buttonTitleLater: 'No Thanks',
//           // buttonTitleUpdate: 'Update Now',
//           ),
//       onUpdate: () {
//         _launchStoreUrl();
//         return true; // Return true to indicate update process has started
//       },
//     );

//     return UpgradeAlert(
//       upgrader: upgrader,
//       child:
//           const SizedBox.shrink(), // Minimal widget when no update is showing
//     );
//   }
// }

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iroots/bloc/mainbloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class InAppUpdateManual extends StatefulWidget {
  const InAppUpdateManual({super.key});

  @override
  State<InAppUpdateManual> createState() => _InAppUpdateManualState();
}

class _InAppUpdateManualState extends State<InAppUpdateManual> {
  String latestversion = "0";
  final Uri _androidUrl =
      Uri.parse('https://play.google.com/store/apps/details?id=com.irootsm');
  final Uri _iosUrl = Uri.parse('https://apps.apple.com/app/idYOUR_APP_ID');

  @override
  void initState() {
    super.initState();
    _latestestvertion();
    _checkForUpdate();
    // BlocProvider.of<MainBloc>(context).add(GetCurrentVersion());
  }

  _latestestvertion() {
    latestversion = context.read<MainBloc>().latestversion.toString();
    log("this is my version$latestversion");
  }

  Future<void> _checkForUpdate() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    setState(() {});
    const latestVersion =
        '1.0.23'; // You can fetch this from an API in real apps

    if (_isVersionOlder(currentVersion, latestversion)) {
      _showUpdateDialog();
    }
  }

  bool _isVersionOlder(String current, String latest) {
    List<int> currentParts = current.split('.').map(int.parse).toList();
    List<int> latestParts = latest.split('.').map(int.parse).toList();

    for (int i = 0; i < latestParts.length; i++) {
      if (i >= currentParts.length || currentParts[i] < latestParts[i]) {
        return true;
      } else if (currentParts[i] > latestParts[i]) {
        return false;
      }
    }
    return false;
  }

  void _showUpdateDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Update Available"),
        content: const Text(
            "A new version of the app is available. Please update to continue."),
        actions: [
          TextButton(
            onPressed: () {
              _launchStoreUrl();
              Navigator.pop(context);
            },
            child: const Text("Update Now"),
          ),
        ],
      ),
    );
  }

  Future<void> _launchStoreUrl() async {
    final url = Platform.isIOS ? _androidUrl : _androidUrl;
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
