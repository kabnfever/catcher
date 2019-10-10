import 'package:flutter/material.dart';

class CatcherErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;
  final bool showStacktrace;
  final String customTitle;
  final String customDescription;

  const CatcherErrorWidget(
      {Key key,
      this.details,
      this.showStacktrace,
      this.customTitle,
      this.customDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = "An application error has occurred";
    if (customTitle != null) {
      title = customTitle;
    }

    var description =
        "There was unexepcted situation in application. Application has been able to recover from error state.";
    if (showStacktrace) {
      description += " See details below.";
    }

    if (customDescription != null) {
      description = customDescription;
    }

    return Scrollbar(
        child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Icon(
                    Icons.announcement,
                    color: Colors.red,
                    size: 40,
                  ),
                  Text(title,
                      textScaleFactor: 2.0,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(description, textAlign: TextAlign.center),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Text('Error: ${details.exceptionAsString()}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  _getStackTraceWidget()
                ]))));
  }

  Widget _getStackTraceWidget() {
    if (showStacktrace) {
      return SizedBox(
        height: 250.0,
        child: ListView(
          children: [
            Text('Stack:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(details.stack.toString()),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
