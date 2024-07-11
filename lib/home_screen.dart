import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail_screen.dart';

class homescreen extends StatefulWidget {

  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  var pokeApi = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List pokedex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      fetchPokemonData();
    }
  }
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children:[
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset('images/pokeball.png',fit: BoxFit.fitWidth,width: 200,),

          ),
          Positioned(
            top: 100,
              left: 50,
              child:
              Text("Pokedex",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
            children: [

             pokedex != null ? Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               childAspectRatio: 1.4
              ), itemCount: pokedex.length,
              itemBuilder: (context,index){
               var type= pokedex[index]['type'][0];
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: type=='Grass'? Colors.green : type == "Fire" ? Colors.deepOrange :
                        type=="Water" ? Colors.lightBlue : type=='Electric' ? Colors.yellowAccent:
                        type=="Rock" ? Colors.grey : type=="Ground" ? Colors.brown :
                        type == "Psychic" ? Colors.indigo : type== "Fighting" ? Colors.orange :
                        type=="Ghost" ? Colors.deepPurpleAccent : type == "Bug" ? Colors.greenAccent :
                        type =="Normal" ? Colors.black26 : type=='Poison' ? Colors.deepPurple :
                        Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child:Stack(
                        children:[
                          Positioned(
                          bottom: -10,
                              right: -10
                              ,child: Image.asset('images/pokeball.png',
                                height: 100, fit: BoxFit.fitHeight,)
                          ),

                          Positioned(
                            top: 20,
                            left: 10,
                            child: Text(
                              pokedex[index]['name'],
                              style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                          Positioned(
                            top: 45,
                            left: 20,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8, left: 8, top: 4, bottom: 4),
                                child: Text(
                                    type.toString(),
                                  style: TextStyle(
                                    color: Colors.white
                                  ),

                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.black26
                              ),
                            ),
                          ),


                          Positioned(
                              bottom: 5,
                              right: 5,

                              child:
                              Hero(
                                tag: index,
                                child: CachedNetworkImage(
                                    imageUrl: pokedex[index]['img'],
                                    height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              )

                          ),
                    ]
                      ),
                    ),
                  ),
                  onTap:(){
                    // TODO on tap navigate
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>PokemonDetailScreen(
                    pokemonDetail: pokedex[index],
                      color: type=='Grass'? Colors.green : type == "Fire" ? Colors.deepOrange :
                      type=="Water" ? Colors.lightBlue : type=='Electric' ? Colors.yellowAccent:
                      type=="Rock" ? Colors.grey : type=="Ground" ? Colors.brown :
                      type == "Psychic" ? Colors.indigo : type== "Fighting" ? Colors.orange :
                      type=="Ghost" ? Colors.deepPurpleAccent : type == "Bug" ? Colors.greenAccent :
                      type =="Normal" ? Colors.black26 : type=='Poison' ? Colors.deepPurple :
                      Colors.pink,
                      heroTag: index,
                    )
                    )
                    );
                  },
                );

              },
              ),
             ) :Center(
               child: CircularProgressIndicator(),
             )
            ],

                    ),
          ),
      ]
    )

    );
  }
  void fetchPokemonData (){
    var url = Uri.https("raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      if(value.statusCode== 200){
        var decodedjasondata = jsonDecode(value.body);
        pokedex= decodedjasondata['pokemon'];
        // print(pokedex[4]['name']);
        setState(() {

        });
      }
    });
  }
}
