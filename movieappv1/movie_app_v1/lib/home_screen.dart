// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:movie_app_v1/api/api.dart';
import 'package:movie_app_v1/widgets/movies_slider.dart';
import 'package:movie_app_v1/widgets/trending_slider.dart';

import 'model/movie.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Movie>> trendFilmler;
  late Future<List<Movie>> cokIzlenenFilmler;
  late Future<List<Movie>> yakindaCikacakFilmler;

@override
void initState() {
  super.initState();
  trendFilmler = Api().trendleriGetir();
  cokIzlenenFilmler = Api().enCokIzlenenGetir();
  yakindaCikacakFilmler = Api().yakindaCikacakGetir();
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image(image: NetworkImage("https://www.psdstamps.com/wp-content/uploads/2020/01/movies-stamp-png.png"),fit: BoxFit.cover,height: 100,
      filterQuality: FilterQuality.high,
      ),
      centerTitle: true,
      ),
      body:  SingleChildScrollView(physics: BouncingScrollPhysics(),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      Text("Trendler" ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white),),
     SizedBox(height: 12,),
     SizedBox(child: FutureBuilder(future: trendFilmler,builder: (context, snapshot) {
       if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()),);
       }
       else if (snapshot.hasData) {
        return  TrendingSlider(snapshot: snapshot,);
       }
       else {
        return const Center(child: CircularProgressIndicator(),);
       }
     },
     ),
     ),
     SizedBox(height: 20,),
     Text("Başyapıtlar",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
     ),
     const SizedBox(height: 20,),
      SizedBox(child: FutureBuilder(future: cokIzlenenFilmler,builder: (context, snapshot) {
       if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()),);
       }
       else if (snapshot.hasData) {
        return MoviesSlider(snapshot: snapshot,);
       }
       else {
        return const Center(child: CircularProgressIndicator(),);
       }
     },
     ),
     ),
     SizedBox(height: 20,),
     Text("Yakında",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
     ),
     const SizedBox(height: 20,),
       SizedBox(child: FutureBuilder(future: yakindaCikacakFilmler,builder: (context, snapshot) {
       if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()),);
       }
       else if (snapshot.hasData) {
        return MoviesSlider(snapshot: snapshot,);
       }
       else {
        return const Center(child: CircularProgressIndicator(),);
       }
     },
     ),
     ),
          ],
          ),
        ),
      ),
      ),
    );
  }
}

