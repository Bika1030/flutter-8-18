import 'package:flutter/material.dart';
import 'package:movie_app/movie/model/index.dart';
import 'package:movie_app/screems/movie_detail.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;

  const MovieCard(this.data ,{super.key});
  void _onCardTap(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>MovieDetail(data))
    );
  }

  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.of(context).size.width / 3 - 20;

    return InkWell( 

      child:  Col(
        Container(
          height: width * 1.5,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(data.imgUrl),
            )
          ),
        ),
        SizedBox(
          width: width,
          child: Text(data.title,
          textAlign: TextAlign.center, 
          style: TextStyle(color: Colors.white.withOpacity(0.6)),
          ),
        )

    ),
    );
    
  }
}