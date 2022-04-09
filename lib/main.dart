import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_package/bloc/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ToBlueEvent());
            },
            backgroundColor: Colors.blue,
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ToAmberEvent());
            },
            backgroundColor: Colors.amber,
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('BLoC State Management'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ColorBloc, ColorState>(
                builder: (context, state) => AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 100,
                  height: 100,
                  color: state.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
