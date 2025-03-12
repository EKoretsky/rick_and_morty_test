import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_effective/src/core/rest_client/rest_client.dart';
import 'package:test_effective/src/data/data_source/remote/character_api.dart';
import 'package:test_effective/src/data/repositories/character_repository/character_repository.dart';
import 'package:test_effective/src/presentation/screens/home_screen/characters_bloc/characters_bloc.dart';

class DiContainer extends StatelessWidget {
  const DiContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) {
            final characterApi = CharacterApi(RestClient());
            return CharacterRepository(characterApi);
          },
        ),
        BlocProvider(
          create: (context) {
            final repo = RepositoryProvider.of<CharacterRepository>(context);
            return CharactersBloc(repo)..add(CharactersEvt.getCharacters());
          },
        ),
        // ChangeNotifierProvider(
        //   create: (context) {
        //     return CharactersVm(context.read<CharacterRepository>());
        //   },
        // ),
        // ChangeNotifierProvider(
        //   create: (context) {
        //     return FavoritesVm();
        //   },
        // ),
      ],
      child: child,
    );
  }
}
