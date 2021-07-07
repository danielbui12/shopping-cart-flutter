import 'package:flutter/material.dart';

class Alert {
  Future<void> alert(
      String title, String subtile, fnc, BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Image.network(
                        "https://image.flaticon.com/icons/png/512/564/564619.png",
                        width: 20,
                        height: 20)),
                Padding(padding: const EdgeInsets.all(8.0), child: Text(title))
              ],
            ),
            content: Text(subtile),
            actions: [
              TextButton(
                  onPressed: () {
                    fnc();
                    Navigator.of(context).pop();
                  },
                  child: Text("OK")),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel")),
            ],
          );
        });
  }
}
