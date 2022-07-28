// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      page: json['page'] as int,
      movieList: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.movieList,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
