import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Location extends Equatable {
  const Location({required this.name, required this.url});

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];

  @override
  bool? get stringify => true;

  Location copyWith({String? name, String? url}) {
    return Location(name: name ?? this.name, url: url ?? this.url);
  }
}
