part of 'characters_bloc.dart';

sealed class CharactersEvt {
  factory CharactersEvt.getCharacters() => _Get();

  factory CharactersEvt.getMoreCharacters({required int pageNumber}) => _GetMore(pageNumber);

  factory CharactersEvt.init() => _Init();

  factory CharactersEvt.toggleFavorite(CharacterID id) => _ToggleFavorite(id);
}

final class _Init implements CharactersEvt {}

final class _Get implements CharactersEvt {}

final class _GetMore implements CharactersEvt {
  _GetMore(this.pageNumber);

  final int pageNumber;
}

final class _ToggleFavorite implements CharactersEvt {
  _ToggleFavorite(this.id);

  final CharacterID id;
}
