
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final searchField = TextEditingController();
    void clearSearch(){
      searchField.clear();
    }

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: size.height*0.06,
            child: TextField(
              controller: searchField,
              onChanged: (value){

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
                    clearSearch();
                  },
                ),
                hintText: 'Search...',

              ),
            ),

          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0,15,0,0),
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
              SearchGridView(),
            ],
          ),
        ),
      ),
    );
  }
}



class SearchListView extends StatelessWidget{
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context,index) =>
            InkWell(
              onTap: (){
                Get.to(()=>BookDetailScreenNew());
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                height: size.height * 0.3,
                // color: Colors.amber[600],
                child: Row(
                  children: <Widget>[
                    Container(
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://m.media-amazon.com/images/I/61fqa1gbE5L._AC_UF1000,1000_QL80_.jpg'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Reign of Blood',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Icon(
                                size:20,
                                Icons.star_half,
                                color: Colors.grey,
                              ),

                              Text('4.9',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: size.height*0.03,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEECEC),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Romance',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: size.height*0.03,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEECEC),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Young Adult',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: size.height*0.03,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEECEC),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Comedy',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        // SizedBox(height: 20,),
      ),
    );
  }

}


class SearchGridView extends StatelessWidget{
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24)/2.2;
    final double itemWidth = size.width /2;
    return  Expanded(
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: (itemWidth/itemHeight)
        ),
        itemBuilder: (BuildContext context, index)=> InkWell(
          onTap: (){
            Get.to(()=>BookDetailScreenNew());
          },
          child: Container(
            // color: Colors.orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                Container(
                  // width: size.width * 0.8,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://m.media-amazon.com/images/I/61fqa1gbE5L._AC_UF1000,1000_QL80_.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Reign of Blood',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      size:20,
                      Icons.star_half,
                      color: Colors.grey,
                    ),

                    Text('4.9',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }

}