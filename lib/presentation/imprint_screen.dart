import 'package:flutter/material.dart';
import 'package:mind_pro/presentation/background/background_builder.dart';
import 'package:wear/wear.dart';
/// import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// Import for Android features.
/// import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
/// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class ImprintScreen extends StatefulWidget {
  const ImprintScreen({Key? key}) : super(key: key);

  @override
  State<ImprintScreen> createState() => _ImprintScreenState();
}

class _ImprintScreenState extends State<ImprintScreen> {
  /// late final WebViewController controller;

  final String imprintText = '''
Information pursuant to § 5 TMG

Meta Game Solutions UG (haftungsbeschränkt)
Liegnitzer Straße 31
91058 Erlangen

Contact

Telephone: +49 1734602169
E-Mail: hello@emotivate.app

Geschäftsführung: Matthias Rüdiger Gosdin

Registergericht: Amtsgericht Fürth HRB 19906

Umsatzsteuer-ID

Umsatzsteuer-Identifikationsnummer gem. § 27 a Umsatzsteuergesetz:

DE356134452

EU dispute resolution

The European Commission provides a platform for online dispute resolution (ODR): https://ec.europa.eu/consumers/odr.

https://www.ec.europa.eu/consumers/odr
Our e-mail address can be found above in the site notice.

We are not willing or obliged to participate in dispute resolution proceedings before a consumer arbitration board.
Liability for Contents

As service providers, we are liable for own contents of these websites according to Paragraph 7, Sect. 1 German Telemedia Act (TMG). However, according to Paragraphs 8 to 10 German Telemedia Act (TMG), service providers are not obligated to permanently monitor submitted or stored information or to search for evidences that indicate illegal activities.

Legal obligations to removing information or to blocking the use of information remain unchallenged. In this case, liability is only possible at the time of knowledge about a specific violation of law. Illegal contents will be removed immediately at the time we get knowledge of them.
Liability for Links

Our offer includes links to external third party websites. We have no influence on the contents of those websites, therefore we cannot guarantee for those contents. Providers or administrators of linked websites are always responsible for their own contents.

The linked websites had been checked for possible violations of law at the time of the establishment of the link. Illegal contents were not detected at the time of the linking. A permanent monitoring of the contents of linked websites cannot be imposed without reasonable indications that there has been a violation of law. Illegal links will be removed immediately at the time we get knowledge of them.
Copyright

Contents and compilations published on these websites by the providers are subject to German copyright laws. Reproduction, editing, distribution as well as the use of any kind outside the scope of the copyright law require a written permission of the author or originator. Downloads and copies of these websites are permitted for private use only.
The commercial use of our contents without permission of the originator is prohibited.

Copyright laws of third parties are respected as long as the contents on these websites do not originate from the provider. Contributions of third parties on this site are indicated as such. However, if you notice any violations of copyright law, please inform us. Such contents will be removed immediately.
  ''';

  final Uri _url = Uri.parse('https://emotivate.app/imprint/');

  @override
  void initState() {
    super.initState();
    /*controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://emotivate.app/imprint/'),
      );*/
  }


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
                          const Text('Imprint',
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
                            child: Text(imprintText,
                              style: const TextStyle(
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

  @deprecated
  /// @deprecated
  void openBrowser() async {
    if (await canLaunchUrl(_url)){
      await launchUrl(_url);
    } else {
      // can't launch url
    }
  }
}
