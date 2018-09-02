import 'package:bloc_example/forecast_bloc.dart';
import 'package:flutter/material.dart';

class ForecastBlocProvider extends InheritedWidget {
  final ForecastBloc bloc;
  final Widget child;

  ForecastBlocProvider({this.bloc, this.child}) : super(child: child);
  static ForecastBlocProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(ForecastBlocProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}