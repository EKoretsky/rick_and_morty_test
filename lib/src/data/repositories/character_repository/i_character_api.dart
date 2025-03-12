import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/data/dto/character_dto.dart';

abstract interface class ICharactersApi {
  Future<List<CharacterDto>> getListOfCharacters(int? page);

  Future<CharacterDto> getCharacter(CharacterID id);
}