import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'managers/data_manager/data_manager.dart';


class CIUtility {
  static final CIUtility _sAUtility = CIUtility._internal();

  factory CIUtility() {
    return _sAUtility;
  }

  CIUtility._internal();

  bool isIOS(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS;
  }

  bool isAndroid(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.android;
  }

  isPhoneX(BuildContext parrentContext) {
    bool isIOS = Theme.of(parrentContext).platform == TargetPlatform.iOS;
    if (isIOS) {
      final bool iphonex = MediaQuery.of(parrentContext).size.height >= 812.0;
      if (iphonex) {
        return true;
      }
    }
    return false;
  }

  safeAreaPaddingForHomeIndicator(BuildContext parrentContext) {
    if (isPhoneX(parrentContext)) {
      return 34.0;
    }
    return 0.0;
  }

  safeAreaPaddingForStatusBar(BuildContext parrentContext) {
    if (isPhoneX(parrentContext)) {
      return 24.0;
    }
    return 0.0;
  }

  lovelySpaceToButtom(BuildContext parrentContext) {
    if (isPhoneX(parrentContext)) {
      return 32.0;
    }
    return 12.0;
  }

  spaceToSafeBottom(BuildContext parrentContext) {
    if (isPhoneX(parrentContext)) {
      return 32.0 - 8;
    }
    return 6.0;
  }

  lovelyTabbarHeight(BuildContext parrentContext) {
    if (isPhoneX(parrentContext)) {
      return 64;
    }
    return 94;
  }

  convertDataToYMD(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy/MM/dd");
    return dateFormatYMD.format(dataTime);
  }

  convertDataToYMDH(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy/MM/dd HH");
    return dateFormatYMD.format(dataTime);
  }

  convertDataToYMDHWithMinus(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy-MM-dd HH:00");
    return dateFormatYMD.format(dataTime);
  }

  convertDataToYMDWithMinus(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy-MM-dd (E)");
    return dateFormatYMD.format(dataTime).replaceAll('Mon', CIUtility().getLocalizedString('週一')).replaceAll('Tue', CIUtility().getLocalizedString('週二')).replaceAll('Wed', CIUtility().getLocalizedString('週三')).replaceAll('Thu', CIUtility().getLocalizedString('週四')).replaceAll('Fri', CIUtility().getLocalizedString('週五')).replaceAll('Sat', CIUtility().getLocalizedString('週六')).replaceAll('Sun', CIUtility().getLocalizedString('週日'));
  }

  convertDataToYMDE(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy/MM/dd (E)");
    return dateFormatYMD.format(dataTime);
  }

  convertDataToYMDEWithDot(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy.MM.dd (EEE)");
    return dateFormatYMD.format(dataTime).replaceAll('Mon', CIUtility().getLocalizedString('週一')).replaceAll('Tue', CIUtility().getLocalizedString('週二')).replaceAll('Wed', CIUtility().getLocalizedString('週三')).replaceAll('Thu', CIUtility().getLocalizedString('週四')).replaceAll('Fri', CIUtility().getLocalizedString('週五')).replaceAll('Sat', CIUtility().getLocalizedString('週六')).replaceAll('Sun', CIUtility().getLocalizedString('週日'));
  }

  convertDataToYMDEHHmmWithDot(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy.MM.dd HH:mm");
    return dateFormatYMD.format(dataTime).replaceAll('Mon', CIUtility().getLocalizedString('週一')).replaceAll('Tue', CIUtility().getLocalizedString('週二')).replaceAll('Wed', CIUtility().getLocalizedString('週三')).replaceAll('Thu', CIUtility().getLocalizedString('週四')).replaceAll('Fri', CIUtility().getLocalizedString('週五')).replaceAll('Sat', CIUtility().getLocalizedString('週六')).replaceAll('Sun', CIUtility().getLocalizedString('週日'));
  }

  convertDataToYMDWithDot(DateTime dataTime) {
    print(dataTime);
    DateFormat dateFormatYMD = DateFormat("yyyy.MM.dd");
    return dateFormatYMD.format(dataTime);
  }

  convertDataToMDWithDot(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("MM.dd");
    return dateFormatYMD.format(dataTime);
  }

  convertDataToYMDEhhrr(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy/MM/dd (E) HH:mm");
    return dateFormatYMD.format(dataTime);
  }

  convertDataToYMDhhrrss(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyy/MM/dd HH:mm:ss");
    return dateFormatYMD.format(dataTime);
  }

  convertDataToYMDhhrrssWithUnderline(DateTime dataTime) {
    DateFormat dateFormatYMD = DateFormat("yyyyMMdd_HH_mm_ss");
    return dateFormatYMD.format(dataTime);
  }

  convertToTimeStamp(DateTime dataTime){
    return dataTime.millisecondsSinceEpoch.toString();
  }

  convertDataTohhrr(DateTime dataTime) {
    DateFormat dateFormathhrr = DateFormat("HH:mm");
    return dateFormathhrr.format(dataTime);
  }

  convertDataTohhrrWithoutColumn(DateTime dataTime) {
    DateFormat dateFormathhrr = DateFormat("HHmm");
    return dateFormathhrr.format(dataTime);
  }

  convertDataTohhrrss(DateTime dataTime) {
    DateFormat dateFormathhrr = DateFormat("HH:mm:ss");
    return dateFormathhrr.format(dataTime);
  }

  DateTime convertDateStringYMDhhrrssToDate(String dataString) {

    DateTime dateTime = DateFormat("yyyy/MM/dd").parse(dataString);

    return dateTime;
  }
  getLocalizedString(String content) {
    String convertString = content;
    switch (DataManager().selectedLanguage) {
      case 0:
      //中文
        convertString = DataManager().twLanMap[content] ?? content;
        break;
      case 1:
      //英文
        convertString = DataManager().enLanMap[content] ?? content;
        break;
    }
    return convertString;
  }

}

dPrint(Object object, StackTrace stackTrace) {
  String line = "$object";
  if(!kReleaseMode) {
    print('${CustomTrace(stackTrace).fileName}(line: ${CustomTrace(stackTrace).lineNumber}) ' + line );
  }  else {
  }
}

class CustomTrace {
  StackTrace _trace;

  late String fileName;
  late int lineNumber;
  late int columnNumber;

  CustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    /* The trace comes with multiple lines of strings, we just want the first line, which has the information we need */
    var traceString = this._trace.toString().split("\n")[0];
    /* Search through the string and find the index of the file name by looking for the '.dart' regex */
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));

    var fileInfo = traceString.substring(indexOfFileName);

    var listOfInfos = fileInfo.split(":");

    /* Splitting fileInfo by the character ":" separates the file name, the line number and the column counter nicely.
      Example: main.dart:5:12
      To get the file name, we split with ":" and get the first index
      To get the line number, we would have to get the second index
      To get the column number, we would have to get the third index
    */

    this.fileName = listOfInfos[0].replaceAll(".dart", "");
    this.lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    this.columnNumber = int.parse(columnStr);
  }
}