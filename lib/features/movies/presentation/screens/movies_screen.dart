import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies_app/features/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/features/movies/presentation/controllers/movies_state.dart';


class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) {
      return MoviesBloc(sl())..add(GetNowPlayingMoviesEvent());
    },
    child: BlocBuilder<MoviesBloc,MoviesState>(builder: (context , state){
      return const Scaffold();
    },));
  }
}

