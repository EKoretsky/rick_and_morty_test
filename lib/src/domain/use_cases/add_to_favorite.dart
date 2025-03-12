import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/domain/entities/character.dart';
import 'package:test_effective/src/domain/repositories/i_character_repository.dart';

class AddToFavorite {
  AddToFavorite();

  Stream<CharacterID> call(CharacterID id) async* {
    yield id;
  }
}