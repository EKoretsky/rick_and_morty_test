import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/domain/entities/character.dart';

abstract interface class ICharacterRepository {
  Future<List<Character>> getListOfCharacters([int? page]);

  Future<Character> getCharacter(CharacterID id);
}
