import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int result;
  final int age;
  final bool isMale;

  const ResultScreen(
      {Key? key, required this.result, required this.age, required this.isMale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gender : ${isMale ? 'Male' : "Female"}',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Result : ${result.round()}',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Age : $age',
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
