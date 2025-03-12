import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/domain/entities/character.dart';
import 'package:test_effective/src/domain/repositories/i_character_repository.dart';

class GetMoreCharacters {
  GetMoreCharacters(this._repository);

  final ICharacterRepository _repository;

  Future<Map<CharacterID, Character>> call(int page) async {
    final list = await _repository.getListOfCharacters(page);
    return {for (final item in list) item.id: item};
  }
}
