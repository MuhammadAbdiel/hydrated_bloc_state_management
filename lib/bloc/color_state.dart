part of 'color_bloc.dart';

@immutable
abstract class ColorState {
  final Color color;

  const ColorState(this.color);
}

class ColorInitial extends ColorState {
  const ColorInitial() : super(Colors.blue);
}

class ColorLoaded extends ColorState {
  const ColorLoaded(Color color) : super(color);
}
