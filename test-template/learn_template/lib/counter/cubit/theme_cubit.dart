import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<Brightness> {
  ThemeCubit() : super(Brightness.light);

  void setupDark() => emit(Brightness.dark);
  void setupLight() => emit(Brightness.light);
}
