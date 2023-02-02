import 'package:exam5/Blocs_Cubits/Cubit/Tabbox_Cubit/tab_box_cubit.dart';
import 'package:exam5/Views/Page_A.dart';
import 'package:exam5/Views/Page_B.dart';
import 'package:exam5/Views/Page_C.dart';
import 'package:exam5/Views/Page_D.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBox extends StatefulWidget {
  TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const PageA(),
      const PageB(),
      const PageC(),
      const PageD(),
    ];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.withOpacity(1.0),
      //drawer: const CustomDrawer(),
      body: BlocBuilder<TabBoxCubit, TabBoxState>(
        builder: (cubit, state) {
          return Scaffold(
            body: screens[state.currentPage],
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels:true ,
              backgroundColor: Colors.blueAccent,
                currentIndex: state.currentPage,
                selectedItemColor:  Colors.red,
                unselectedItemColor: Colors.yellow.withOpacity(0.6),
                onTap: (value) =>
                    context.read<TabBoxCubit>().changeTabState(value),
                selectedLabelStyle: const TextStyle(color: Colors.grey),
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                items: const [
                  BottomNavigationBarItem(
                    icon: Text(
                      "A",
                      style: TextStyle(fontSize: 24,color: Colors.red),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: Text(
                        "B",
                        style: TextStyle(fontSize: 24,color: Colors.black),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Text(
                        "C",
                        style: TextStyle(fontSize: 24,color: Colors.blue),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Text(
                        "D",
                        style: TextStyle(fontSize: 24,color: Colors.pink),
                      ),
                      label: ""),
                ]),
          );
        },
      ),
    );
  }
}
