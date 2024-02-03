import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/app.dart';
import 'package:paldex/core/network.dart';
import 'package:paldex/data/repositories/item_repository.dart';
import 'package:paldex/data/repositories/pal_repository.dart';
import 'package:paldex/data/source/local/local_datasource.dart';
import 'package:paldex/data/source/remote/remote_datasource.dart';
import 'package:paldex/states/theme/theme_cubit.dart';
import 'package:paldex/states/item/item_bloc.dart';
import 'package:paldex/states/pal/pal_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDataSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        ///
        /// Services
        ///
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),

        ///
        /// Data sources
        ///
        RepositoryProvider<LocalDataSource>(
          create: (context) => LocalDataSource(),
        ),
        RepositoryProvider<RemoteDataSource>(
          create: (context) => RemoteDataSource(context.read<NetworkManager>()),
        ),

        ///
        /// Repositories
        ///
        RepositoryProvider<PalRepository>(
          create: (context) => PalDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<RemoteDataSource>(),
          ),
        ),

        RepositoryProvider<ItemRepository>(
          create: (context) => ItemDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<RemoteDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          ///
          /// BLoCs
          ///
          BlocProvider<PalBloc>(
            create: (context) => PalBloc(context.read<PalRepository>()),
          ),
          BlocProvider<ItemBloc>(
            create: (context) => ItemBloc(context.read<ItemRepository>()),
          ),

          ///
          /// Theme Cubit
          ///
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          )
        ],
        child: const PaldexApp(),
      ),
    ),
  );
}
