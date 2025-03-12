import 'package:json_annotation/json_annotation.dart';
import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/core/interfaces/i_dto.dart';
import 'package:test_effective/src/domain/entities/character.dart';

import 'location_dto.dart';

part 'character_dto.g.dart';

@JsonSerializable()
class CharacterDto implements IDto<Character> {
  CharacterDto({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterDto.fromJson(Map<String, dynamic> json) {
    return _$CharacterDtoFromJson(json);
  }

  @JsonKey(fromJson: _fromJson)
  CharacterID id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationDto origin;
  LocationDto location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  static _fromJson(int id) => CharacterID(id);

  @override
  toEntity() => Character(
    id: id,
    created: created,
    episode: episode,
    gender: gender,
    image: image,
    location: location.toEntity(),
    name: name,
    origin: location.toEntity(),
    species: species,
    status: status,
    type: type,
    url: url,
  );
}
