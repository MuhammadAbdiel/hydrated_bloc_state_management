import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_package/bloc/color/color_bloc.dart';
import 'package:flutter_bloc_package/bloc/color_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
    blocObserver: ColorBlocObserver(),
  );
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
              BlocConsumer<ColorBloc, ColorState>(
                listener: (context, state) {
                  if (state is AmberState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Successfully changed to Amber',
                        ),
                        duration: Duration(
                          milliseconds: 1000,
                        ),
                      ),
                    );
                  } else if (state is BlueState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Successfully changed to Blue',
                        ),
                        duration: Duration(
                          milliseconds: 1000,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) => AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 100,
                  height: 100,
                  color: state.colorValue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
