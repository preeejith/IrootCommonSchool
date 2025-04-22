import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iroots/bloc/blocserver/serverhelper.dart';
import 'package:iroots/common/app_data.dart';
import 'package:iroots/src/controller/splash/splash_controller.dart';
import 'package:iroots/src/utility/const.dart';

import '../../../bloc/mainbloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetCurrentVersion());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (logic) => Scaffold(
        backgroundColor: ConstClass.themeColor,
        body: Center(
          child: ServerHelper.myschoolauth == "stmary_" ||
                  ServerHelper.myschoolauth == "stthomas_"
              ? Image.asset(
                  appIcon,
                  width: 200,
                  height: 200,
                  // color: Colors.white,
                )
              : ServerHelper.myschoolauth == "stpaul_"
                  ? CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(appIcon),
                    )
                  : Image.asset(
                      appIcon,
                      width: 200,
                      height: 200,
                      // color: Colors.white,
                    ),
        ),
      ),
    );
  }
}
