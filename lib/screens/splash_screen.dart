import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../repositories/fetch_advice_repository/fetch_advice_repository.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: fetchAdvice(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Text('data');
    //     } else if (snapshot.hasError) {
    //       return const Text('error');
    //     } else {
    //       return Center(
    //         child: Text(snapshot.data ?? 'No advice available'),
    //       );
    //     }
    //   },
    // );
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 43, 51, 86),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Lottie.asset(
                    'assets/lottie_splash_animation/animation_llzemkv3.json',
                    fit: BoxFit.fill),
              ),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future: fetchAdvice(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('data');
                  } else if (snapshot.hasError) {
                    return const Text('error');
                  } else {
                    return Container(
                      padding: const EdgeInsets.only(left: 25, right: 20),
                      alignment: Alignment.bottomCenter,
                      child: Text(snapshot.data ?? 'No advice available',
                          style: Theme.of(context).textTheme.bodyLarge),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}
