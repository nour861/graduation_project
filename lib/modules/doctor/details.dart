import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit.dart';
import '../../shared/constants.dart';
import '../../state.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit()..getDoctorData(),
      child: BlocConsumer<DoctorCubit, DoctorStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: (DoctorCubit.get(context).userModel == null &&
                DoctorCubit.get(context).getDoctorData() == null),
            fallback: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },
            builder: (BuildContext context) => Scaffold(
              body: SafeArea(
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: [
                        Container(
                          width: 150,
                          height: 170,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/person.png',
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${DoctorCubit.get(context).userModel!.data!.userName}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.lightBlue),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // buildItem(title: 'Age', value: '50', lines: 1),

                        buildItem(
                            title: 'Address',
                            value:
                                '${DoctorCubit.get(context).userModel!.data!.address}',
                            lines: 1),
                        buildItem(
                            title: 'Phone', value: '+201015555596', lines: 1),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, right: 5),
                                  child: Text(
                                    '${DoctorCubit.get(context).userModel!.data!.birthDate}',
                                    style: TextStyle(
                                        color: iconColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Spacer(),
                                const Padding(
                                  padding: EdgeInsets.only(right: 25),
                                  child: Text('50',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        buildItem(
                            title: 'Medical History',
                            lines: 3,
                            value:
                                'The heart rate is slow and accompanied by a sharp drop in blood circulation'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildItem(
    {required String title, required String value, required int lines}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      // height: 95,
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                            color: iconColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('$value',
                            maxLines: lines,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey)),
                      )
                    ],
                  ),
                )
              ])),
    ),
  );
}
