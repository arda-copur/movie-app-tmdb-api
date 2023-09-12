import 'package:flutter/material.dart';
import 'package:movie_app_v1/widgets/constants.dart';

import '../details_screen.dart';

class MoviesSlider extends StatelessWidget {
  const MoviesSlider({
    Key? key, required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 200, width: double.infinity,
    child: ListView.builder(
    scrollDirection: Axis.horizontal, 
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(8), 
          child: GestureDetector(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailsScreen(movie: snapshot.data[index],
        ),
        ),
        );
            },
            child: ClipRRect(borderRadius: BorderRadius.circular(8),child:
             SizedBox( height: 200, width: 150,
             child: Image.network(
              '${Constants.imagePath}${snapshot.data![index].posterPath}'
             ),
             ),
             ),
          ),
           );
    },
    ),
    );
  }
}

