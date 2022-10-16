import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'First App',
        ),
        actions: const [
          IconButton(
            onPressed: onNotification,
            icon: Icon(
              Icons.notification_important,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: onNotification,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Image(
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg',
                    ),
                    // fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(.5),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: const Text(
                      'Flower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: avoid_print
void onNotification() => print("clicked");
