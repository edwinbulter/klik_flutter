import 'package:flutter/material.dart';

class DesignDocument extends StatefulWidget {
  const DesignDocument({super.key});

  State<DesignDocument> createState() => _DesignDocumentState();
}

class _DesignDocumentState extends State<DesignDocument> {
  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      scrollbarOrientation: ScrollbarOrientation.bottom,
      thickness: 20,
      controller: controller2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        controller: controller2,
        children: <Widget>[
          Container(
              height: 1200,
              width: 1000,
              alignment: Alignment.topLeft,
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                scrollbarOrientation: ScrollbarOrientation.left,
                thickness: 20,
                controller: controller,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  children: [
                    Padding (
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 400,
                        width: 400,
                        alignment: Alignment.topLeft,
                        child: Image.asset('assets/images/aws-components.png',
                            fit: BoxFit.contain),
                      ),
                    ),

                    Container(
                      //height: 800,
                      width: 1000,
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        'assets/images/sequence-diagram.png',
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}