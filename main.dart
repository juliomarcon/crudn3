import 'package:crudn3/user_form.dart';
import 'package:crudn3/user_list.dart';
import 'package:crudn3/user_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: const MaterialApp(
        title: 'CrudApp',
        home: UserForm(),
        routes: {
          "/create": (_) => UserForm(),
          "/list": (_) => UserList(),
        },
      ),
    );
  }
}
