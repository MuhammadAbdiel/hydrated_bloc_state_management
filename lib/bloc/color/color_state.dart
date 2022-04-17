part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color colorValue;

  const ColorState(this.colorValue);

  @override
  List<Object?> get props => [colorValue];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll(
      {
        'colorValue': colorValue.value,
      },
    );

    return result;
  }

  factory ColorState.fromMap(Map<String, dynamic> map) {
    return ColorState(
      Color(
        map['colorValue'],
      ),
    );
  }
}

class ColorInitial extends ColorState {
  const ColorInitial() : super(Colors.blue);
}

class ColorLoaded extends ColorState {
  const ColorLoaded(Color color) : super(color);
}

class AmberState extends ColorState {
  const AmberState(Color color) : super(color);
}

class BlueState extends ColorState {
  const BlueState(Color color) : super(color);
}
