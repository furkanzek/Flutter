import 'package:flutter/material.dart';
import 'package:psikozmos/connectivity_provider.dart';
import 'package:psikozmos/no_int.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

class Main extends StatefulWidget {
  const Main({Key? key, required String title}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return pageUi();
  }

  Widget pageUi() {
    return Consumer<ConnectivityProvider>(
      builder: ((context, model, child) {
        if (model.isOnline != null) {
          return model.isOnline!
              ? SafeArea(
                  child: WebView(
                    initialUrl: 'https://www.bsghaber.com',
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                )
              : NoInternet();
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}
