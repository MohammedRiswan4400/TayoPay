part of 'profile_bloc.dart';

abstract class ProfileState {}

abstract class ProfileActionState extends ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileSuccessfulStete extends ProfileState {
  final UserModle posts;

  ProfileSuccessfulStete({required this.posts});
}

class ProfileSuccessfulForFavStete extends ProfileState {
  final UserModle profile;

  ProfileSuccessfulForFavStete({required this.profile});
}
