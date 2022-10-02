import 'package:flutter/material.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
  });
}

List<UserModel> users = [
  UserModel(
    id: 1,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 2,
    name: 'Hesham MH',
    phone: '01271580071',
  ),
  UserModel(
    id: 3,
    name: 'Amr Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 4,
    name: 'Hamada Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 5,
    name: 'My Number Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 6,
    name: 'Abdo Alads',
    phone: '01024562047',
  ),
  UserModel(
    id: 7,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 8,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 9,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 10,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 11,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 12,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 13,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 14,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 15,
    name: 'Eman Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 16,
    name: 'Hesham Alads',
    phone: '01020082047',
  ),
  UserModel(
    id: 17,
    name: 'Ali Ahmed',
    phone: '01020082047',
  ),
  UserModel(
    id: 18,
    name: 'haitham Alads',
    phone: '01020082047',
  ),
];

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => buildChatItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 25.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
        ),
      ),
    );
  }

  Widget buildChatItem(UserModel user) => Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 10.0,
          end: 10.0,
          start: 10.0,
          bottom: 10.0,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 25.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${user.name}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${user.phone}',
                  style: const TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
          ],
        ),
      );
}
