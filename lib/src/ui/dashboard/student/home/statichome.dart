import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iroots/bloc/mainbloc.dart';

class StaticHome extends StatefulWidget {
  const StaticHome({super.key});

  @override
  State<StaticHome> createState() => _StaticHomeState();
}

class _StaticHomeState extends State<StaticHome> {
  @override
  void initState() {
    BlocProvider.of<MainBloc>(context).add(GetDashboardStudentData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
