import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(const ColorInitial()) {
    on<ColorEvent>((event, emit) {
      if (event is ToAmberEvent) {
        emit(const ColorLoaded(Colors.amber));
      } else if (event is ToBlueEvent) {
        emit(const ColorLoaded(Colors.blue));
      }
    });
  }
}
