


import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewControllerX extends GetxController {
  final RxString selectedUrl = 'https://www.crazygames.com/game/smash-karts'.obs;
  late final WebViewController webViewController;

  final List<String> gameUrls = [
    'https://www.crazygames.com/game/smash-karts',
    'https://www.crazygames.com/game/bloxdhop-io',
    'https://www.crazygames.com/game/deadshot-io',
  ];

  final List<String> gameNames = [
    'Game smash-karts',
    'Game bloxdhop-io',
    'Game deadshot-io',
  ];

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(selectedUrl.value));
  }

  void loadSelectedUrl(String url) {
    selectedUrl.value = url;
    webViewController.loadRequest(Uri.parse(url));
  }

  String getNameFromUrl(String url) {
    int index = gameUrls.indexOf(url);
    return index != -1 ? gameNames[index] : '';
  }

  String getUrlFromName(String name) {
    int index = gameNames.indexOf(name);
    return index != -1 ? gameUrls[index] : '';
  }
}