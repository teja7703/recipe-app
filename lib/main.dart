import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';
import 'recipe_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => RecipeBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Recipe Application',
                style: TextStyle(fontSize: 18)),
            backgroundColor: Colors.green,
          ),
          body: const RecipeList(),
        ),
      ),
    );
  }
}
