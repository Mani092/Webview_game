import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controller/webcontoller.dart';

class WebViewPage extends StatelessWidget {
   WebViewPage({super.key});


  final WebViewControllerX controller = Get.put(WebViewControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaming WebView'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => controller.webViewController.goBack(),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => controller.webViewController.goForward(),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => controller.webViewController.reload(),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8,),
            width: MediaQuery.of(context).size.width*0.75,
            height: MediaQuery.of(context).size.height*0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),

            child: Center(
              child: DropdownButtonHideUnderline(
                child: Obx(
                      () => DropdownButton2<String>(
                    value: controller.getNameFromUrl(controller.selectedUrl.value),
                    items: controller.gameNames
                        .map((name) => DropdownMenuItem<String>(
                      value: name,
                      child: Text(name),
                    ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        controller.loadSelectedUrl(controller.getUrlFromName(value));
                      }
                    },
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                    buttonStyleData: ButtonStyleData(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // Reload the WebView content
                await controller.webViewController.reload();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(), // Ensure the scroll physics are always active
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: WebViewWidget(
                    controller: controller.webViewController,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
