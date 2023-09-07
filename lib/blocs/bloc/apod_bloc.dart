import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cook_gpt/const/const.dart';
import 'package:cook_gpt/models/apod_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'apod_event.dart';
part 'apod_state.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  ApodBloc() : super(ApodLoading()) {
    on<ApodInitialFetchEvent>(apodInitialFetchEvent);
  }

  FutureOr<void> apodInitialFetchEvent(
      ApodInitialFetchEvent event, Emitter<ApodState> emit) async {
    var client = http.Client();
    try {
      List<Apod> Apods = [];
      // Calculate start and end dates
      final endDate = DateTime.now();
      final startDate = endDate.subtract(Duration(days: 50));

      // Format the dates as needed for your API request
      final formattedStartDate =
          "${startDate.year}-${startDate.month}-${startDate.day}";
      final formattedEndDate =
          "${endDate.year}-${endDate.month}-${endDate.day}";
      var response = await client.get(
        Uri.parse(
            'https://api.nasa.gov/planetary/apod?api_key=$apiKey&start_date=$formattedStartDate&end_date=$formattedEndDate'),
      );
      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        Apod apod = Apod.fromMap(result[i]);
        Apods.add(apod);
      }

      emit(ApodLoaded(apods: Apods));
    } catch (e) {
      print('error in bloc');
      print(e);
    }
  }
}
