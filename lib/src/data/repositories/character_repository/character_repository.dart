import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/data/repositories/character_repository/i_character_api.dart';
import 'package:test_effective/src/domain/entities/character.dart';
import 'package:test_effective/src/domain/entities/location.dart';
import 'package:test_effective/src/domain/repositories/i_character_repository.dart';

final class CharacterRepository implements ICharacterRepository {
  CharacterRepository(this._remoteDataSource);

  final ICharactersApi _remoteDataSource;

  @override
  Future<Character> getCharacter(CharacterID id) async {
    final dto = await _remoteDataSource.getCharacter(id);
    return dto.toEntity();
  }

  @override
  Future<List<Character>> getListOfCharacters([int? page]) async {
    final listOfDto = await _remoteDataSource.getListOfCharacters(page);

    return listOfDto.map((dto) => dto.toEntity()).toList();
  }
}
