import 'package:flutter/material.dart';

class FormViewAppBar {
  static appBar(
          {@required String title,
          @required BuildContext context,
          bool withoutBackButton = true,
          String infoText}) =>
      AppBar(
          title: Text(title ?? "", style: TextStyle(color: Colors.white)),
          elevation: 0.5,
          // backgroundColor: Colors.white,
          actions: [
            infoText == null
                ? Container()
                : IconButton(
                    icon: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Info Text"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Information für den Nutzer"),
                                    Text(infoText)
                                  ],
                                ),
                              ));
                    })
          ],
          leading: withoutBackButton
              ? IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })
              : Container());
}
