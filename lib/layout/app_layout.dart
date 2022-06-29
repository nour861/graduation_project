import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit.dart';
import '../state.dart';

class AppLayout extends StatelessWidget {
  bool type;
  AppLayout({required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DoctorCubit.get(context);
          Widget screen;
          if (type) {
            screen = cubit.bodyPatient[cubit.currentIndex];
            print('type:$type');
          } else {
            screen = cubit.bodyDoctor[cubit.currentIndex];
            print('type:$type');
          }

          return Scaffold(
            appBar: AppBar(
              title: cubit.bar[cubit.currentIndex],
            ),
            body: screen,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'Notifications'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: 'Profile'),
              ],
            ),
          );
        });
  }
}
