import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_effective/src/core/extension_types/character_id.dart';
import 'package:test_effective/src/domain/entities/character.dart';
import 'package:test_effective/src/domain/repositories/i_character_repository.dart';
import 'package:test_effective/src/domain/use_cases/get_list_of_characters.dart';
import 'package:test_effective/src/domain/use_cases/get_more_characters.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvt, CharactersState> {
  CharactersBloc(this._repository) : super(CharactersInit()) {
    on<_Get>(_getCharacters);
    on<_GetMore>(_getMoreCharacters);
    // on<_AddToFavorites>(_toggleFavorite);
    on<_AddToFavorites>(_addToFavorites);
    on<_RemoveFromFavorites>(_removeFromFavorites);
  }

  final ICharacterRepository _repository;

  Future<void> _getCharacters(_Get evt, Emitter<CharactersState> emit) async {
    emit(CharactersLoading());

    final getMap = GetListOfCharacters(_repository);
    final result = await getMap();

    emit(CharactersLoaded(result));
  }

  Future<void> _getMoreCharacters(_GetMore evt, Emitter<CharactersState> emit) async {
    final newMapOfCharacters = Map.of((state as CharactersLoaded)._characters);

    final getMap = GetMoreCharacters(_repository);
    final result = await getMap(evt.pageNumber);

    newMapOfCharacters.addAll(result);

    emit(CharactersLoaded(newMapOfCharacters));
  }


  // void _toggleFavorite(_AddToFavorites evt, Emitter<CharactersState> emit) {
  //   final characters = (state as CharactersLoaded)._characters;
  //   characters.update(evt.id, (character) => character.copyWith(isFavorite: !character.isFavorite));
  //   emit(CharactersLoaded(characters));
  // }

  void _addToFavorites(_AddToFavorites evt, Emitter<CharactersState> emit) {
    final characters = (state as CharactersLoaded)._characters;
    characters.update(evt.id, (character) => character.copyWith(isFavorite: true));
    emit(CharactersLoaded(characters));
  }

  void _removeFromFavorites(_RemoveFromFavorites evt, Emitter<CharactersState> emit) {
    final characters = (state as CharactersLoaded)._characters;
    characters.update(evt.id, (character) => character.copyWith(isFavorite: false));
    emit(CharactersLoaded(characters));
  }
}
