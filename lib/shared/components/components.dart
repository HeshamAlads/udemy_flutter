import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';

class Components {
  static Widget defaultButton({
    double width = double.infinity,
    Color background = Colors.blue,
    bool isUpperCase = true,
    double radius = 10.0,
    required Function function,
    required String text,
  }) =>
      Container(
        width: width,
        height: 45.0,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );

  static Widget defaultFormField({
    required TextEditingController controller,
    required TextInputType type,
    Function? onSubmit,
    Function? onChanged,
    Function? onTap,
    required Function validate,
    bool isPassword = false,
    required String label,
    required String hint,
    IconData? prefix,
    IconData? suffix,
    Function? onTapEye,
  }) =>
      TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          onSubmit!(s);
          // other code >> onSubmit ?? (s);
        },
        onChanged: (s) {
          onChanged ?? (s);
          // if onChanged not != null : onChanged(value); <<<< hint <<<<
          // if (onChanged != null) { onChanged(value); } (this code)
        },
        onTap: () {
          onTap!();
        },
        obscureText: isPassword,
        validator: (value) {
          return validate(value);
        },
        // (value) => validate(value),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(
            onPressed: () => onTapEye!(),
            icon: Icon(suffix),
          ),
          border: const OutlineInputBorder(),
        ),
      );

  static Widget buildTaskItem(Map model, context) => Dismissible(
        key: Key(
          model['id'].toString(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                child: Text('${model['time']}'),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${model['title']}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('${model['date']}',
                        style: const TextStyle(
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'done', id: model['id']);
                },
                icon: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'archive', id: model['id']);
                },
                icon: const Icon(
                  Icons.archive,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        onDismissed: (direction) {
          AppCubit.get(context).deleteData(
            id: model['id'],
          );
        },
      );

  static Widget tasksBuilder({
    required List<Map> tasks,
  }) =>
      ConditionalBuilder(
        condition: tasks.isNotEmpty,
        builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              Components.buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: tasks.length,
        ),
        fallback: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.menu,
                color: Colors.grey,
                size: 100.0,
              ),
              Text(
                'No Tasks Yet, Please Add some Tasks',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}
