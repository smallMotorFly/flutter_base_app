
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatelessWidget {
  const AppWebView({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;
  final String appUserAgent = 'appUserAgent';

  void webViewCreated(WebViewController controller) {
    print('webViewCreated + $controller');

  }

  //url开始加载
  void onPageStarted(String url) {
    print('onPageStarted + $url');
  }

  //url加载结束
  void onPageFinished(String url) {
    print('onPageFinished + $url');
  }

  // url拦截
  NavigationDecision webViewNavigationDelegate(NavigationRequest request) {
    if (request.url.startsWith('http://www.baidu.com')) {
      return NavigationDecision.navigate;
    } else {
      return NavigationDecision.prevent;
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: onPageStarted,
        onPageFinished: onPageFinished,
//        navigationDelegate: webViewNavigationDelegate,
      ),
    );
  }
}