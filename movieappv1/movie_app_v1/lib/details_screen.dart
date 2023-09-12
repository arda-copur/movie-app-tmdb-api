import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app_v1/widgets/constants.dart';
import 'model/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({ Key? key, required this.movie }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight:400,
          stretch: true,
          leading: Container(
          height: 70, width: 70, margin: const EdgeInsets.only(top: 16,left: 16),
          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(onPressed: () {
            Navigator.pop(context);
          },
          icon: const Padding(
            padding:  EdgeInsets.only(left: 4),
            child:  Icon(Icons.arrow_back_ios),
          ),
          ),
        ),
        backgroundColor: Colors.black,  
        pinned: true,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(movie.title ?? "",
          style: const TextStyle(
          fontSize: 22,fontWeight: FontWeight.bold),),
          background: ClipRRect( 
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),        
            child: Image.network('${Constants.imagePath}${movie.backdropPath}',
            filterQuality:FilterQuality.high,
            fit: BoxFit.none,
            ),
          ),
          ),
        ),
         SliverToBoxAdapter(
          child: Padding(padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Center(
              child: Text("Overview",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            const SizedBox(height: 16, ),
            Text(movie.overview ?? "", style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400,
            color: Colors.white),
            ),
            const SizedBox(height: 16,),
            SizedBox(child: Row(children: [
              Container(padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                const Text("Release Data: ", style: TextStyle(fontSize: 16, 
              fontWeight: FontWeight.bold,color: Colors.white),
              ),
                 Text(movie.releaseDate ?? "", style: const TextStyle(fontSize: 16, 
              fontWeight: FontWeight.bold, color: Colors.white),
              ),
              ],
              ),
              ),
               Container(padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                const Text("Rating: ", style: TextStyle(fontSize: 16, 
              fontWeight: FontWeight.bold,color: Colors.white),
              ),
               const Icon(Icons.star,color: Colors.yellow,),
               Text('${movie.voteAverage!.toStringAsFixed(1)}/10',style: const TextStyle(color: Colors.white),)
              ],
              ),
              ),
            ],),)
          ],),
          ),
        )
      ],
      ),
    );
  }
}