import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PokemonDetailScreen extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final int heroTag;

  const PokemonDetailScreen({super.key, this.pokemonDetail, required this.color, required this.heroTag});


  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 100,
            left: 5,
            child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white, size: 35,), onPressed:(){
              Navigator.pop(context);
            }),
          ),
          Positioned(
              top: 160,
              left: 20,
              child: Text(widget.pokemonDetail['name'], style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white,
              ),)),
          Positioned(
            top: 210,
              left: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,top: 4,bottom: 4),
                child: Container(
                  child: Text(widget.pokemonDetail['type'][0].toString(), style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white
                  ),),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    color: Colors.black26
                  ),

                ),
              ),

          ),
          Positioned(
              top: height*0.22,
              right: -10,
              child: Image.asset('images/pokeball.png', height: 200, fit: BoxFit.fitHeight,)
          ),

          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                              width: width * 0.3,
                              child: Text('Name', style: TextStyle(
                                color: Colors.blueGrey, fontSize: 18
                              ),)),
                          Container(
                              width: width * 0.3,
                              child: Text(widget.pokemonDetail['name'],style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                              ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                              width: width * 0.3,
                              child: Text('Height', style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18
                              ),)),
                          Container(
                              width: width * 0.3,
                              child: Text(widget.pokemonDetail['height'],style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                              ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                              width: width * 0.3,
                              child: Text('Weight', style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18
                              ),)),
                          Container(
                              width: width * 0.3,
                              child: Text(widget.pokemonDetail['weight'],style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                              ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                              width: width * 0.3,
                              child: Text('Spawn Time', style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18
                              ),)),
                          Container(
                              width: width * 0.3,
                              child: Text(widget.pokemonDetail['spawn_time'],style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                              ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                              width: width * 0.3,
                              child: Text('Weakness', style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18
                              ),)),
                          Container(
                              child: Text(widget.pokemonDetail['weaknesses'].join(' , '),style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                              ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                              width: width * 0.3,
                              child: Text('Prev Evo', style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18
                              ),
                              )
                          ),
                          widget.pokemonDetail['prev_evolution'] != null ?
                          SizedBox(
                            height: 20,
                            width: width *0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.pokemonDetail['prev_evolution'].length,
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(widget.pokemonDetail['prev_evolution'][index]['name'],style: TextStyle(
                                      color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                  ),
                                  ),
                                );
                              },
                            ),
                          ):
                          Text('Just Hatched',style: TextStyle(
                              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                              width: width * 0.3,
                              child: Text('Next Evo', style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18
                              ),
                              )
                          ),
                         widget.pokemonDetail['next_evolution'] != null ?
                         SizedBox(
                           height: 20,
                           width: width *0.55,
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                               itemCount: widget.pokemonDetail['next_evolution'].length,
                               itemBuilder: (context,index){
                                 return Padding(
                                   padding: const EdgeInsets.only(right: 8.0),
                                   child: Text(widget.pokemonDetail['next_evolution'][index]['name'],style: TextStyle(
                                       color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                                   ),
                                   ),
                                 );
                               },
                               ),
                         ):
                             Text('Maxed out',style: TextStyle(
                                 color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                             ),)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: height*0.25,
              right: -22,
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(imageUrl: widget.pokemonDetail['img'],
                  height: 220, fit: BoxFit.fitHeight,),
              ))

        ],
      ),
    );
  }
}
