import 'package:logging/logging.dart';
import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/core/rest_client/rest_client.dart';
import 'package:test_effective/src/data/dto/character_dto.dart';
import 'package:test_effective/src/data/repositories/character_repository/i_character_api.dart';

class CharacterApi implements ICharactersApi {
  CharacterApi(this._client) {
    _log.info('CharacterApi was created');
  }

  static final _log = Logger('CharacterApi');

  final RestClient _client;

  @override
  Future<CharacterDto> getCharacter(CharacterID id) async {
    final response = await _client.get('/character/$id');
    return CharacterDto.fromJson(response.data!);
  }

  @override
  Future<List<CharacterDto>> getListOfCharacters(int? page) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/character',
      queryParameters: {if (page != null) 'page': page},
    );
    final listOfCharacters = response.data!['results'];

    final castedResponse = List.castFrom<dynamic, Map<String, dynamic>>(
      listOfCharacters,
    );

    return castedResponse.map((it) => CharacterDto.fromJson(it)).toList();
  }
}
