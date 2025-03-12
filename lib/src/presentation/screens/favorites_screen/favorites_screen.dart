import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_effective/src/presentation/screens/home_screen/character_card.dart';
import 'package:test_effective/src/presentation/screens/home_screen/characters_bloc/characters_bloc.dart';
import 'package:test_effective/src/presentation/shared/headline_medium.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded && state.listOfFavorites.isEmpty) {
          return Center(child: HeadlineMedium('Is Empty'));
        }

        if (state is CharactersLoaded) {
          return ListView.builder(
            itemCount: state.listOfFavorites.length,
            itemBuilder: (context, index) {
              final character = state.listOfFavorites[index];
              return CharacterCard(character: character);
            },
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
