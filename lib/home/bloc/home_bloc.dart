import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:comic_book/home/models/home_comic_data_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvents>(homeInitialEvents);
  }

  FutureOr<void> homeInitialEvents(
      HomeInitialEvents event, Emitter<HomeState> emitter) async {
    Response response;
    var dio = Dio();
      response = await dio.get('https://comicvine.gamespot.com/api/issues/?api_key=1ad1a2736ff7e2063b61172bbaa76302508e3a48&format=json');
      Comic comicDataModule = Comic.fromJson(response.data);

      emit(HomeLoadedSuccessState(comicDataModule: comicDataModule));
  }
}
