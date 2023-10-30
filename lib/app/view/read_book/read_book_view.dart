import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_brightness/screen_brightness.dart';

class FontFamily{
  final int id;
  final String fontName;
  bool isSelectedFont;

  FontFamily(this.id, this.fontName, this.isSelectedFont);
}

class ListIcon{
  final int id;
  final Icon iconName;
  bool isSelectedIcon;

  ListIcon(this.id, this.iconName, this.isSelectedIcon);
}

class ReadBookView extends StatefulWidget {
  const ReadBookView({super.key});


  @override
  State<ReadBookView> createState() => _ReadBookViewState();


}

class _ReadBookViewState extends State<ReadBookView> {
  String bookcontent = 'Mùa thu năm ngoái, tôi đến thăm Sherlock Holmes thì bắt gặp anh đang say sưa trò chuyện với một người đàn ông đứng tuổi có vóc người to béo, sắc mặt hồng hào, tóc màu hung đỏ rực như lửa.'
      'Tôi xin lỗi vì sự đường đột và đang định quay ra thì Holmes vội kéo tôi vào phòng.- Watson thân mến, anh đến thật đúng lúc.';


  bool toggle = false;

  bool _isAppBarVisible = true;
  bool _isNavigationBarVisible = true;
  int _selectedIndex = 0;



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<
      ScaffoldState>(); //tao 1 key

  void _toggleVisibility() {
    setState(() {
      _isAppBarVisible = !_isAppBarVisible;
      _isNavigationBarVisible = !_isNavigationBarVisible;
    });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        //gan key
        appBar: _isAppBarVisible ? AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
          title: Text('The Dark Lord,,,,,,,,,,,,,,,,',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                  Icons.search
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(
                  Icons.mic_none_rounded
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.pending_outlined,
              ),
            ),
          ],
        ) : null,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.1,
                child: DrawerHeader(

                  decoration: BoxDecoration(

                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Chapters',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) =>
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text('Chapter 1',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey
                                ),
                              )
                          ),
                          subtitle: Text('The sea',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                ),
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            _toggleVisibility();
          },
          child: Container(
            width: size.width * 1,
            height: size.height * 1,
            padding: EdgeInsets.all(15),
            child: Text(bookcontent,
              textAlign: TextAlign.justify,
              style: GoogleFonts.getFont('Urbanist', fontSize: 15),
            ),
          ),
        ),
        bottomNavigationBar: _isNavigationBarVisible ? BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onIndexTapped,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(

                icon: Icon(
                    Icons.menu_book
                ),
                label: 'Chapters'
            ),

            BottomNavigationBarItem(
                icon: Icon(
                    Icons.comment_outlined
                ),
                label: 'Comments'
            ),

            BottomNavigationBarItem(
                icon: Icon(
                    Icons.settings
                ),
                label: 'Settings'
            ),

          ],
        ) : null,

      ),
    );
  }



  void _onIndexTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0 && _scaffoldKey.currentState != null) {
        _scaffoldKey.currentState!
            .openDrawer(); // mở drawer khi item đầu tiên được ấn
      } else if (_selectedIndex == 2 && _scaffoldKey.currentState != null) {
        _showBottomSheet(context);
      }
    });
  }





  void _showBottomSheet(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomSheetWidget();
        });
  }
}

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final double _brightnessValue = 0.1;
  double _fontSize = 15;
  bool selectedAlign = false;

  List<FontFamily> fontFamily = <FontFamily>[];
  List<ListIcon> icons = <ListIcon>[];
  @override
  void initState(){
    super.initState();
    // _setBrightness();
    fontFamily.add(FontFamily(1, 'Urbanist', false));
    fontFamily.add(FontFamily(2, 'Roboto', false));

    fontFamily.add(FontFamily(3, 'Georgia', false));
    fontFamily.add(FontFamily(4, 'Poppins', false));
    // fontFamily.add(FontFamily(6, 'Sans Serif', false));
    fontFamily.add(FontFamily(5, 'Goudy', false));


    icons.add(ListIcon(1, Icon(Icons.format_align_left), true));
    icons.add(ListIcon(2, Icon(Icons.format_align_center), false));
    icons.add(ListIcon(3, Icon(Icons.format_align_right), false));
    icons.add(ListIcon(4, Icon(Icons.format_align_justify), false));
  }

  Future<void> _setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      debugPrint(e.toString());
      throw 'Failed to set brightness';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return SingleChildScrollView(
      child: SizedBox(
        height: size.height*0.7,
        child: Padding(
          padding:  EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Brightness'
                ,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 18,
                  thumbColor: Colors.transparent,
                  trackShape: CustomTrackShape(),
                ),
                child: Slider(
                  activeColor: Colors.orange,
                  value: _brightnessValue,
                  onChanged: (value) {
                    setState(() {
                      _setBrightness(value);
                    });
                  },
                ),
              ),
              //Xử lý background color
              Text('BackGround Color'
                ,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              Text('Font'
                ,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),

              Wrap(
                spacing: 5,
                children: fontFamily.map((item) => Padding(
                  padding:  EdgeInsets.only(bottom: 5),
                  child: ChoiceChip(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text(item.fontName,
                      style: TextStyle(color: item.isSelectedFont?Colors.white :Colors.orange),
                    ),
                    selected: item.isSelectedFont,
                    onSelected: (isSelected){
                      setState(() {
                        fontFamily.forEach((element) =>element.isSelectedFont = false);
                        item.isSelectedFont = true;
                      });
                    },
                    selectedColor: Colors.orange,
                  ),
                ),
                ).toList(),
              ),

              SizedBox(height: 20,),
              Text('Font Size'
                ,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 18,
                  thumbColor: Colors.transparent,
                  trackShape: CustomTrackShape(),
                ),
                child: Slider(
                  activeColor: Colors.orange,
                  value: _fontSize,
                  onChanged: (value) {
                    setState(() {
                      _fontSize = value;
                    });
                  },
                  min: 10,
                  max: 30,
                ),
              ),
              Text('Align Text'
                ,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: size.width*0.9,
                height: size.height*0.05,

                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2,

                  ),
                  physics: NeverScrollableScrollPhysics(),
                  children: icons.map((item) =>  InkWell(
                    onTap: (){
                      setState(() {
                        icons.forEach((element) =>element.isSelectedIcon = false );
                        item.isSelectedIcon = true;
                      });
                    },
                    child: Container(

                      child: item.iconName,
                      decoration: BoxDecoration(
                        color: item.isSelectedIcon? Colors.orange: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  ).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

