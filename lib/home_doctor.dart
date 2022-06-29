import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/modules/doctor/add_patient.dart';
import 'package:untitled1/shared/cubit/cubit_doctor/cubit.dart';
import 'package:untitled1/shared/cubit/cubit_doctor/state.dart';

import '../../shared/component/components.dart';

class DoctorHomeScreen extends StatelessWidget {
  var control = TextEditingController();
  DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        bool isSearch = false;
        var cubit = DoctorCubit.get(context);
        cubit.getPatientData();
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          isSearch = false;
                        },
                        icon: Icon(Icons.arrow_back)),
                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: control,
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'patient id must not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text(
                            'Serach by Patient Id',
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          int id = int.parse(control.text);
                          isSearch = true;
                          if (id == Characters.empty) {
                            cubit.search(id);
                          }
                        },
                        icon: Icon(Icons.search)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'My Patient',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          navigateTo(context, AddPatient());
                        },
                        child: Text(
                          'Add Patient',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: cubit.json != null,
                    builder: (context) {
                      return isSearch == false
                          ? ListView.separated(
                              itemBuilder: (context, index) => buildPersonItem(
                                  cubit.json!['Data'][index], context),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 1,
                                  ),
                              itemCount: cubit.json!['Data'].length)
                          : buildPersonItem(cubit.json!['Data'], context);
                    },
                    fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
