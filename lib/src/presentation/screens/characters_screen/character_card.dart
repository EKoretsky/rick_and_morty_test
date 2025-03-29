import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_effective/src/domain/entities/character.dart';
import 'package:test_effective/src/presentation/screens/characters_screen/characters_bloc/characters_bloc.dart';
import 'package:test_effective/src/presentation/shared/body_large.dart';
import 'package:test_effective/src/presentation/shared/headline_small.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Image.network(character.image, gaplessPlayback: true, height: 120, width: 120),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      Flexible(child: HeadlineSmall(character.name)),
                      IconButton(
                        icon: character.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
                        constraints: BoxConstraints(),
                        onPressed: () {
                          final bloc = BlocProvider.of<CharactersBloc>(context);
                          bloc.add(CharactersEvt.toggleFavorite(character.id));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [BodyLarge('status:'), BodyLarge(character.status, overFlow: TextOverflow.ellipsis)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [BodyLarge('species:'), BodyLarge(character.species, overFlow: TextOverflow.ellipsis)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [BodyLarge('gender:'), BodyLarge(character.gender, overFlow: TextOverflow.ellipsis)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
