

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/movie/model/index.dart';

class MovieDetail extends StatelessWidget {
final MovieModel data;

  const MovieDetail(this.data,{super.key});

 
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Color(0xff36393f),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                 width: width,
                 height: width * 1.5,
                 child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      data.imgUrl,
                      width: width,
                      height: width,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.6),    
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Icon(
                            Icons.play_circle,
                            color: Colors.grey.withOpacity(0.5),
                            size: 70,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            data.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("${data.publishedYear} | ${data.durationMin} | ${data.type}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          
                          ),
                          SizedBox(
                            height: 70,
                          )        ,      
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop,
                        icon: Icon(
                          Icons.chevron_left_outlined,
                          color: Colors.white,
                          size: 39,
                        ),
                      ),
                    )
                  ],
                 ),
                    
                 
                ),
                Column(
                  children: [
                    Text("Тайлбар",
                     style: TextStyle(
                     color: Colors.white,
                     fontSize: 24,
                     fontWeight: FontWeight.bold
                     ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(textAlign: TextAlign.center, data.description ?? "",style: TextStyle(color: Colors.white),),
                  ],
                )
              ]
            )
          
          )
        ],
      ),
    );
  }
}