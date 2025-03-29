part of 'characters_bloc.dart';

sealed class CharactersState {}

final class CharactersInit implements CharactersState {}

final class CharactersLoading implements CharactersState {}

final class CharactersLoaded implements CharactersState {
  CharactersLoaded(this._characters);

  final Map<CharacterID, Character> _characters;

  List<Character> get listOfCharacters => _characters.values.toList();

  List<Character> get listOfFavorites => _characters.values.where((it) => it.isFavorite).toList();
}
