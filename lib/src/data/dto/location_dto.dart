import 'package:json_annotation/json_annotation.dart';
import 'package:test_effective/src/core/interfaces/i_dto.dart';
import 'package:test_effective/src/domain/entities/location.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto implements IDto<Location> {
  LocationDto({required this.name, required this.url});

  String name;
  String url;

  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return _$LocationDtoFromJson(json);
  }

  @override
  Location toEntity() => Location(name: name, url: url);
}
