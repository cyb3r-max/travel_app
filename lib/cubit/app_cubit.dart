import 'package:bloc/bloc.dart';
import 'package:weather_app/cubit/app_cubit_state.dart';
import 'package:weather_app/model/data_model.dart';
import 'package:weather_app/services/data_service.dart';
class AppCubit extends Cubit<CubateState>{
  AppCubit({required this.data}):super(InitialState()){
    emit(WelcomeState());

  }
  final DataServices data;
  late final places;
  Future<void> getData() async {
    try{
      emit(LoadingState());
      places= await data.getInfo();
      emit(LoadedState(places));

    }catch(e){

    }
  }
  detaliState(DataModel dataModel){
    emit(DetailState(dataModel));
  }
}