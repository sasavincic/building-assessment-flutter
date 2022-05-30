import 'package:flutter/material.dart';
import 'package:msg/screens/history.dart';

class CustomDialog extends StatelessWidget {
  final String text;
  const CustomDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.onSecondary.withOpacity(0.80),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                child: Text(text, style: Theme.of(context).textTheme.caption),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const HistoryPage()));
                    },
                    elevation: 2.0,
                    fillColor: const Color.fromARGB(148, 112, 14, 46),
                    child: const Icon(
                      Icons.clear_rounded,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(12.5),
                    shape: const CircleBorder(),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
