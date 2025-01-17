import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatelessWidget {
  const PolicyDialog({
    this.radius = 8,
    required this.mdFileName,
  });

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 150))
                  .then((value) {
                return rootBundle.loadString('assets/$mdFileName');
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data as String,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          // FlatButton(
          //   padding: const EdgeInsets.all(0),
          //   color: Theme.of(context).buttonColor,
          //   onPressed: () => Navigator.of(context).pop(),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(radius),
          //       bottomRight: Radius.circular(radius),
          //     ),
          //   ),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(radius),
          //         bottomRight: Radius.circular(radius),
          //       ),
          //     ),
          //     alignment: Alignment.center,
          //     height: 50,
          //     width: double.infinity,
          //     child: Text(
          //       "CLOSE",
          //       style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //         color: Theme.of(context).textTheme.button?.color,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
