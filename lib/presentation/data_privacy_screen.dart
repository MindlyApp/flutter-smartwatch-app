import 'package:flutter/material.dart';
import 'package:mind_pro/presentation/background/background_builder.dart';
import 'package:wear/wear.dart';

class DataPrivacyScreen extends StatefulWidget {
  const DataPrivacyScreen({Key? key}) : super(key: key);

  @override
  State<DataPrivacyScreen> createState() => _DataPrivacyScreenState();
}

class _DataPrivacyScreenState extends State<DataPrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: WatchShape(
            builder: (BuildContext context, WearShape shape, Widget? child) {
              double screenWidth = MediaQuery.of(context).size.width;
              double screenHeight = MediaQuery.of(context).size.height;

              return Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: MSBackgrounds.createBoxDecoration(),
                  child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Data Privacy',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: screenWidth - 60,
                            child: const Text('Please open https://emotivate.app/app-data-privacy/ in your browser.',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                  ));
            },
            child: AmbientMode(
              builder: (BuildContext context, WearMode mode, Widget? child) {
                return const Placeholder();
              },
            ),
          )),
    );
  }
}
