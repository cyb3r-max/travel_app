import 'package:equatable/equatable.dart';
import 'package:weather_app/model/data_model.dart';

abstract class CubateState extends Equatable{}

class InitialState extends CubateState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class WelcomeState extends CubateState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadingState extends CubateState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class LoadedState extends CubateState{

  List<DataModel> places;

  LoadedState(this.places);

  @override
  // TODO: implement props
  List<Object?> get props => [places];

}
class DetailState extends CubateState{

  final DataModel places;

  DetailState(this.places);

  @override
  // TODO: implement props
  List<Object?> get props => [places];

}