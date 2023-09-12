// ignore_for_file: unused_field

import 'dart:convert';
import 'package:movie_app_v1/model/movie.dart';
import 'package:movie_app_v1/widgets/constants.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_v1/widgets/trending_slider.dart';

class Api {
static const _trendlerUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
static const _cokIzlenenlerUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
static const _yakindaUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";

Future<List<Movie>> trendleriGetir() async{
final response = await http.get(Uri.parse(_trendlerUrl));
if (response.statusCode == 200) {
  final decotedData = jsonDecode(response.body)['results'] as List;
  return decotedData.map((movie) => Movie.fromJson(movie)).toList(); 
}
else {
  throw Exception("Bir şeyler yanlış gitti.");
}
}

Future<List<Movie>> enCokIzlenenGetir() async{
final response = await http.get(Uri.parse(_cokIzlenenlerUrl));
if (response.statusCode == 200) {
  final decotedData = jsonDecode(response.body)['results'] as List;
  return decotedData.map((movie) => Movie.fromJson(movie)).toList(); 
}
else {
  throw Exception("Bir şeyler yanlış gitti.");
}
}

Future<List<Movie>> yakindaCikacakGetir() async{
final response = await http.get(Uri.parse(_yakindaUrl));
if (response.statusCode == 200) {
  final decotedData = jsonDecode(response.body)['results'] as List;
  return decotedData.map((movie) => Movie.fromJson(movie)).toList(); 
}
else {
  throw Exception("Bir şeyler yanlış gitti.");
}
}

}