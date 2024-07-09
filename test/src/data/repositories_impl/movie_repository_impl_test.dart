import 'package:app_movies_demo_exito_2/global/api/api_client.dart';
import 'package:app_movies_demo_exito_2/global/custom_exception.dart';
import 'package:app_movies_demo_exito_2/src/data/datasources/api/movies_api.dart';
import 'package:app_movies_demo_exito_2/src/data/repositories_impl/movie_repository_impl.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/casting_movie.dart';
import 'package:app_movies_demo_exito_2/src/domain/models/pagination_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MoviesApiMock extends Mock implements MoviesApi {}

void main() {
  GetIt.I.registerSingleton<MoviesApi>(MoviesApiMock());
  group('Movies Repository Implementation instance', () {
    final movieRepositoryImpl = MovieRepositoryImpl();
    group('Get Movies Now Playing Testing', () {
      test('Get movies Now Playing throw error', () async {
        when(() => GetIt.I<MoviesApi>().getMoviesNowPlaying()).thenAnswer(
          (invocation) async =>
              {'total_pages': null, 'total_results': null, 'results': []},
        );
        expect(movieRepositoryImpl.getMoviesNowPlaying(),
            throwsA(isA<CustomException>()));
      });

      test('Get movies Now Playing Response movie', () async {
        when(() => GetIt.I<MoviesApi>().getMoviesNowPlaying()).thenAnswer(
          (invocation) async =>
              {'total_pages': 0, 'total_results': 0, 'results': []},
        );
        expect(await movieRepositoryImpl.getMoviesNowPlaying(),
            isA<PaginationMovies>());
      });
    });

    group('Get Movies Popular Testing', () {
      test('Get movies Popular throw error', () async {
        when(() => GetIt.I<MoviesApi>().getMoviesPopular(1)).thenAnswer(
          (invocation) async => {'pag': 0},
        );
        expect(movieRepositoryImpl.getMoviesPopular(1),
            throwsA(isA<CustomException>()));
      });

      test('Get movies Popular Response movie', () async {
        when(() => GetIt.I<MoviesApi>().getMoviesPopular(1)).thenAnswer(
          (invocation) async =>
              {'total_pages': 0, 'total_results': 0, 'results': []},
        );
        expect(await movieRepositoryImpl.getMoviesPopular(1),
            isA<PaginationMovies>());
      });
    });

    group('Get casting movies Testing', () {
      test('Get casting movie throw error', () async {
        when(() => GetIt.I<MoviesApi>().getCastingMovie('x')).thenAnswer(
          (invocation) async => {
            'cast': [
              {'name': null, 'image': null}
            ],
          },
        );
        expect(
          movieRepositoryImpl.getCastingMovie('x'),
          throwsA(isA<CustomException>()),
        );
      });

      test('Get casting movies Response casting', () async {
        when(() => GetIt.I<MoviesApi>().getCastingMovie('x')).thenAnswer(
          (invocation) async => {
            'cast': [
              {'name': 'prueba', 'image': null}
            ],
          },
        );
        expect(
          await movieRepositoryImpl.getCastingMovie('x'),
          isA<List<CastingMovie>>(),
        );
      });
    });
  });
}
