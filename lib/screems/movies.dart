import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/movie/model/index.dart';
import 'package:movie_app/widgets/movie_card.dart';

import 'package:movie_app/widgets/movie_special_card.dart';


class MoviesPage extends StatefulWidget {
  const MoviesPage
({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  // List<MovieModel> _data = [];

  Future<List<MovieModel>> _getData()async{
    String res = await DefaultAssetBundle.of(context).loadString("assets/movies.json");

    return MovieModel.formList(jsonDecode(res));
  }
   

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future:_getData() ,
      builder: (context, snapshot){
     if(snapshot.hasData){
      final _specialData = snapshot.data!.length > 3 
        ?snapshot.data!.sublist(0,3)
        : snapshot.data!;
      return SingleChildScrollView(
      child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Padding(padding: EdgeInsets.only(left: 20),
        child:  Text("Шилдэг", 
        style: TextStyle(
          color: Colors.white, 
          fontSize: 24,
          fontWeight: FontWeight.bold,
          ),
        ),
        
        ),
        SizedBox(  
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: 
                List.generate(
                  _specialData.length,
                  ((index) => MovieSpecialCard(_specialData[index]))
                ),
            ), 
          ), 
        ),
        Padding(padding: EdgeInsets.only(left: 20),
        child:  Text("Бүх Кинонууд", 
        style: TextStyle(
          color: Colors.white, 
          fontSize: 24,
          fontWeight: FontWeight.bold,
          ),
        ),
        ),
       Padding(padding: EdgeInsets.only(left: 20),
        child: Wrap(
          spacing: 20,
          children: List.generate(_specialData.length, ((index) => MovieCard(_specialData[index]))
          ),
        ),
       )
      ],
      )
    );
    
  }else{
    return Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
        ),
      );
     }
    });

    
  }
}