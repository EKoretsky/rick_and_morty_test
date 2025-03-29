import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:test_effective/src/presentation/screens/characters_screen/character_card.dart';
import 'package:test_effective/src/presentation/screens/characters_screen/characters_bloc/characters_bloc.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  static final _log = Logger('HomeScreen');

  final _scrollController = ScrollController();
  var _currentPage = 1;

  static const FOR_INDICATOR = 1;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_loadMoreData);
  }

  void _loadMoreData() async {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _currentPage += 1;
      final bloc = BlocProvider.of<CharactersBloc>(context);
      bloc.add(CharactersEvt.getMoreCharacters(pageNumber: _currentPage));
    }
  }

  @override
  Widget build(BuildContext context) {

    _log.info('build CharacterScreen');

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          _log.info('CharactersState is ${state.runtimeType}');

          if (state is CharactersLoaded) {
            return ListView.builder(
              itemCount: state.listOfCharacters.length + FOR_INDICATOR,
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index < state.listOfCharacters.length) {
                  final character = state.listOfCharacters[index];
                  return CharacterCard(character: character);
                }
                return Padding(padding: EdgeInsets.all(32.0), child: Center(child: CircularProgressIndicator()));
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
