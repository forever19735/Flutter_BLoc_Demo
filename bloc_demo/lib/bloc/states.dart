import 'package:equatable/equatable.dart';
import 'package:bloc_demo/models/albums_list.dart';

abstract class AlbumState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumState {}

class AlbumsLoading extends AlbumState {}

class AlbumsLoaded extends AlbumState {
  final List<Album> albums;
  AlbumsLoaded({required this.albums});
}

class AlbumsListError extends AlbumState {
  final error;
  AlbumsListError({this.error});
}

