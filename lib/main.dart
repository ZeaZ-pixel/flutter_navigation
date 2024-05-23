import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Routing and Navigation'),
          centerTitle: true,
        ),
        body: const HomePage(),
      ),
      routes: {
        'page2': (context) => Page2(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          const user = User(name: 'wewewe', age: 12);
          Navigator.pushNamed(context, 'page2', arguments: user);
        },
        child: const Text('Move to Page 2'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  late User user;

  Page2({super.key});

  @override
  Widget build(BuildContext context) {
    RouteSettings? settings = ModalRoute.of(context)?.settings;
    if (settings != null) {
      user = settings.arguments as User;
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Error: Settings are null'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name} - ${user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});
}
