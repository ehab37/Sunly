import 'package:flutter_bloc/flutter_bloc.dart';

part 'temperature_unit_state.dart';

class TemperatureUnitCubit extends Cubit<TemperatureUnitState> {
  TemperatureUnitCubit()
    : super(
        const TemperatureUnitState(temperatureUnit: TemperatureUnit.celsius),
      );

  void toggleUnit() {
    if (state.temperatureUnit == TemperatureUnit.celsius) {
      emit(
        const TemperatureUnitState(temperatureUnit: TemperatureUnit.fahrenheit),
      );
    } else {
      emit(
        const TemperatureUnitState(temperatureUnit: TemperatureUnit.celsius),
      );
    }
  }
}
