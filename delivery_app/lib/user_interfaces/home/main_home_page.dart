import 'package:delivery_app/cubits/user_interface/home_bottom_navigation_index_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.green,
      ),
    ];

    return Scaffold(
      body: widgets[context.watch<HomeBottomNavigationIndexCubit>().state],
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: context.watch<HomeBottomNavigationIndexCubit>().state,
          onTap: (index) {
            context.read<HomeBottomNavigationIndexCubit>().emit(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.building_2_fill))
          ]),
    );
  }
}
