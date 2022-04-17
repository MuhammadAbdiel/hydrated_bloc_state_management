import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends HydratedBloc<ColorEvent, ColorState> {
  ColorBloc() : super(const ColorInitial()) {
    on<ToAmberEvent>((event, emit) {
      emit(const AmberState(Colors.amber));
    });
    on<ToBlueEvent>((event, emit) {
      emit(const BlueState(Colors.blue));
    });
  }

  @override
  ColorState? fromJson(Map<String, dynamic> json) {
    return ColorState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ColorState state) {
    return state.toMap();
  }
}
