
import 'package:flutter/material.dart';
import 'package:frame/app/logic/controller/search_controller.dart';
import 'package:frame/app/view/bookdetail/book_detail_view.dart';
import 'package:get/get.dart';




class SearchView extends GetView<SearchBookController> {
  SearchView({super.key});
  SearchBookController searchBookController = Get.put(SearchBookController());
  final searchField = TextEditingController();
  void clearSearch(){
    searchField.clear();
  }

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.orange,
          ),
          title: SizedBox(
            height: size.height*0.06,
            child: TextField(
              controller: searchField,
              onChanged: (value){
                searchBookController.searchListBook(searchField.text);

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
              // Container(
              //   height: size.height*0.05,
              //   padding: EdgeInsets.only(top: 10),
              //   child: ListView(
              //     physics: NeverScrollableScrollPhysics(),
              //     scrollDirection: Axis.horizontal,
              //     children: <Widget>[
              //       Container(
              //         height: size.height *0.1,
              //         child: Center(
              //           child: Padding(
              //             padding: EdgeInsets.fromLTRB(10,0,10,0),
              //             child: Text('Author',
              //               style: TextStyle(
              //                 color: Colors.orange,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20
              //               ),
              //             ),
              //           ),
              //         ),
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //           borderRadius: BorderRadius.circular(25),
              //           border: Border.all(color: Colors.orange),
              //           ),
              //         ),
              //       SizedBox(width: 5,),
              //       Container(
              //         height: size.height *0.1,
              //         child: Center(
              //           child: Padding(
              //             padding: EdgeInsets.fromLTRB(10,0,10,0),
              //             child: Text('Book',
              //               style: TextStyle(
              //                   color: Colors.orange,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20
              //               ),
              //             ),
              //           ),
              //         ),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(25),
              //           border: Border.all(color: Colors.orange),
              //         ),
              //       ),
              //       SizedBox(width: 5,),
              //       Container(
              //         height: size.height *0.1,
              //         child: Center(
              //           child: Padding(
              //             padding: EdgeInsets.fromLTRB(10,0,10,0),
              //             child: Text('Category',
              //               style: TextStyle(
              //                   color: Colors.orange,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20
              //               ),
              //             ),
              //           ),
              //         ),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(25),
              //           border: Border.all(color: Colors.orange),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SearchChoose(),
              Padding(
                padding: EdgeInsets.fromLTRB(0,15,0,0),
                child: Text('Search Result',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15,15,15,0),

              ),
              SearchGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchWhat{
  final int id;
  final String name;
  bool isSelected;

  SearchWhat(this.id, this.name, this.isSelected);
}

class SearchChoose extends StatefulWidget {
  SearchChoose({super.key});

  @override
  State<SearchChoose> createState() => _SearchChooseState();
}

class _SearchChooseState extends State<SearchChoose> {
  List<SearchWhat> searchWhat = <SearchWhat>[];

  @override
  void initState(){
    super.initState();
    // _setBrightness();
    searchWhat.add(SearchWhat(1, 'Book', true));
    searchWhat.add(SearchWhat(2, 'Author', false));
    searchWhat.add(SearchWhat(3, 'Category', false));

  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: searchWhat.map((item) => ChoiceChip(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(30),
        ),
        label: Text(item.name,
          style: TextStyle(
              fontSize: 15,
              color: item.isSelected?Colors.white :Colors.orange,
              fontWeight: FontWeight.bold
          ),
        ),
        selected: item.isSelected,
        onSelected: (isSelected){
          setState(() {
            item.isSelected = true;
            searchWhat.forEach((element) =>element.isSelected = false);
            item.isSelected = true;
          });
        },
        selectedColor: Colors.orange,
      ),
      ).toList(),
    );

  }

}

class SearchGridView extends StatefulWidget {
  const SearchGridView({super.key});

  @override
  State<SearchGridView> createState() => _SearchGridViewState();
}

class _SearchGridViewState extends State<SearchGridView> {

  @override
  Widget build(BuildContext context) {
    SearchBookController searchBookController = Get.put(SearchBookController());
    final Size size = MediaQuery.of(context).size;
    final double itemHeight =  size.height * 0.43;
    final double itemWidth = size.width /2;
    return  Expanded(
      child: Obx(
            () => searchBookController.isLoading.value
            ? Center(
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ))
            : GridView.builder(
          itemCount: searchBookController.listBookBySearch.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              childAspectRatio: (itemWidth/itemHeight)
          ),
          itemBuilder: (BuildContext context, index){
            final bookBySearch = searchBookController.listBookBySearch[index];
            return InkWell(
              onTap: (){
                Get.to(()=>BookDetailScreenNew(), arguments: bookBySearch);
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
                              image: NetworkImage('${bookBySearch.imagePath}'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${bookBySearch.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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

                        Text('${bookBySearch.averageRate}',
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
            );
          }


        ),
      ),
    );
  }
}


// class SearchGridView extends StatelessWidget{
//   const SearchGridView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double itemHeight =  size.height * 0.43;
//     final double itemWidth = size.width /2;
//     return  Expanded(
//       child: GridView.builder(
//         itemCount: 6,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             // mainAxisSpacing: 10,
//             childAspectRatio: (itemWidth/itemHeight)
//         ),
//         itemBuilder: (BuildContext context, index)=> InkWell(
//           onTap: (){
//             Get.to(()=>BookDetailScreenNew());
//           },
//           child: Container(
//             // color: Colors.orange,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:<Widget>[
//                 Container(
//                   // width: size.width * 0.8,
//                     height: size.height * 0.3,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: NetworkImage('https://m.media-amazon.com/images/I/61fqa1gbE5L._AC_UF1000,1000_QL80_.jpg'),
//                           fit: BoxFit.fill,
//                         ),
//                         borderRadius: BorderRadius.circular(10)
//                     )
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text('Reign of Blood',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       size:20,
//                       Icons.star_half,
//                       color: Colors.grey,
//                     ),
//
//                     Text('4.9',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//       ),
//     );
//   }
//
// }