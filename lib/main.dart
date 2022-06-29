import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/cubit/cubit_patient/cubit_patien.dart';
import 'package:untitled1/state.dart';

import 'cubit.dart';
import 'modules/welcome_screen.dart';

Future<void> main() async {
  // Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DoctorCubit()
              ..getDoctorData()
              ..getAllSpecialization()),
        BlocProvider(create: (context) => PatientCubit()..getData()),
      ],
      // create: (BuildContext context) {  create: (context) => DoctorCubit()..getProfile()},
      child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Rescuer',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.cyan,
              primaryIconTheme: const IconThemeData(
                color: Colors.white,
              ),
              iconTheme: const IconThemeData(
                color: Colors.cyan,
              ),
            ),
            home: const WelcomeScreen(),
          );
        },
      ),
    );
  }
}
