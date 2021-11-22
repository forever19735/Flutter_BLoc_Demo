import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_demo/api/services.dart';
import 'package:bloc_demo/api/exceptions.dart';
import 'events.dart';
import 'states.dart';
import 'package:bloc_demo/models/albums_list.dart';

class AlbumsBloc extends Bloc<AlbumEvents, AlbumState> {
  final AlbumsRepo albumRepo;
  List<Album> albums = [];

  AlbumsBloc({required this.albumRepo}) : super(AlbumsInitState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvents event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumRepo.getAlbumList();
          yield AlbumsLoaded(albums: albums);
        } on SocketException {
          yield AlbumsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AlbumsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AlbumsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AlbumsListError(
            error: UnknownException('Unknown Error'),
          );
        }

        break;
    }

  }
}