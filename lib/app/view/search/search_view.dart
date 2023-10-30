import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> previousSearches = ['Harry Poster','sdifjowniewer'];
    List<String> searchResults = [];
    void _search(String query){
      setState(() {
        searchResults = previousSearches.where((element) => element.contains(query)).toList();
      });
    }
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: SizedBox(
              height: size.height*0.06,
              child: TextField(
                onChanged: (value){
                  _search(value);
                },
                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  prefixIcon: Icon(Icons.search,color: Colors.orange,),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close,color: Colors.orange,),
                    onPressed: (){

                    },
                  ),
                  hintText: 'Search...',

                ),
              ),

            ),
          ),
          body: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,0),
                  child: Text('Previous Search',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15,15,15,0),
                  child: Divider(
                    height: 0,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child:  ListView.builder(
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('searchResults[index]',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                            padding: EdgeInsets.zero,//bo padding
                            constraints: BoxConstraints(),//bo gioi han de can sat le
                            icon: Icon(Icons.close),
                            onPressed: (){

                            },
                          ),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
