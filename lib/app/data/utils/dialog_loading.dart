


import 'package:flutter/material.dart';
import 'package:frame/app/data/utils/style.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  String text = "";
   LoadingDialog({Key? key,
     this.text = "Loading..."
     ,}) : super(key: key);

  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Center(
                  //   child: Lottie.network('https://lottie.host/?file=eb60c83a-e3d7-4b2d-8d6f-fca9cdf6d7fd/ntXek7wLIy.json',
                  //       width: 60, animate: true)
                  // ),
                  Text(text, style: Styles.style_1A2F51_18)
                ],
              ),
            ),
          ),
        )
    );
  }
}
