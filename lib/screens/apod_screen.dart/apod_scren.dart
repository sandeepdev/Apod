import 'package:cook_gpt/blocs/bloc/apod_bloc.dart';
import 'package:cook_gpt/models/apod_model.dart';
import 'package:flip_carousel/flip_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: BlocBuilder<ApodBloc, ApodState>(builder: (context, state) {
        if (state is ApodLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ApodLoaded) {
          // Handle loaded state, display the list of APOD items in FlipCarousel
          final apods = state.apods;
          // final apodData = apods.map(
          //   (apod) {
          //     return Apod(
          //         date: apod.date,
          //         explanation: apod.explanation,
          //         hdurl: apod.hdurl,
          //         title: apod.title);
          //   },
          // ).toList();

          final imgUrls = apods.map((apod) => apod.url).toList();

          return FlipCarousel(
            items: imgUrls,
            transitionDuration: const Duration(milliseconds: 400),
            isAssetImage: false,
            border: Border.all(width: 5, color: const Color(0xFFFFFFFF)),
            width: 250,
            height: 400,
            fit: BoxFit.cover,
            perspectiveFactor: 0.002,
            layersGap: 30,
            onChange: (int pageIndex) {
              print(pageIndex);
            },
            onTap: () {
              print("tap");
            },
          );
        } else {
          return Text('errot in ui');
        }
      }),
    );
  }
}
