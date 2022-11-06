import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/counter/cubit/cubit.dart';
import 'package:udemy_flutter/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (BuildContext context, CounterState state) => () {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Counter',
            ),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => CounterCubit.get(context).minus(),
                  child: const Text(
                    'MINUS',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Text(
                    '${CounterCubit.get(context).counter}',
                    style: const TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.w900),
                  ),
                ),
                TextButton(
                  onPressed: () => CounterCubit.get(context).plus(),
                  child: const Text(
                    'PLUS',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
