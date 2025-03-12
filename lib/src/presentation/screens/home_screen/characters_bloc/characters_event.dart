part of 'characters_bloc.dart';

sealed class CharactersEvt {
  factory CharactersEvt.getCharacters() => _Get();

  factory CharactersEvt.getMoreCharacters({int pageNumber = 1}) => _GetMore(pageNumber);

  factory CharactersEvt.init() => _Init();

  factory CharactersEvt.addToFavorites(CharacterID id) => _AddToFavorites(id);
  factory CharactersEvt.removeFromFavorites(CharacterID id) => _AddToFavorites(id);
}

final class _Init implements CharactersEvt {}

final class _Get implements CharactersEvt {}

final class _GetMore implements CharactersEvt {
  _GetMore(this.pageNumber);

  final int pageNumber;
}

final class _AddToFavorites implements CharactersEvt {
  _AddToFavorites(this.id);

  final CharacterID id;
}

final class _RemoveFromFavorites implements CharactersEvt {
  _RemoveFromFavorites(this.id);

  final CharacterID id;
}
