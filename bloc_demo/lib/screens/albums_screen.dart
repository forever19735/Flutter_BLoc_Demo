import 'package:bloc_demo/bloc/bloc.dart';
import 'package:bloc_demo/widgets/error.dart';
import 'package:bloc_demo/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/events.dart';
import 'package:bloc_demo/bloc/states.dart';
import 'package:bloc_demo/models/albums_list.dart';
import 'package:bloc_demo/widgets/list_row.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAlbums();
  }

  Future<void> _loadAlbums() async {
    context.read<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Albums'),

        actions: [
          // Swi
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumState>(builder: (context, state) {
          if (state is AlbumsListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
                message: message,
                onTap: _loadAlbums
            );
          }

          if (state is AlbumsLoaded) {
            List<Album> albums = state.albums;
            /*return RefreshIndicator(
              child: _list(albums),
              onRefresh: _loadAlbums,
            );*/
            return _list(albums);
          }
          return Loading();
        })
      ],
    );
  }

  Widget _list(List<Album> albums) {
    return Expanded(
        child:ListView.builder(
          // itemExtent: 40,
          itemCount: albums.length,
          itemBuilder: (_, index) {
            Album album = albums[index];
            return ListRow(album: album);
          }),
    );
  }
}