part of 'apod_bloc.dart';

@immutable
sealed class ApodEvent {}

class ApodInitialFetchEvent extends ApodEvent {}
