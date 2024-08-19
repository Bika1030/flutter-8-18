import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/movie/model/index.dart';
import 'package:movie_app/screems/movie_detail.dart';

class MovieSpecialCard extends StatelessWidget {

  final MovieModel data;

  const MovieSpecialCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    
    double  width  =MediaQuery.of(context).size.width * 0.5;

     void _onCardTap(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>MovieDetail(data))
    );
  }

    return InkWell(
      onTap: () => _onCardTap(context),
      child:Container(
      height: width * 1.3,
      width: width,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: NetworkImage(data.imgUrl),
          fit: BoxFit.fill, 
        ),   
      ),
      child: Icon(Icons.play_circle, color: Colors.grey,size: 40,),
      )
    );
  }
}