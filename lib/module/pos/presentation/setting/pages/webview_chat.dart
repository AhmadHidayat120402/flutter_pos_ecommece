// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';



// class WebviewChat extends StatefulWidget {
//   const WebviewChat({super.key});

//   @override
//   State<WebviewChat> createState() => _WebviewChatState();
// }

// class _WebviewChatState extends State<WebviewChat> {
//   WebViewController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse('https://flutter.dev'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: const Column(
//             children: [],
//           ),
//         ),
//       ),
//     );
//   }
// }
