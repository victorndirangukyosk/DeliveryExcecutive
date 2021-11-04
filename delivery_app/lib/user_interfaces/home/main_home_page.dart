import 'package:delivery_app/cubits/user_interface/home_bottom_navigation_index_cubit.dart';
import 'package:delivery_app/user_interfaces/home/home_tab/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'history_tab/history_tab.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = const [HomeTab(), HistoryTab()];

    return Scaffold(
      body: widgets[context.watch<HomeBottomNavigationIndexCubit>().state],
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: context.watch<HomeBottomNavigationIndexCubit>().state,
          onTap: (index) {
            context.read<HomeBottomNavigationIndexCubit>().emit(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.history))
          ]),
    );
  }
}
