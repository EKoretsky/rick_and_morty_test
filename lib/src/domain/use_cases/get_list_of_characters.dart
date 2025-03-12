import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/domain/entities/character.dart';
import 'package:test_effective/src/domain/repositories/i_character_repository.dart';

class GetListOfCharacters {
  GetListOfCharacters(this._repository);

  final ICharacterRepository _repository;

  Future<Map<CharacterID, Character>> call() async {
    final list = await _repository.getListOfCharacters();
    return {for (final item in list) item.id: item};
  }
}
