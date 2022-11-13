import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';

// 1. create database
// 2. create tables
// 3. open database (create object)
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titleTasks[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        elevation: 25.0,
                        (context) => Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: Form(
                            key: formKey,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Components.defaultFormField(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  onTap: () {
                                    ///////////////// المحاضره رقم 90 دقيقة 00:00 ///////////////////////////////////////////////////
                                    titleController;
                                    // return null;
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Title can\'t be empty';
                                    }
                                  },
                                  label: 'Task Title',
                                  hint: 'Task Title',
                                  prefix: Icons.title,
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Components.defaultFormField(
                                  controller: timeController,
                                  type: TextInputType.text,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value!.format(context).toString();
                                      debugPrint(
                                          value.format(context).toString());
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Time can\'t be empty';
                                    }
                                  },
                                  label: 'Task Time',
                                  hint: 'Task Time',
                                  prefix: Icons.watch_later_outlined,
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Components.defaultFormField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.utc(2050),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMMd().format(value!);
                                      debugPrint(
                                          DateFormat.yMMMMd().format(value));
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Date can\'t be empty';
                                    }
                                  },
                                  label: 'Task Date',
                                  hint: 'Task Date',
                                  prefix: Icons.calendar_today,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });
                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              // async {
              //   try {
              //     String name = await getName();
              //     debugPrint(name);
              //     throw ('some error !!!!!!!');
              //   } catch (error) {
              //     debugPrint('Error is ${error.toString()}');
              //   }
              // },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.menu,
                      ),
                      label: 'Tasks'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.check_circle_outline,
                      ),
                      label: 'Done'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.archive_outlined,
                      ),
                      label: 'Archived'),
                ]),
          );
        },
      ),
    );
  }
}

// Future<String> getName() async {
//   return 'hesham alads';
// }
