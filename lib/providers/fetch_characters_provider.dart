import 'package:coba_riverpod/providers/fetch_characters_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/characters/character.dart';

final characterProvider =
    StateNotifierProvider<FetchCharactersProvider, FetchCharactersState>(
      (ref) =>
          FetchCharactersProvider(FetchCharactersState.initial())
            ..fetchCharacters(),
    );

class FetchCharactersProvider extends StateNotifier<FetchCharactersState> {
  FetchCharactersProvider(super.state);
  fetchCharacters() async {
    state = FetchCharactersState.fetching();
    try {
      Dio dio = Dio();
      final response = await dio.post(
        "https://rickandmortyapi.com/graphql",
        data: {
          "query": r'''
                  query {
                    characters {
                      results {
                        id
                        name
                        image
                        status
                      }
                    }
                  }
            ''',
        },
      );
      List<dynamic> responseData =
          response.data['data']['characters']['results'];
      state = FetchCharactersState.fetched(
        responseData.map((e) => Character.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      state = FetchCharactersState.failed(e.message.toString());
    } catch (e) {
      state = FetchCharactersState.failed(e.toString());
    }
  }
}
