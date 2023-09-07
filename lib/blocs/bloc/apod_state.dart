part of 'apod_bloc.dart';

@immutable
sealed class ApodState {}

final class ApodLoading extends ApodState {}

final class ApodLoaded extends ApodState {
  final List<Apod> apods;

  ApodLoaded({required this.apods});
}
