import 'package:flutter/material.dart';

showErrorDialog(
  BuildContext context, {
  String title = 'Something went wrong..',
  String message = 'Please, try again later',
}) {
  showDialog(
    context: context,
    builder: (ctx) => CustomDialog(
      title: title,
      description: message,
      positiveButtonText: null,
      negativeButtonText: 'Okay',
    ),
  );
}

// returns 'Positive' if confirmed,
// else 'Negative' is returned.
Future<String> showConfirmationDialog(
  BuildContext context, {
  String title = 'Are you sure?',
  String message = 'If not, click "No"',
}) async {
  return await showDialog(
    context: context,
    builder: (ctx) => CustomDialog(
      title: title,
      description: message,
      positiveButtonText: 'Yes',
      negativeButtonText: 'No',
    ),
  );
}

class CustomDialog extends StatelessWidget {
  final String title, description, negativeButtonText;
  final String? positiveButtonText;
  final Image? image;

  CustomDialog({
    required this.title,
    required this.description,
    this.positiveButtonText,
    required this.negativeButtonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    double padding = 0.06 * MediaQuery.of(context).size.width;
    double avatarRadius = 0.15 * MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: padding,
              bottom: padding,
              left: padding,
              right: padding,
            ),
            margin: EdgeInsets.symmetric(vertical: avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(9.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (negativeButtonText != null)
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 35.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop("negative"); // To close the dialog
                          },
                          child: Text(
                            negativeButtonText,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                    if (positiveButtonText != null)
                      Container(
                        height: 35.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop("positive"); // To close the dialog
                          },
                          child: Text(
                            positiveButtonText!,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
