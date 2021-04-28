import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';

showCustomDialog(
  BuildContext context,
  String title,
  String firstItemTitle,
  String firstIcon,
  String secItemTitle,
  String secIcon,
  VoidCallback firstTapAction,
  VoidCallback secTapAction,
) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 220,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 220,
                      height: 110,
                      child: Center(
                        child: Text(
                          CIUtility().getLocalizedString(title),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //'lib/images/com_arrow_rleft_ora.png'
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  ).then((value) {
    dPrint('dialog dismiss', StackTrace.current);
  });
}

Widget customDialog(BuildContext context, String title, {String? firstItemTitle, VoidCallback? firstTapAction}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
    child: Container(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              width: 220,
              height: 110,
              child: Center(
                child: Text(
                  CIUtility().getLocalizedString(title),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            customTapableWidgetCenterTitle(50, 200, firstItemTitle ?? "", () {
              // Navigator.of(context, rootNavigator: true).pop("Discard");
              firstTapAction?.call();
            }),
            //'lib/images/com_arrow_rleft_ora.png'
          ],
        ),
      ),
    ),
  );
}

customTapableWidgetCenterTitle(double height, double width, String title, VoidCallback tapAction) {
  return GestureDetector(
      onTap: tapAction,
      child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: height,
          width: width,
          child: Center(
            child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black54.withOpacity(0.3), offset: Offset(0, 5), blurRadius: 15, spreadRadius: 2),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(height / 2) //                 <--- border radius here
                      ),
                  color: Colors.deepOrangeAccent,
                ),
                child: Center(
                  child: Text(
                    CIUtility().getLocalizedString(title),
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                )),
          )));
}
