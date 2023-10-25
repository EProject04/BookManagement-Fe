import 'package:flutter/material.dart';
import 'package:frame/app/data/utils/get_extension.dart';
import 'package:frame/app/data/utils/over_scoll_behavior.dart';
import 'package:frame/app/data/utils/style.dart';
import 'package:get/get.dart';

class CommonDialog extends StatelessWidget {

  String title = '';

  String content = '';

  String backText = '';

  String nextText = '';

  VoidCallback? backTap;

  VoidCallback? nextTap;

  bool backVisible = true;

  bool nextVisible = true;

  CommonDialog({
    Key? key,
    this.title = '',
    this.content = '',
    this.backText = '',
    this.nextText = '',
    this.backVisible = true,
    this.nextVisible = true,
    this.backTap,
    this.nextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
            child: ScrollConfiguration(
                behavior: OverScrollBehavior(),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            Box.vBox15,
                            Text(
                              title,
                              style: Styles.style_black_18_bold500,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Text(
                                content,
                                style: Styles.style_6A6969_16,
                              ),
                            ),
                            DividerStyle.divider1Half,

                            Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              direction: Axis.horizontal,
                              children: [
                                _buildTextButton(backTap, backText , backVisible),
                                _buildTextButton(nextTap, nextText , nextVisible)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  _buildTextButton(VoidCallback? tap, String text , bool show) {
    return Visibility(
        visible: show,
        child: Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Get.dismiss();
                if(tap != null){
                  tap();
                }
              },
              style: ButtonStyles.getNoShapeStyle(),
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  text,
                  style: Styles.style_black_16,
                ),
              ),
            )));
  }
}
class ButtonStyles{

  static ButtonStyle getButtonStyle(){
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(ColorStyle.color_E2E3E8_33),
      animationDuration:const Duration(milliseconds: 200),
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
      shape: MaterialStateProperty.all(const StadiumBorder()),
    );
  }

  static ButtonStyle getTransparentStyle(){
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  static ButtonStyle getNoShapeStyle(){
    return ButtonStyle(
      shadowColor: MaterialStateProperty.all( ColorStyle.colorShadow),
      animationDuration:const Duration(milliseconds: 200),
      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
    );
  }
}