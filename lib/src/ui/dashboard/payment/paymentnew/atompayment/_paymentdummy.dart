// // // ignore_for_file: constant_identifier_names
// // import 'dart:convert';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cryptography/cryptography.dart';
// // import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:url_launcher/url_launcher.dart';

// // const req_EncKey = 'A4476C2062FFA58980DC8F79EB6A799E';
// // const req_Salt = 'A4476C2062FFA58980DC8F79EB6A799E';
// // const res_DecKey = '75AEF0FA1B94B3C10D4F5B268F757F11';
// // const res_Salt = '75AEF0FA1B94B3C10D4F5B268F757F11';
// // const resHashKey = "KEYRESP123657234";
// // const merchId = "317157";
// // const merchPass = "Test@123";
// // const prodId = "NSE";
// // final authUrl = "https://paynetzuat.atomtech.in/ots/aipay/auth";

// // String? atomTokenId;
// // String currentTxnId = '';

// // bool isLoading = false;

// // final password = Uint8List.fromList(utf8.encode(req_EncKey));
// // final salt = Uint8List.fromList(utf8.encode(req_Salt));
// // final resPassword = Uint8List.fromList(utf8.encode(res_DecKey));
// // final resSalt = Uint8List.fromList(utf8.encode(res_Salt));
// // final iv =
// //     Uint8List.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);

// // //Encrypt Function
// // Future<String> encrypt(String text) async {
// //   debugPrint('Input text for encryption: $text');
// //   try {
// //     final pbkdf2 = Pbkdf2(
// //       macAlgorithm: Hmac.sha512(),
// //       iterations: 65536,
// //       bits: 256,
// //     );

// //     final derivedKey = await pbkdf2.deriveKey(
// //       secretKey: SecretKey(password),
// //       nonce: salt,
// //     );

// //     final keyBytes = await derivedKey.extractBytes();
// //     debugPrint('Derived key bytes: $keyBytes');

// //     final aesCbc = AesCbc.with256bits(
// //       macAlgorithm: MacAlgorithm.empty,
// //       paddingAlgorithm: PaddingAlgorithm.pkcs7,
// //     );

// //     final secretBox = await aesCbc.encrypt(
// //       utf8.encode(text),
// //       secretKey: SecretKey(keyBytes),
// //       nonce: iv,
// //     );

// //     final hexOutput = secretBox.cipherText
// //         .map((b) => b.toRadixString(16).padLeft(2, '0'))
// //         .join();
// //     debugPrint('Encrypted hex output: $hexOutput');
// //     return hexOutput;
// //   } catch (e, stackTrace) {
// //     debugPrint('Encryption error: $e');
// //     debugPrint('Stack trace: $stackTrace');
// //     rethrow;
// //   }
// // }

// // // Decrypt Function
// // Future<String> decrypt(String hexCipherText) async {
// //   try {
// //     debugPrint('Input hex for decryption: $hexCipherText');

// //     // Convert hex string to bytes
// //     List<int> cipherText = [];
// //     for (int i = 0; i < hexCipherText.length; i += 2) {
// //       String hex = hexCipherText.substring(i, i + 2);
// //       cipherText.add(int.parse(hex, radix: 16));
// //     }
// //     debugPrint('Cipher text bytes: $cipherText');

// //     final pbkdf2 = Pbkdf2(
// //       macAlgorithm: Hmac.sha512(),
// //       iterations: 65536,
// //       bits: 256,
// //     );

// //     final derivedKey = await pbkdf2.deriveKey(
// //       secretKey: SecretKey(resPassword),
// //       nonce: resSalt, // Use the same salt as in encryption
// //     );

// //     final keyBytes = await derivedKey.extractBytes();

// //     final aesCbc = AesCbc.with256bits(
// //       macAlgorithm: MacAlgorithm.empty,
// //       paddingAlgorithm: PaddingAlgorithm.pkcs7,
// //     );

// //     final secretBox = SecretBox(
// //       cipherText,
// //       nonce: iv, // Use the same IV as in encryption
// //       mac: Mac.empty,
// //     );
// //     debugPrint('SecretBox: $secretBox');

// //     final decryptedBytes = await aesCbc.decrypt(
// //       secretBox,
// //       secretKey: SecretKey(keyBytes),
// //     );

// //     final decryptedText = utf8.decode(decryptedBytes);
// //     debugPrint('Decrypted text: $decryptedText');
// //     return decryptedText;
// //   } catch (e, stackTrace) {
// //     debugPrint('Decryption error: $e');
// //     debugPrint('Stack trace: $stackTrace');
// //     rethrow;
// //   }
// // }

// // Future<bool> validateSignature(
// //     Map<String, dynamic> data, String resHashKey) async {
// //   debugPrint("validateSignature called");

// //   String signatureString = data["payInstrument"]["merchDetails"]["merchId"]
// //           .toString() +
// //       data["payInstrument"]["payDetails"]["atomTxnId"].toString() +
// //       data['payInstrument']['merchDetails']['merchTxnId'].toString() +
// //       data['payInstrument']['payDetails']['totalAmount'].toStringAsFixed(2) +
// //       data['payInstrument']['responseDetails']['statusCode'].toString() +
// //       data['payInstrument']['payModeSpecificData']['subChannel'][0].toString() +
// //       data['payInstrument']['payModeSpecificData']['bankDetails']['bankTxnId']
// //           .toString();

// //   var bytes = utf8.encode(signatureString);
// //   var key = utf8.encode(resHashKey);

// //   final hmac = Hmac.sha512();
// //   final secretKey = SecretKey(key);
// //   final mac = await hmac.calculateMac(bytes, secretKey: secretKey);

// //   var genSig =
// //       mac.bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();

// //   if (data['payInstrument']['payDetails']['signature'] == genSig) {
// //     print("ignaure matched");
// //     return true;
// //   } else {
// //     print("signaure does not matched");
// //     return false;
// //   }
// // }

// // class PayPage extends StatefulWidget {
// //   const PayPage({super.key});

// //   @override
// //   State<PayPage> createState() => _PayPageState();
// // }

// // class _PayPageState extends State<PayPage> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Generate atom token when page loads
// //     initiatePayment();
// //   }

// //   // //Generate Signature
// //   // Future<String> generateSignature(Map<String, dynamic> respArray) async {
// //   //   print("Generating signature using response array.");

// //   //   final payDetails = respArray['payDetails'];
// //   //   final merchDetails = respArray['merchDetails'];
// //   //   final responseDetails = respArray['responseDetails'];
// //   //   final payModeSpecificData = respArray['payModeSpecificData'];

// //   //   // Construct the signature string
// //   //   final signatureString =
// //   //       '${merchDetails['merchId']}${payDetails['atomTxnId']}${merchDetails['merchTxnId']}${payDetails['totalAmount'].toStringAsFixed(2)}${responseDetails['statusCode']}${payModeSpecificData['subChannel'][0]}${payModeSpecificData['bankDetails']['bankTxnId']}';

// //   //   print("Constructed signature string: $signatureString");

// //   //   // Initialize HMAC with the key
// //   //   final hmac = Hmac.sha512();
// //   //   final secretKey = SecretKey(utf8.encode(resHashKey));
// //   //   final signatureBytes = await hmac.calculateMac(
// //   //     utf8.encode(signatureString),
// //   //     secretKey: secretKey,
// //   //   );

// //   //   print("HMAC updated with signature string.");

// //   //   // Generate the HMAC (signature)
// //   //   final genHmac = signatureBytes.bytes
// //   //       .map((b) => b.toRadixString(16).padLeft(2, '0'))
// //   //       .join();

// //   //   print("Generated HMAC (signature): $genHmac");

// //   //   return genHmac;
// //   // }

// //   //Initiate the payment (Send request to atom server)
// //   Future<void> initiatePayment() async {
// //     setState(() {
// //       isLoading = true;
// //       currentTxnId =
// //           'Invoice${DateTime.now().millisecondsSinceEpoch.toRadixString(36)}';
// //     });

// //     try {
// //       final String txnDate = DateTime.now().toString().split('.')[0];
// //       const String amount = "1";
// //       const String userEmailId = "test.user@atomtech.in";
// //       const String userContactNo = "8888888888";

// //       //Json data for sending to atom server
// //       String jsonData =
// //           '{"payInstrument":{"headDetails":{"version":"OTSv1.1","api":"AUTH","platform":"FLASH"},"merchDetails":{"merchId":"$merchId","userId":"","password":"$merchPass","merchTxnId":"$currentTxnId","merchTxnDate":"$txnDate"},"payDetails":{"amount":"$amount","product":"$prodId","custAccNo":"213232323","txnCurrency":"INR"},"custDetails":{"custEmail":"$userEmailId","custMobile":"$userContactNo"},  "extras": {"udf1":"udf1","udf2":"udf2","udf3":"udf3","udf4":"udf4","udf5":"udf5"}}}';

// //       final String encDataR = await encrypt(jsonData);
// //       final response = await http.post(
// //         Uri.parse(authUrl),
// //         headers: {
// //           'content-type': 'application/x-www-form-urlencoded',
// //         },
// //         body: {
// //           'encData': encDataR,
// //           'merchId': merchId,
// //         },
// //       );
// //       if (response.statusCode == 200) {
// //         debugPrint("Response received: Status code 200");

// //         final responseData = response.body.split('&');
// //         debugPrint("Response body split into array: $responseData");

// //         if (responseData.length > 1) {
// //           // Extract the encrypted data
// //           final encDataPart = responseData
// //               .firstWhere((element) => element.startsWith('encData'));
// //           final encryptedData = encDataPart.split('=')[1];
// //           final extractedData = ['encData', encryptedData];
// //           debugPrint("Extracted encrypted response data: $extractedData");

// //           try {
// //             // Decrypt the extracted data
// //             final decryptedData = await decrypt(extractedData[1]);
// //             debugPrint("Decrypted data: $decryptedData");

// //             final jsonResponse = json.decode(decryptedData);
// //             debugPrint("JSON response: $jsonResponse");

// //             if (jsonResponse['responseDetails']['txnStatusCode'] == 'OTS0000') {
// //               setState(() {
// //                 atomTokenId = jsonResponse['atomTokenId'].toString();
// //                 isLoading = false;
// //                 // ignore: prefer_interpolation_to_compose_strings
// //                 debugPrint("Transaction Status Code: " +
// //                     jsonResponse['responseDetails']['txnStatusCode']);
// //               });
// //             } else {
// //               debugPrint("Error: txnStatusCode is not 'OTS0000'");
// //               throw Exception('Payment initialization failed');
// //             }
// //           } catch (e) {
// //             debugPrint("Decryption failed: $e");
// //             throw Exception('Error during decryption: $e');
// //           }
// //         } else {
// //           debugPrint("Error: Invalid response data format");
// //           throw Exception('Invalid response data format');
// //         }
// //       } else {
// //         debugPrint(
// //             "Error: Failed to connect to the server. Status code: ${response.statusCode}");
// //         throw Exception('Failed to connect to the server');
// //       }
// //     } catch (e) {
// //       setState(() {
// //         isLoading = false;
// //       });
// //       showError('Payment initialization failed: $e');
// //     }
// //   }

// //   void showError(String message) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text(message), backgroundColor: Colors.red),
// //     );
// //   }

// //   void showSuccess(String message) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text(message), backgroundColor: Colors.green),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         toolbarHeight: 100,
// //         title: const Text(
// //           'Merchant Shop',
// //           style: TextStyle(fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Container(
// //               margin: const EdgeInsets.symmetric(vertical: 20.0),
// //               child: Text(
// //                 "Atom Token ID: $atomTokenId",
// //                 style: const TextStyle(
// //                     fontSize: 16.0, fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //             Container(
// //               margin:
// //                   const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
// //               child: Text(
// //                 "Transaction ID: $currentTxnId",
// //                 style: const TextStyle(
// //                     fontSize: 16.0, fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //             Container(
// //               margin: const EdgeInsets.symmetric(vertical: 20.0),
// //               child: const Text(
// //                 "Pay Rs: 1.00",
// //                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //             Container(
// //               margin: const EdgeInsets.symmetric(vertical: 20.0),
// //               child: isLoading
// //                   ? const CircularProgressIndicator()
// //                   : ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.blue),
// //                       onPressed: () {
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                                 builder: (context) => PaymentWebView(
// //                                       atomTokenId: atomTokenId.toString(),
// //                                       merchId: merchId,
// //                                       currentTxnId: currentTxnId,
// //                                     )));
// //                       },
// //                       child: const Text(
// //                         'Pay Now',
// //                         style: TextStyle(color: Colors.white, fontSize: 16),
// //                       ),
// //                     ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class PaymentWebView extends StatefulWidget {
// //   final String atomTokenId;
// //   final String merchId;
// //   final String currentTxnId;

// //   const PaymentWebView({
// //     required this.atomTokenId,
// //     required this.merchId,
// //     required this.currentTxnId,
// //     super.key,
// //   });

// //   @override
// //   State createState() => _PaymentWebViewState();
// // }

// // class _PaymentWebViewState extends State<PaymentWebView> {
// //   double progress = 0;
// //   late InAppWebViewController webViewController;

// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: () => _handleBackButtonAction(context),
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Payment'),
// //           leading: IconButton(
// //             icon: const Icon(Icons.close),
// //             onPressed: () => Navigator.of(context).pop(),
// //           ),
// //         ),
// //         body: Stack(
// //           children: [
// //             InAppWebView(
// //                 initialData: InAppWebViewInitialData(
// //                   data: '''
// //                   <!DOCTYPE html>
// //                   <html>
// //                   <head>
// //                     <meta name="viewport" content="width=device-width, initial-scale=1.0">
// //                     <script src="https://pgtest.atomtech.in/staticdata/ots/js/atomcheckout.js"></script>
// //                   </head>
// //                   <body>
// //                   <script>
// //                       function initPayment() {
// //                         const options = {
// //                           "atomTokenId": "$atomTokenId",
// //                           "merchId": "$merchId",
// //                           "custEmail": "test.user@gmail.com",
// //                           "custMobile": "8888888888",
// //                           "returnUrl": "https://pgtest.atomtech.in/mobilesdk/param",
// //                           "userAgent": "mobile_webView"
// //                         };
// //                         new AtomPaynetz(options, 'uat');
// //                       }

// //                       window.onload = initPayment;

// //                     </script>

// //                   </body>
// //                   </html>
// //                 ''',
// //                 ),
// //                 shouldOverrideUrlLoading: (controller, navigationAction) async {
// //                   debugPrint("shouldOverrideUrlLoading called");
// //                   var uri = navigationAction.request.url!;
// //                   debugPrint(uri.scheme);
// //                   if (["upi"].contains(uri.scheme)) {
// //                     debugPrint("UPI URL detected");
// //                     // Launch the App
// //                     await launchUrl(
// //                       uri,
// //                     );
// //                     // and cancel the request
// //                     return NavigationActionPolicy.CANCEL;
// //                   }
// //                   return NavigationActionPolicy.ALLOW;
// //                 },
// //                 initialSettings: InAppWebViewSettings(
// //                     javaScriptEnabled: true,
// //                     javaScriptCanOpenWindowsAutomatically: true),
// //                 onLoadStop: (controller, url) async {
// //                   print("onLoadStop");
// //                   print(url);
// //                   setState(() {
// //                     progress = 1.0;
// //                   });

// //                   if (url != null &&
// //                       url.toString().contains("/mobilesdk/param")) {
// //                     print("/mobilesdk/param detected");

// //                     // New code to evaluate JavaScript and get the response
// //                     final String response = await controller.evaluateJavascript(
// //                         source:
// //                             "document.getElementsByTagName('h5')[0].innerHTML");
// //                     // You can now use the 'response' variable as needed
// //                     debugPrint("HTML response : $response");

// //                     final split = response.trim().split('|');
// //                     final Map<int, String> values = {
// //                       for (int i = 0; i < split.length; i++) i: split[i]
// //                     };

// //                     var transactionResult = "";

// //                     if (response.trim().contains("cancelTransaction")) {

// //                       transactionResult = "Transaction Cancelled!";
// //                     } else {
// //                       final splitTwo = values[1]!.split('=');
// //                       print("encData value");
// //                       debugPrint(splitTwo[1].toString());

// //                       final decryptedResponseData =
// //                           await decrypt(splitTwo[1].toString());
// //                       debugPrint(
// //                           'Decrypted response data: $decryptedResponseData');

// //                       Map<String, dynamic> jsonInput =
// //                           jsonDecode(decryptedResponseData);
// //                       debugPrint("Reading full response: $jsonInput");

// //                       var checkFinalTransaction =
// //                           await validateSignature(jsonInput, resHashKey);

// //                       debugPrint("Signature matched: $checkFinalTransaction");

// //                       if (checkFinalTransaction) {
// //                         print("Signature is valid");
// //                         if (jsonInput["payInstrument"]["responseDetails"]
// //                                 ["statusCode"] ==
// //                             'OTS0000') {
// //                           debugPrint("Transaction success and close");
// //                           transactionResult = "Transaction Success";

// //                           ScaffoldMessenger.of(context).showSnackBar(
// //                             SnackBar(
// //                               content: Text("Transaction Successful!"),
// //                               duration: Duration(seconds: 3),
// //                               backgroundColor: Colors.green,
// //                             ),
// //                           );
// //                         } else {
// //                           debugPrint("Transaction failed");
// //                           transactionResult = "Transaction Failed";
// //                         }
// //                       } else {
// //                         debugPrint("Signature mismatched");
// //                         transactionResult = "Signature Failed";
// //                       }
// //                       _closeWebView(context, transactionResult);
// //                     }
// //                   }
// //                 }),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _closeWebView(BuildContext context, String transactionResult) {
// //     debugPrint("Closing web");
// //     debugPrint("result: $transactionResult");
// //     if (!mounted) return; // Ensure widget is still mounted

// //     Navigator.of(context).pop(); // Close current window
// //   }

// //   Future<bool> _handleBackButtonAction(BuildContext context) async {
// //     debugPrint("_handleBackButtonAction called");
// //     showDialog(
// //         context: context,
// //         builder: (context) => AlertDialog(
// //               title: const Text('Do you want to exit the payment ?'),
// //               actions: <Widget>[
// //                 // ignore: deprecated_member_use
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.of(context).pop();
// //                   },
// //                   child: const Text('No'),
// //                 ),
// //                 // ignore: deprecated_member_use
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                     Navigator.of(context).pop(); // Close current window
// //                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //                         content: Text(
// //                             "Transaction Status = Transaction cancelled")));
// //                   },
// //                   child: const Text('Yes'),
// //                 ),
// //               ],
// //             ));
// //     return Future.value(true);
// //   }
// // }

// // ignore_for_file: constant_identifier_names
// import 'dart:convert';
// import 'dart:math';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:cryptography/cryptography.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
// import 'package:encrypt/encrypt.dart' as encryptw;

// const req_EncKey = 'A4476C2062FFA58980DC8F79EB6A799E';
// const req_Salt = 'A4476C2062FFA58980DC8F79EB6A799E';
// const res_DecKey = '75AEF0FA1B94B3C10D4F5B268F757F11';
// const res_Salt = '75AEF0FA1B94B3C10D4F5B268F757F11';
// const resHashKey = "KEYRESP123657234";
// const merchId = "317157";
// const merchPass = "Test@123";
// const prodId = "NSE";
// final authUrl = "https://paynetzuat.atomtech.in/ots/aipay/auth";

// String? atomTokenId;
// String currentTxnId = '';

// bool isLoading = false;

// final password = Uint8List.fromList(utf8.encode(req_EncKey));
// final salt = Uint8List.fromList(utf8.encode(req_Salt));
// final resPassword = Uint8List.fromList(utf8.encode(res_DecKey));
// final resSalt = Uint8List.fromList(utf8.encode(res_Salt));
// final iv =
//     Uint8List.fromList([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]);

// //Encrypt Function
// Future<String> encrypt(String text) async {
//   debugPrint('Input text for encryption: $text');
//   try {
//     final pbkdf2 = Pbkdf2(
//       macAlgorithm: Hmac.sha512(),
//       iterations: 65536,
//       bits: 256,
//     );

//     final derivedKey = await pbkdf2.deriveKey(
//       secretKey: SecretKey(password),
//       nonce: salt,
//     );

//     final keyBytes = await derivedKey.extractBytes();
//     debugPrint('Derived key bytes: $keyBytes');

//     final aesCbc = AesCbc.with256bits(
//       macAlgorithm: MacAlgorithm.empty,
//       paddingAlgorithm: PaddingAlgorithm.pkcs7,
//     );

//     final secretBox = await aesCbc.encrypt(
//       utf8.encode(text),
//       secretKey: SecretKey(keyBytes),
//       nonce: iv,
//     );

//     final hexOutput = secretBox.cipherText
//         .map((b) => b.toRadixString(16).padLeft(2, '0'))
//         .join();
//     debugPrint('Encrypted hex output: $hexOutput');
//     return hexOutput;
//   } catch (e, stackTrace) {
//     debugPrint('Encryption error: $e');
//     debugPrint('Stack trace: $stackTrace');
//     rethrow;
//   }
// }

// // Decrypt Function
// Future<String> decrypt(String hexCipherText) async {
//   try {
//     debugPrint('Input hex for decryption: $hexCipherText');

//     // Convert hex string to bytes
//     List<int> cipherText = [];
//     for (int i = 0; i < hexCipherText.length; i += 2) {
//       String hex = hexCipherText.substring(i, i + 2);
//       cipherText.add(int.parse(hex, radix: 16));
//     }
//     debugPrint('Cipher text bytes: $cipherText');

//     final pbkdf2 = Pbkdf2(
//       macAlgorithm: Hmac.sha512(),
//       iterations: 65536,
//       bits: 256,
//     );

//     final derivedKey = await pbkdf2.deriveKey(
//       secretKey: SecretKey(resPassword),
//       nonce: resSalt, // Use the same salt as in encryption
//     );

//     final keyBytes = await derivedKey.extractBytes();

//     final aesCbc = AesCbc.with256bits(
//       macAlgorithm: MacAlgorithm.empty,
//       paddingAlgorithm: PaddingAlgorithm.pkcs7,
//     );

//     final secretBox = SecretBox(
//       cipherText,
//       nonce: iv, // Use the same IV as in encryption
//       mac: Mac.empty,
//     );
//     debugPrint('SecretBox: $secretBox');

//     final decryptedBytes = await aesCbc.decrypt(
//       secretBox,
//       secretKey: SecretKey(keyBytes),
//     );

//     final decryptedText = utf8.decode(decryptedBytes);
//     debugPrint('Decrypted text: $decryptedText');
//     return decryptedText;
//   } catch (e, stackTrace) {
//     debugPrint('Decryption error: $e');
//     debugPrint('Stack trace: $stackTrace');
//     rethrow;
//   }
// }

// Future<bool> validateSignature(
//     Map<String, dynamic> data, String resHashKey) async {
//   debugPrint("validateSignature called");

//   String signatureString = data["payInstrument"]["merchDetails"]["merchId"]
//           .toString() +
//       data["payInstrument"]["payDetails"]["atomTxnId"].toString() +
//       data['payInstrument']['merchDetails']['merchTxnId'].toString() +
//       data['payInstrument']['payDetails']['totalAmount'].toStringAsFixed(2) +
//       data['payInstrument']['responseDetails']['statusCode'].toString() +
//       data['payInstrument']['payModeSpecificData']['subChannel'][0].toString() +
//       data['payInstrument']['payModeSpecificData']['bankDetails']['bankTxnId']
//           .toString();

//   var bytes = utf8.encode(signatureString);
//   var key = utf8.encode(resHashKey);

//   final hmac = Hmac.sha512();
//   final secretKey = SecretKey(key);
//   final mac = await hmac.calculateMac(bytes, secretKey: secretKey);

//   var genSig =
//       mac.bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();

//   if (data['payInstrument']['payDetails']['signature'] == genSig) {
//     print("ignaure matched");
//     return true;
//   } else {
//     print("signaure does not matched");
//     return false;
//   }
// }

// class PayPage extends StatefulWidget {
//   const PayPage({super.key});

//   @override
//   State<PayPage> createState() => _PayPageState();
// }

// class _PayPageState extends State<PayPage> {
//   @override
//   void initState() {
//     super.initState();
//     // Generate atom token when page loads
//     initiatePayment();
//   }

//   // //Generate Signature
//   // Future<String> generateSignature(Map<String, dynamic> respArray) async {
//   //   print("Generating signature using response array.");

//   //   final payDetails = respArray['payDetails'];
//   //   final merchDetails = respArray['merchDetails'];
//   //   final responseDetails = respArray['responseDetails'];
//   //   final payModeSpecificData = respArray['payModeSpecificData'];

//   //   // Construct the signature string
//   //   final signatureString =
//   //       '${merchDetails['merchId']}${payDetails['atomTxnId']}${merchDetails['merchTxnId']}${payDetails['totalAmount'].toStringAsFixed(2)}${responseDetails['statusCode']}${payModeSpecificData['subChannel'][0]}${payModeSpecificData['bankDetails']['bankTxnId']}';

//   //   print("Constructed signature string: $signatureString");

//   //   // Initialize HMAC with the key
//   //   final hmac = Hmac.sha512();
//   //   final secretKey = SecretKey(utf8.encode(resHashKey));
//   //   final signatureBytes = await hmac.calculateMac(
//   //     utf8.encode(signatureString),
//   //     secretKey: secretKey,
//   //   );

//   //   print("HMAC updated with signature string.");

//   //   // Generate the HMAC (signature)
//   //   final genHmac = signatureBytes.bytes
//   //       .map((b) => b.toRadixString(16).padLeft(2, '0'))
//   //       .join();

//   //   print("Generated HMAC (signature): $genHmac");

//   //   return genHmac;
//   // }

//   //Initiate the payment (Send request to atom server)
//   Future<void> initiatePayment() async {
//     setState(() {
//       isLoading = true;
//       currentTxnId =
//           'Invoice${DateTime.now().millisecondsSinceEpoch.toRadixString(36)}';
//     });

//     try {
//       final String txnDate = DateTime.now().toString().split('.')[0];
//       const String amount = "1";
//       const String userEmailId = "test.user@atomtech.in";
//       const String userContactNo = "8888888888";

//       //Json data for sending to atom server
//       String jsonData =
//           '{"payInstrument":{"headDetails":{"version":"OTSv1.1","api":"AUTH","platform":"FLASH"},"merchDetails":{"merchId":"$merchId","userId":"","password":"$merchPass","merchTxnId":"$currentTxnId","merchTxnDate":"$txnDate"},"payDetails":{"amount":"$amount","product":"$prodId","custAccNo":"213232323","txnCurrency":"INR"},"custDetails":{"custEmail":"$userEmailId","custMobile":"$userContactNo"},  "extras": {"udf1":"udf1","udf2":"udf2","udf3":"udf3","udf4":"udf4","udf5":"udf5"}}}';

//       final String encDataR = await encrypt(jsonData);
//       final response = await http.post(
//         Uri.parse(authUrl),
//         headers: {
//           'content-type': 'application/x-www-form-urlencoded',
//         },
//         body: {
//           'encData': encDataR,
//           'merchId': merchId,
//         },
//       );
//       if (response.statusCode == 200) {
//         debugPrint("Response received: Status code 200");

//         final responseData = response.body.split('&');
//         debugPrint("Response body split into array: $responseData");

//         if (responseData.length > 1) {
//           // Extract the encrypted data
//           final encDataPart = responseData
//               .firstWhere((element) => element.startsWith('encData'));
//           final encryptedData = encDataPart.split('=')[1];
//           final extractedData = ['encData', encryptedData];
//           debugPrint("Extracted encrypted response data: $extractedData");

//           try {
//             // Decrypt the extracted data
//             final decryptedData = await decrypt(extractedData[1]);
//             debugPrint("Decrypted data: $decryptedData");

//             final jsonResponse = json.decode(decryptedData);
//             debugPrint("JSON response: $jsonResponse");

//             if (jsonResponse['responseDetails']['txnStatusCode'] == 'OTS0000') {
//               setState(() {
//                 atomTokenId = jsonResponse['atomTokenId'].toString();
//                 isLoading = false;
//                 // ignore: prefer_interpolation_to_compose_strings
//                 debugPrint("Transaction Status Code: " +
//                     jsonResponse['responseDetails']['txnStatusCode']);
//               });
//             } else {
//               debugPrint("Error: txnStatusCode is not 'OTS0000'");
//               throw Exception('Payment initialization failed');
//             }
//           } catch (e) {
//             debugPrint("Decryption failed: $e");
//             throw Exception('Error during decryption: $e');
//           }
//         } else {
//           debugPrint("Error: Invalid response data format");
//           throw Exception('Invalid response data format');
//         }
//       } else {
//         debugPrint(
//             "Error: Failed to connect to the server. Status code: ${response.statusCode}");
//         throw Exception('Failed to connect to the server');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       showError('Payment initialization failed: $e');
//     }
//   }

//   void showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message), backgroundColor: Colors.red),
//     );
//   }

//   void showSuccess(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message), backgroundColor: Colors.green),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         toolbarHeight: 100,
//         title: const Text(
//           'Merchant Shop',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 20.0),
//               child: Text(
//                 "Atom Token ID: $atomTokenId",
//                 style: const TextStyle(
//                     fontSize: 16.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               margin:
//                   const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
//               child: Text(
//                 "Transaction ID: $currentTxnId",
//                 style: const TextStyle(
//                     fontSize: 16.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 20.0),
//               child: const Text(
//                 "Pay Rs: 1.00",
//                 style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 20.0),
//               child: isLoading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => PaymentWebView(
//                                       atomTokenId: atomTokenId.toString(),
//                                       merchId: merchId,
//                                       currentTxnId: currentTxnId,
//                                     )));
//                       },
//                       child: const Text(
//                         'Pay Now',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<String> decrypt2(String encData) async {
//   // Step 1: Convert the hex key to a byte array
//   final key = encryptw.Key.fromBase16('E074A2C130FC4FF676932DB3F8ABAC9F');

//   // Step 2: If using CBC mode, provide an IV (check AtomTech documentation for the correct IV)
//   final iv = encryptw.IV.fromLength(
//       16); // Default IV (all zeros), replace with actual IV if required

//   // Step 3: Initialize the encrypter with AES (assuming CBC mode)
//   final encrypter =
//       encryptw.Encrypter(encryptw.AES(key, mode: encryptw.AESMode.cbc));

//   // Step 4: Base64 decode the encData
//   final encryptedBytes = base64.decode(encData);

//   // Step 5: Decrypt the data
//   final decrypted =
//       encrypter.decrypt(encryptw.Encrypted(encryptedBytes), iv: iv);
//   print("Decrypted Data");
//   print(decrypted.toString());
//   return decrypted;
// }
// /////22222222
// // class PaymentWebView extends StatefulWidget {
// //   final String atomTokenId;
// //   final String merchId;
// //   final String currentTxnId;
// //   final String? custemail, custmobile, returnurl;

// //   const PaymentWebView({
// //     required this.atomTokenId,
// //     required this.merchId,
// //     required this.currentTxnId,
// //     this.custemail,
// //     this.custmobile,
// //     this.returnurl,
// //     super.key,
// //   });

// //   @override
// //   State createState() => _PaymentWebViewState();
// // }

// // class _PaymentWebViewState extends State<PaymentWebView> {
// //   double progress = 0;
// //   late InAppWebViewController webViewController;

// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: () => _handleBackButtonAction(context),
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Payment'),
// //           leading: IconButton(
// //             icon: const Icon(Icons.close),
// //             onPressed: () => Navigator.of(context).pop(),
// //           ),
// //         ),
// //         body: Stack(
// //           children: [
// //             InAppWebView(
// //                 initialData: InAppWebViewInitialData(
// //                   data: '''
// //                   <!DOCTYPE html>
// //                   <html>
// //                   <head>
// //                     <meta name="viewport" content="width=device-width, initial-scale=1.0">
// //                     <script src="https://payment.atomtech.in/staticdata/ots/js/atomcheckout.js"></script>
// //                   </head>
// //                   <body>
// //                   <script>
// //                       function initPayment() {
// //                         const options = {
// //                           "atomTokenId": "${widget.atomTokenId}",
// //                           "merchId": "${widget.merchId}",
// //                           "custEmail": "${widget.custemail}",
// //                           "custMobile": "${widget.custmobile}",
// //                           "returnUrl": "${widget.returnurl}",
// //                           "userAgent": "mobile_webView"
// //                         };
// //                         new AtomPaynetz(options, 'production');
// //                       }

// //                       window.onload = initPayment;

// //                     </script>

// //                   </body>
// //                   </html>
// //                 ''',
// //                 ),
// //                 // shouldOverrideUrlLoading: (controller, navigationAction) async {
// //                 //   debugPrint("shouldOverrideUrlLoading called");
// //                 //   var uri = navigationAction.request.url!;
// //                 //   debugPrint(uri.scheme);
// //                 //   if (["upi"].contains(uri.scheme)) {
// //                 //     debugPrint("UPI URL detected");
// //                 //     // Launch the App
// //                 //     await launchUrl(
// //                 //       uri,
// //                 //     );
// //                 //     // and cancel the request
// //                 //     return NavigationActionPolicy.CANCEL;
// //                 //   }
// //                 //   return NavigationActionPolicy.ALLOW;
// //                 // },

// //                 shouldOverrideUrlLoading: (controller, navigationAction) async {
// //                   var uri = navigationAction.request.url!;
// //                   debugPrint("Navigating to: ${uri.toString()}");

// //                   // Check if the URL scheme is UPI (tez, phonepe, paytm, upi, etc.)
// //                   if (["upi", "tez", "phonepe", "paytm"].contains(uri.scheme)) {
// //                     debugPrint("UPI URL detected: ${uri.toString()}");

// //                     // Try to launch the UPI payment app
// //                     try {
// //                       bool launched = await launchUrl(
// //                         uri,
// //                         mode: LaunchMode
// //                             .externalApplication, // Open in an external app
// //                       );

// //                       if (!launched) {
// //                         debugPrint("Could not launch UPI app");
// //                       }
// //                     } catch (e) {
// //                       debugPrint("Error launching UPI app: $e");
// //                     }

// //                     // Prevent WebView from trying to load the UPI URL
// //                     return NavigationActionPolicy.CANCEL;
// //                   }

// //                   // Allow normal web navigation
// //                   return NavigationActionPolicy.ALLOW;
// //                 },
// //                 initialSettings: InAppWebViewSettings(
// //                     javaScriptEnabled: true,
// //                     javaScriptCanOpenWindowsAutomatically: true),
// //                 onLoadStop: (controller, url) async {
// //                   print("onLoadStop");
// //                   print(url);
// //                   setState(() {
// //                     progress = 1.0;
// //                   });

// //                   if (url != null &&
// //                       url.toString().contains("  ")) {
// //                     print("/mobilesdk/param detected");

// //                     // New code to evaluate JavaScript and get the response
// //                     final String response = await controller.evaluateJavascript(
// //                         source:
// //                             "document.getElementsByTagName('h5')[0].innerHTML");
// //                     // You can now use the 'response' variable as needed
// //                     debugPrint("HTML response : $response");

// //                     final split = response.trim().split('|');
// //                     final Map<int, String> values = {
// //                       for (int i = 0; i < split.length; i++) i: split[i]
// //                     };

// //                     var transactionResult = "";

// //                     if (response.trim().contains("cancelTransaction")) {
// //                       transactionResult = "Transaction Cancelled!";
// //                     } else {
// //                       final splitTwo = values[1]!.split('=');
// //                       print("encData value");
// //                       debugPrint(splitTwo[1].toString());

// //                       final decryptedResponseData =
// //                           await decrypt(splitTwo[1].toString());
// //                       debugPrint(
// //                           'Decrypted response data: $decryptedResponseData');

// //                       Map<String, dynamic> jsonInput =
// //                           jsonDecode(decryptedResponseData);
// //                       debugPrint("Reading full response: $jsonInput");

// //                       var checkFinalTransaction =
// //                           await validateSignature(jsonInput, resHashKey);

// //                       debugPrint("Signature matched: $checkFinalTransaction");

// //                       if (checkFinalTransaction) {
// //                         print("Signature is valid");
// //                         if (jsonInput["payInstrument"]["responseDetails"]
// //                                 ["statusCode"] ==
// //                             'OTS0000') {
// //                           debugPrint("Transaction success and close");
// //                           transactionResult = "Transaction Success";
// //                           ScaffoldMessenger.of(context).showSnackBar(
// //                             SnackBar(
// //                               content: Text("Transaction Successful!"),
// //                               duration: Duration(seconds: 3),
// //                               backgroundColor: Colors.green,
// //                             ),
// //                           );
// //                         } else {
// //                           debugPrint("Transaction failed");
// //                           transactionResult = "Transaction Failed";
// //                         }
// //                       } else {
// //                         debugPrint("Signature mismatched");
// //                         transactionResult = "Signature Failed";
// //                       }
// //                       _closeWebView(context, transactionResult);
// //                     }
// //                   }
// //                 }),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _closeWebView(BuildContext context, String transactionResult) {
// //     debugPrint("Closing web");
// //     debugPrint("result: $transactionResult");
// //     if (!mounted) return; // Ensure widget is still mounted

// //     Navigator.of(context).pop(); // Close current window
// //   }

// //   Future<bool> _handleBackButtonAction(BuildContext context) async {
// //     debugPrint("_handleBackButtonAction called");
// //     showDialog(
// //         context: context,
// //         builder: (context) => AlertDialog(
// //               title: const Text('Do you want to exit the payment ?'),
// //               actions: <Widget>[
// //                 // ignore: deprecated_member_use
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.of(context).pop();
// //                   },
// //                   child: const Text('No'),
// //                 ),
// //                 // ignore: deprecated_member_use
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                     Navigator.of(context).pop(); // Close current window
// //                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //                         content: Text(
// //                             "Transaction Status = Transaction cancelled")));
// //                   },
// //                   child: const Text('Yes'),
// //                 ),
// //               ],
// //             ));
// //     return Future.value(true);
// //   }
// // }
// ///333333333

// // class PaymentWebView extends StatefulWidget {
// //   final String atomTokenId;
// //   final String merchId;
// //   final String currentTxnId;
// //   final String? custemail, custmobile, returnurl;

// //   const PaymentWebView({
// //     required this.atomTokenId,
// //     required this.merchId,
// //     required this.currentTxnId,
// //     this.custemail,
// //     this.custmobile,
// //     this.returnurl,
// //     super.key,
// //   });

// //   @override
// //   State createState() => _PaymentWebViewState();
// // }

// // class _PaymentWebViewState extends State<PaymentWebView> {
// //   late InAppWebViewController webViewController;
// //   double progress = 0.0;
// //   bool _isPaymentProcessed = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: () => _handleBackButtonAction(context),
// //       child: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Payment'),
// //           leading: IconButton(
// //             icon: const Icon(Icons.close),
// //             onPressed: () => Navigator.of(context).pop(),
// //           ),
// //         ),
// //         body: Stack(
// //           children: [
// //             InAppWebView(
// //               initialData: InAppWebViewInitialData(
// //                 data: '''
// //                 <!DOCTYPE html>
// //                 <html>
// //                 <head>
// //                   <meta name="viewport" content="width=device-width, initial-scale=1.0">
// //                   <script src="https://payment.atomtech.in/staticdata/ots/js/atomcheckout.js"></script>
// //                 </head>
// //                 <body>
// //                 <script>
// //                     function initPayment() {
// //                       const options = {
// //                         "atomTokenId": "${widget.atomTokenId}",
// //                         "merchId": "${widget.merchId}",
// //                         "custEmail": "${widget.custemail ?? ''}",
// //                         "custMobile": "${widget.custmobile ?? ''}",
// //                         "returnUrl": "${widget.returnurl}",
// //                         "userAgent": "mobile_webView"
// //                       };
// //                       new AtomPaynetz(options, 'production');
// //                     }
// //                     window.onload = initPayment;
// //                 </script>
// //                 </body>
// //                 </html>
// //                 ''',
// //               ),
// //               shouldOverrideUrlLoading: (controller, navigationAction) async {
// //                 var uri = navigationAction.request.url!;
// //                 debugPrint("Navigating to: ${uri.toString()}");

// //                 // Handle UPI Payments
// //                 if (["upi", "tez", "phonepe", "paytm"].contains(uri.scheme)) {
// //                   debugPrint("UPI URL detected: ${uri.toString()}");
// //                   try {
// //                     bool launched = await launchUrl(
// //                       uri,
// //                       mode: LaunchMode.externalApplication,
// //                     );
// //                     if (!launched) {
// //                       debugPrint("Could not launch UPI app");
// //                     }
// //                   } catch (e) {
// //                     debugPrint("Error launching UPI app: $e");
// //                   }
// //                   return NavigationActionPolicy.CANCEL;
// //                 }
// //                 return NavigationActionPolicy.ALLOW;
// //               },
// //               initialSettings: InAppWebViewSettings(
// //                 javaScriptEnabled: true,
// //                 javaScriptCanOpenWindowsAutomatically: true,
// //               ),
// //               onLoadStop: (controller, url) async {
// //                 debugPrint("Page Loaded: $url");

// //                 // More robust URL checking
// //                 if (url != null && widget.returnurl != null) {
// //                   // Check if URL contains or matches return URL
// //                   bool isReturnUrl =
// //                       url.toString().contains(widget.returnurl!) ||
// //                           (Uri.tryParse(url.toString())?.host ==
// //                               Uri.tryParse(widget.returnurl!)?.host);

// //                   if (isReturnUrl && !_isPaymentProcessed) {
// //                     debugPrint(
// //                         "Return URL detected, attempting to extract response...");

// //                     try {
// //                       // Multiple methods to extract response
// //                       final String? response =
// //                           await _extractPageResponse(controller);

// //                       if (response != null && response.isNotEmpty) {
// //                         _isPaymentProcessed = true;
// //                         await _capturePaymentResponse(response);

// //                         _closeWebView(
// //                             context,
// //                             response.toLowerCase().contains("success")
// //                                 ? "Transaction Success"
// //                                 : "Transaction Failed");
// //                       } else {
// //                         _showErrorDialog("Could not extract payment response");
// //                       }
// //                     } catch (e) {
// //                       debugPrint("Error processing return URL: $e");
// //                       _showErrorDialog("Error processing payment: $e");
// //                     }
// //                   }
// //                 }
// //               },
// //               onLoadError: (controller, url, code, message) {
// //                 debugPrint("WebView Load Error: $url");
// //                 debugPrint("Error Code: $code");
// //                 debugPrint("Error Message: $message");
// //                 _showErrorDialog("Failed to load payment page: $message");
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // Advanced response extraction method
// //   Future<String?> _extractPageResponse(
// //       InAppWebViewController controller) async {
// //     try {
// //       // Try multiple JavaScript methods to extract response
// //       final extractionMethods = [
// //         "document.body.innerText",
// //         "document.documentElement.textContent",
// //         "document.body.textContent",
// //         "document.body.innerHTML"
// //       ];

// //       for (var method in extractionMethods) {
// //         final response = await controller.evaluateJavascript(
// //           source: """
// //             (function() {
// //               try {
// //                 return $method || 'No content found';
// //               } catch (error) {
// //                 return 'Error: ' + error.toString();
// //               }
// //             })();
// //           """,
// //         );

// //         if (response != null && response.toString().isNotEmpty) {
// //           debugPrint("Response extracted using $method: $response");
// //           return response.toString();
// //         }
// //       }

// //       return null;
// //     } catch (e) {
// //       debugPrint("Comprehensive extraction error: $e");
// //       return null;
// //     }
// //   }

// //   // Show error dialog
// //   void _showErrorDialog(String message) {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text('Payment Error'),
// //         content: Text(message),
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               Navigator.of(context).pop(); // Close dialog
// //               Navigator.of(context).pop(); // Close webview
// //             },
// //             child: const Text('OK'),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // Capture payment response
// //   Future<void> _capturePaymentResponse(String response) async {
// //     try {
// //       var apiUrl = Uri.parse(widget.returnurl ??
// //           'https://stmaryswilliamnagarapi.lumensof.in/api/Paymet/api/payment/capture-response');

// //       var requestBody = jsonEncode({
// //         "key": "response",
// //         "value": [response]
// //       });

// //       debugPrint("Capture API URL: ${apiUrl.toString()}");
// //       debugPrint("Request Body: $requestBody");

// //       var headers = {
// //         "Content-Type": "application/json",
// //         // Add any additional headers if required
// //         // "Authorization": "Bearer your_token_here"
// //       };

// //       var responseApi =
// //           await http.post(apiUrl, body: requestBody, headers: headers);

// //       debugPrint("Response Status Code: ${responseApi.statusCode}");
// //       debugPrint("Response Body: ${responseApi.body}");

// //       if (responseApi.statusCode != 200) {
// //         throw Exception(
// //             'Failed to capture payment response: ${responseApi.body}');
// //       }
// //     } catch (e) {
// //       debugPrint("Comprehensive error capturing payment response: $e");

// //       // Show error to user
// //       _showErrorDialog("Payment response capture failed: $e");
// //     }
// //   }

// //   // Close WebView
// //   void _closeWebView(BuildContext context, String transactionResult) {
// //     debugPrint("Closing web with result: $transactionResult");
// //     if (!mounted) return;
// //     Navigator.of(context).pop(transactionResult);
// //   }

// //   // Handle back button press
// //   Future<bool> _handleBackButtonAction(BuildContext context) async {
// //     debugPrint("_handleBackButtonAction called");

// //     // Prevent back action if payment is in progress
// //     if (_isPaymentProcessed) {
// //       return false;
// //     }

// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text('Do you want to exit the payment?'),
// //         actions: <Widget>[
// //           ElevatedButton(
// //             onPressed: () => Navigator.of(context).pop(),
// //             child: const Text('No'),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //               Navigator.of(context).pop();
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 const SnackBar(
// //                     content:
// //                         Text("Transaction Status = Transaction cancelled")),
// //               );
// //             },
// //             child: const Text('Yes'),
// //           ),
// //         ],
// //       ),
// //     );
// //     return Future.value(true);
// //   }
// // }

// class PaymentWebView extends StatefulWidget {
//   final String atomTokenId;
//   final String merchId;
//   final String currentTxnId;
//   final String? custemail, custmobile, returnurl;

//   const PaymentWebView({
//     required this.atomTokenId,
//     required this.merchId,
//     required this.currentTxnId,
//     this.custemail,
//     this.custmobile,
//     this.returnurl,
//     super.key,
//   });

//   @override
//   State createState() => _PaymentWebViewState();
// }

// class _PaymentWebViewState extends State<PaymentWebView> {
//   late InAppWebViewController webViewController;
//   double progress = 0.0;
//   final bool _isPaymentProcessed = false;

//   // Method to call capture response API
//   Future<void> _callCaptureResponseApi(String status) async {
//     try {
//       final url = Uri.parse(
//           'https://stmaryswilliamnagarapi.lumensof.in/api/Paymet/api/payment/capture-response');

//       // Prepare the request body
//       final requestBody = {
//         "key": widget.currentTxnId, // Using currentTxnId as the key
//         "value": [status], // Passing transaction status as value
//       };
//       print(requestBody);
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//           // Add any additional headers if required
//         },
//         body: jsonEncode(requestBody),
//       );

//       debugPrint('Capture Response API Call');
//       debugPrint('Status: $status');
//       debugPrint('Response Status Code: ${response.statusCode}');
//       debugPrint('Response Body: ${response.body}');

//       if (response.statusCode != 200) {
//         throw Exception('Failed to capture payment response');
//       }
//     } catch (e) {
//       debugPrint('Error calling capture response API: $e');

//       // Show error dialog to user
//       _showErrorDialog('Payment capture failed: $e');
//     }
//   }

//   // Show error dialog
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Payment Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close dialog
//               Navigator.of(context).pop(); // Close webview
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   // "atomTokenId": "${widget.atomTokenId}",
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => _handleBackButtonAction(context),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Payment'),
//           leading: IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ),
//         // <script src="https://payment.atomtech.in/staticdata/ots/js/atomcheckout.js"></script>
//         // <script src="https://psa.atomtech.in/staticdata/ots/js/atomcheckout.js"></script>
//         // "${widget.merchId}",
//         // "atomTokenId": "${widget.atomTokenId}",
//         // "atomTokenId": "15000023746618",

//         // "atomTokenId": "15000023746618",

//         //             "merchId": "628856",
//         body: Stack(
//           children: [
//             InAppWebView(
//               initialData: InAppWebViewInitialData(
//                 data: '''
//     <!DOCTYPE html>
//     <html>
//     <head>
//       <meta name="viewport" content="width=device-width, initial-scale=1.0">
//       <script src="https://psa.atomtech.in/staticdata/ots/js/atomcheckout.js"></script>
//     </head>
//     <body>
//     <script>
//         function initPayment() {
//           const options = {
//             "atomTokenId": "${widget.atomTokenId}",                       
//             "merchId": "${widget.merchId}",                    
//             "custEmail": "${widget.custemail ?? ''}",
//             "custMobile": "${widget.custmobile ?? ''}",
//             "returnUrl": "${widget.returnurl}",
//             "userAgent": "mobile_webView"
//           };
//           new AtomPaynetz(options, 'production');
//         }
//         window.onload = initPayment;
//     </script>
//     </body>
//     </html>
//     ''',
//               ),
//               shouldOverrideUrlLoading: (controller, navigationAction) async {
//                 var uri = navigationAction.request.url!;
//                 debugPrint("Navigating to: ${uri.toString()}");

//                 // Handle UPI Payments
//                 if (["upi", "tez", "phonepe", "paytm"].contains(uri.scheme)) {
//                   debugPrint("UPI URL detected: ${uri.toString()}");
//                   try {
//                     bool launched = await launchUrl(
//                       uri,
//                       mode: LaunchMode.externalApplication,
//                     );
//                     if (!launched) {
//                       debugPrint("Could not launch UPI app");
//                     }
//                   } catch (e) {
//                     debugPrint("Error launching UPI app: $e");
//                   }
//                   return NavigationActionPolicy.CANCEL;
//                 }
//                 return NavigationActionPolicy.ALLOW;
//               },
//               initialSettings: InAppWebViewSettings(
//                 javaScriptEnabled: true,
//                 javaScriptCanOpenWindowsAutomatically: true,
//               ),
//               onLoadStop: (controller, url) async {
//                 print("onLoadStop: $url");
//                 setState(() {
//                   progress = 1.0;
//                 });

//                 // Only process URLs from the Atom payment system
//                 if (url == null ||
//                     !url.toString().contains("psa.atomtech.in")) {
//                   return;
//                 }

//                 print("Atom URL detected: $url");

//                 // For checkout-frame.jsp specifically
//                 if (url.toString().contains("checkout-frame.jsp")) {
//                   print(
//                       "Initial checkout frame detected - waiting for transaction response");
//                   return;
//                 }
//                 if (url.toString().contains("encData=")) {
//                   try {
//                     // Extract encData directly from the URL
//                     Uri uri = Uri.parse(url.toString());
//                     String? encData = uri.queryParameters['encData'];
//                     print(encData);
//                     if (encData != null && encData.isNotEmpty) {
//                       // Try to determine if it's a success or failure
//                       // Option 1: Check for success/failure indicator in URL if available
//                       if (url.toString().contains("statusCode=OTS0000") ||
//                           url.toString().contains("status=success")) {
//                         await callCaptureResponseApi2(
//                             encData: encData, status: "Transaction Success");
//                       } else {
//                         // If there's no success indicator or there's a failure indicator
//                         await callCaptureResponseApi2(
//                             encData: encData, status: "Transaction Failed");
//                       }

//                       // After processing, close the WebView
//                       _closeWebView(context, "Transaction Processed");
//                       return;
//                     }
//                   } catch (urlParseError) {
//                     print("Error parsing URL: $urlParseError");
//                     await callCaptureResponseApi2(
//                         encData: "Error: ${urlParseError.toString()}",
//                         status: "URL Parsing Error");
//                     _closeWebView(context, "Processing Error");
//                   }
//                 }
//                 // Check if we have a direct URL response with encData parameter
//                 // if (url.toString().contains("encData=")) {
//                 //   try {
//                 //     // Extract encData directly from the URL
//                 //     Uri uri = Uri.parse(url.toString());
//                 //     String? encData = uri.queryParameters['encData'];
//                 //     if (encData != null && encData.isNotEmpty) {
//                 //       callCaptureResponseApi2(
//                 //           encData: encData, status: "Transaction Success");
//                 //     }

//                 //     // if (encData != null && encData.isNotEmpty) {
//                 //     //   print("Found encData in URL: $encData");

//                 //     //   try {
//                 //     //     // Decrypt the response data
//                 //     //     final String decryptedData = await decrypt2(encData);
//                 //     //     print("Decrypted data: $decryptedData");

//                 //     //     // Parse the JSON response
//                 //     //     Map<String, dynamic> jsonInput =
//                 //     //         jsonDecode(decryptedData);
//                 //     //     print("Parsed JSON Response: $jsonInput");

//                 //     //     // Validate signature
//                 //     //     bool signatureValid =
//                 //     //         await validateSignature(jsonInput, resHashKey);
//                 //     //     print("Signature validation result: $signatureValid");

//                 //     //     String transactionResult;
//                 //     //     if (!signatureValid) {
//                 //     //       transactionResult = "Signature Verification Failed";
//                 //     //     } else {
//                 //     //       // Check transaction status
//                 //     //       final statusCode = jsonInput["payInstrument"]
//                 //     //           ?["responseDetails"]?["statusCode"];
//                 //     //       print("Transaction status code: $statusCode");

//                 //     //       if (statusCode == 'OTS0000') {
//                 //     //         transactionResult = "Transaction Success";
//                 //     //         ScaffoldMessenger.of(context).showSnackBar(
//                 //     //           SnackBar(
//                 //     //             content: Text("Transaction Successful!"),
//                 //     //             duration: Duration(seconds: 3),
//                 //     //             backgroundColor: Colors.green,
//                 //     //           ),
//                 //     //         );
//                 //     //       } else {
//                 //     //         transactionResult =
//                 //     //             "Transaction Failed: $statusCode";
//                 //     //       }
//                 //     //     }

//                 //     //     // Call the API to capture the response with all relevant data
//                 //     //     await callCaptureResponseApi(
//                 //     //         status: transactionResult, responseData: jsonInput);

//                 //     //     _closeWebView(context, transactionResult);
//                 //     //     return;
//                 //     //   } catch (parseError) {
//                 //     //     print("Error processing encData: $parseError");
//                 //     //     await callCaptureResponseApi(
//                 //     //       status:
//                 //     //           "Data Processing Error: ${parseError.toString()}",
//                 //     //       responseData: null,
//                 //     //     );
//                 //     //     _closeWebView(context, "Processing Error");
//                 //     //     return;
//                 //     //   }
//                 //     // }
//                 //   } catch (urlParseError) {
//                 //     print("Error parsing URL: $urlParseError");
//                 //   }
//                 // }

//                 // If we couldn't extract from URL, try to get from page content
//                 try {
//                   // Extract content from the page
//                   String pageContent = await controller.evaluateJavascript(
//                     source: "document.body.innerHTML || ''",
//                   );

//                   if (pageContent.isEmpty) {
//                     print("Empty page content");
//                     await callCaptureResponseApi(
//                         status: "Empty Response", responseData: null);
//                     return;
//                   }

//                   // Rest of your existing code for content extraction...
//                   // [previous code for handling page content]
//                 } catch (e) {
//                   print("Exception during payment processing: $e");
//                   await callCaptureResponseApi(
//                     status: "Processing Exception: ${e.toString()}",
//                     responseData: null,
//                   );
//                   _closeWebView(context, "Processing Exception");
//                 }
//               },

//               //     onLoadStop: (controller, url) async {
//               //       print("onLoadStop: $url");
//               //       setState(() {
//               //         progress = 1.0;
//               //       });

//               //       // Only process URLs from the Atom payment system
//               //       if (url == null ||
//               //           !url.toString().contains("psa.atomtech.in")) {
//               //         return;
//               //       }

//               //       print("Atom URL detected: $url");

//               //       // For checkout-frame.jsp specifically
//               //       if (url.toString().contains("checkout-frame.jsp")) {
//               //         print(
//               //             "Initial checkout frame detected - waiting for transaction response");
//               //         return;
//               //       }

//               //       try {
//               //         // Improved content extraction with more robust error handling
//               //         String pageContent = await controller.evaluateJavascript(
//               //           source: "document.body.innerHTML || ''",
//               //         );

//               //         if (pageContent.isEmpty) {
//               //           print("Empty page content");
//               //           await callCaptureResponseApi(
//               //               status: "Empty Response", responseData: null);
//               //           return;
//               //         }

//               //         // Print the raw HTML content for debugging
//               //         print("Raw HTML Content: $pageContent");

//               //         // Check for 404 or error pages
//               //         if (pageContent
//               //                 .contains("404 - File or directory not found") ||
//               //             pageContent.contains("Server Error")) {
//               //           print("Error page detected");
//               //           await callCaptureResponseApi(
//               //               status: "Gateway Error Page", responseData: null);
//               //           _closeWebView(context, "Payment Gateway Error");
//               //           return;
//               //         }

//               //         // Check for cancellation
//               //         if (pageContent.contains("cancelTransaction")) {
//               //           print("Transaction was cancelled by user");
//               //           await callCaptureResponseApi(
//               //               status: "Transaction Cancelled", responseData: null);
//               //           _closeWebView(context, "Transaction Cancelled");
//               //           return;
//               //         }

//               //         // Try to find response data
//               //         String? encData;

//               //         // Look for encData in different possible formats
//               //         RegExp encDataRegex = RegExp(r'encData=([^&|]+)');
//               //         var match = encDataRegex.firstMatch(pageContent);

//               //         if (match != null && match.groupCount >= 1) {
//               //           encData = match.group(1);
//               //           print("Found encData using regex: $encData");
//               //         } else {
//               //           // Alternative method: try to extract from pipe-delimited format
//               //           if (pageContent.contains("|")) {
//               //             final List<String> parts = pageContent.split('|');
//               //             for (String part in parts) {
//               //               if (part.trim().startsWith("encData=")) {
//               //                 encData = part.trim().substring(8);
//               //                 print("Found encData in pipe format: $encData");
//               //                 break;
//               //               }
//               //             }
//               //           }
//               //         }

//               //         // If we still don't have encData, try JavaScript evaluation
//               //         if (encData == null) {
//               //           try {
//               //             final jsResult = await controller.evaluateJavascript(
//               //               source: """
//               //   (function() {
//               //     // Look for any element with encData text
//               //     const content = document.body.textContent;
//               //     const match = content.match(/encData=([^&|\\s]+)/);
//               //     return match ? match[1] : '';
//               //   })();
//               // """,
//               //             );

//               //             if (jsResult != null &&
//               //                 jsResult.toString().isNotEmpty &&
//               //                 jsResult != "null") {
//               //               encData = jsResult.toString();
//               //               print("Found encData using JavaScript: $encData");
//               //             }
//               //           } catch (jsError) {
//               //             print("JavaScript evaluation error: $jsError");
//               //           }
//               //         }

//               //         // Process transaction if encData was found
//               //         if (encData != null && encData.isNotEmpty) {
//               //           try {
//               //             // Decrypt the response data
//               //             final String decryptedData = await decrypt(encData);
//               //             print("Decrypted data: $decryptedData");

//               //             // Parse the JSON response
//               //             Map<String, dynamic> jsonInput =
//               //                 jsonDecode(decryptedData);

//               //             // Print the parsed JSON response
//               //             print("Parsed JSON Response: $jsonInput");

//               //             // Validate signature
//               //             bool signatureValid =
//               //                 await validateSignature(jsonInput, resHashKey);
//               //             print("Signature validation result: $signatureValid");

//               //             String transactionResult;
//               //             if (!signatureValid) {
//               //               transactionResult = "Signature Verification Failed";
//               //             } else {
//               //               // Check transaction status
//               //               final statusCode = jsonInput["payInstrument"]
//               //                   ?["responseDetails"]?["statusCode"];
//               //               print("Transaction status code: $statusCode");

//               //               if (statusCode == 'OTS0000') {
//               //                 transactionResult = "Transaction Success";
//               //                 ScaffoldMessenger.of(context).showSnackBar(
//               //                   SnackBar(
//               //                     content: Text("Transaction Successful!"),
//               //                     duration: Duration(seconds: 3),
//               //                     backgroundColor: Colors.green,
//               //                   ),
//               //                 );
//               //               } else {
//               //                 transactionResult = "Transaction Failed: $statusCode";
//               //               }
//               //             }

//               //             await callCaptureResponseApi(
//               //                 status: transactionResult, responseData: jsonInput);
//               //             _closeWebView(context, transactionResult);
//               //           } catch (parseError) {
//               //             print("Error processing encData: $parseError");
//               //             await callCaptureResponseApi(
//               //               status:
//               //                   "Data Processing Error: ${parseError.toString()}",
//               //               responseData: null,
//               //             );
//               //             _closeWebView(context, "Processing Error");
//               //           }
//               //         } else {
//               //           print("No encData found in response");
//               //           await callCaptureResponseApi(
//               //               status: "No encData Found", responseData: null);
//               //           _closeWebView(context, "Response Format Error");
//               //         }
//               //       } catch (e) {
//               //         print("Exception during payment processing: $e");
//               //         await callCaptureResponseApi(
//               //           status: "Processing Exception: ${e.toString()}",
//               //           responseData: null,
//               //         );
//               //         _closeWebView(context, "Processing Exception");
//               //       }
//               //     },

//               //   onLoadStop: (controller, url) async {
//               //     print("onLoadStop: $url");
//               //     setState(() {
//               //       progress = 1.0;
//               //     });

//               //     // Only process URLs from the Atom payment system
//               //     if (url == null ||
//               //         !url.toString().contains("psa.atomtech.in")) {
//               //       return;
//               //     }

//               //     print("Atom URL detected: $url");

//               //     // For checkout-frame.jsp specifically
//               //     if (url.toString().contains("checkout-frame.jsp")) {
//               //       print(
//               //           "Initial checkout frame detected - waiting for transaction response");
//               //       return;
//               //     }

//               //     try {
//               //       // Improved content extraction with more robust error handling
//               //       String pageContent = await controller.evaluateJavascript(
//               //         source: "document.body.innerHTML || ''",
//               //       );

//               //       if (pageContent.isEmpty) {
//               //         print("Empty page content");
//               //         await callCaptureResponseApi(
//               //             status: "Empty Response", responseData: null);
//               //         return;
//               //       }

//               //       // Check for 404 or error pages
//               //       if (pageContent
//               //               .contains("404 - File or directory not found") ||
//               //           pageContent.contains("Server Error")) {
//               //         print("Error page detected");
//               //         await callCaptureResponseApi(
//               //             status: "Gateway Error Page", responseData: null);
//               //         _closeWebView(context, "Payment Gateway Error");
//               //         return;
//               //       }

//               //       // Check for cancellation
//               //       if (pageContent.contains("cancelTransaction")) {
//               //         print("Transaction was cancelled by user");
//               //         await callCaptureResponseApi(
//               //             status: "Transaction Cancelled", responseData: null);
//               //         _closeWebView(context, "Transaction Cancelled");
//               //         return;
//               //       }

//               //       // Try to find response data
//               //       String? encData;

//               //       // Look for encData in different possible formats
//               //       RegExp encDataRegex = RegExp(r'encData=([^&|]+)');
//               //       var match = encDataRegex.firstMatch(pageContent);

//               //       if (match != null && match.groupCount >= 1) {
//               //         encData = match.group(1);
//               //         print("Found encData using regex: $encData");
//               //       } else {
//               //         // Alternative method: try to extract from pipe-delimited format
//               //         if (pageContent.contains("|")) {
//               //           final List<String> parts = pageContent.split('|');
//               //           for (String part in parts) {
//               //             if (part.trim().startsWith("encData=")) {
//               //               encData = part.trim().substring(8);
//               //               print("Found encData in pipe format: $encData");
//               //               break;
//               //             }
//               //           }
//               //         }
//               //       }

//               //       // If we still don't have encData, try JavaScript evaluation
//               //       if (encData == null) {
//               //         try {
//               //           final jsResult = await controller.evaluateJavascript(
//               //             source: """
//               //   (function() {
//               //     // Look for any element with encData text
//               //     const content = document.body.textContent;
//               //     const match = content.match(/encData=([^&|\\s]+)/);
//               //     return match ? match[1] : '';
//               //   })();
//               // """,
//               //           );

//               //           if (jsResult != null &&
//               //               jsResult.toString().isNotEmpty &&
//               //               jsResult != "null") {
//               //             encData = jsResult.toString();
//               //             print("Found encData using JavaScript: $encData");
//               //           }
//               //         } catch (jsError) {
//               //           print("JavaScript evaluation error: $jsError");
//               //         }
//               //       }

//               //       // Process transaction if encData was found
//               //       if (encData != null && encData.isNotEmpty) {
//               //         try {
//               //           // Decrypt the response data
//               //           final String decryptedData = await decrypt(encData);
//               //           print("Decrypted data: $decryptedData");

//               //           // Parse the JSON response
//               //           Map<String, dynamic> jsonInput =
//               //               jsonDecode(decryptedData);

//               //           // Validate signature
//               //           bool signatureValid =
//               //               await validateSignature(jsonInput, resHashKey);
//               //           print("Signature validation result: $signatureValid");

//               //           String transactionResult;
//               //           if (!signatureValid) {
//               //             transactionResult = "Signature Verification Failed";
//               //           } else {
//               //             // Check transaction status
//               //             final statusCode = jsonInput["payInstrument"]
//               //                 ?["responseDetails"]?["statusCode"];
//               //             print("Transaction status code: $statusCode");

//               //             if (statusCode == 'OTS0000') {
//               //               transactionResult = "Transaction Success";
//               //               ScaffoldMessenger.of(context).showSnackBar(
//               //                 SnackBar(
//               //                   content: Text("Transaction Successful!"),
//               //                   duration: Duration(seconds: 3),
//               //                   backgroundColor: Colors.green,
//               //                 ),
//               //               );
//               //             } else {
//               //               transactionResult = "Transaction Failed: $statusCode";
//               //             }
//               //           }

//               //           await callCaptureResponseApi(
//               //               status: transactionResult, responseData: jsonInput);
//               //           _closeWebView(context, transactionResult);
//               //         } catch (parseError) {
//               //           print("Error processing encData: $parseError");
//               //           await callCaptureResponseApi(
//               //               status:
//               //                   "Data Processing Error: ${parseError.toString()}",
//               //               responseData: null);
//               //           _closeWebView(context, "Processing Error");
//               //         }
//               //       } else {
//               //         print("No encData found in response");
//               //         await callCaptureResponseApi(
//               //             status: "No encData Found", responseData: null);
//               //         _closeWebView(context, "Response Format Error");
//               //       }
//               //     } catch (e) {
//               //       print("Exception during payment processing: $e");
//               //       await callCaptureResponseApi(
//               //           status: "Processing Exception: ${e.toString()}",
//               //           responseData: null);
//               //       _closeWebView(context, "Processing Exception");
//               //     }
//               //   },

//               onLoadError: (controller, url, code, message) {
//                 debugPrint("WebView Load Error: $url");
//                 debugPrint("Error Code: $code");
//                 debugPrint("Error Message: $message");
//                 _showErrorDialog("Failed to load payment page: $message");
//               },
//             ),

//             // InAppWebView(
//             //   initialData: InAppWebViewInitialData(
//             //     data: '''
//             //     <!DOCTYPE html>
//             //     <html>
//             //     <head>
//             //       <meta name="viewport" content="width=device-width, initial-scale=1.0">
//             //       <script src="https://psa.atomtech.in/staticdata/ots/js/atomcheckout.js"></script>

//             //     </head>
//             //     <body>
//             //     <script>
//             //         function initPayment() {
//             //           const options = {
//             // "atomTokenId": "${widget.atomTokenId}",
//             //             "merchId": "${widget.merchId}",
//             //             "custEmail": "${widget.custemail ?? ''}",
//             //             "custMobile": "${widget.custmobile ?? ''}",
//             //             "returnUrl": "${widget.returnurl}",
//             //             "userAgent": "mobile_webView"
//             //           };
//             //           new AtomPaynetz(options, 'production');
//             //         }
//             //         window.onload = initPayment;
//             //     </script>
//             //     </body>
//             //     </html>
//             //     ''',
//             //   ),
//             //   shouldOverrideUrlLoading: (controller, navigationAction) async {
//             //     var uri = navigationAction.request.url!;
//             //     debugPrint("Navigating to: ${uri.toString()}");

//             //     // Handle UPI Payments
//             //     if (["upi", "tez", "phonepe", "paytm"].contains(uri.scheme)) {
//             //       debugPrint("UPI URL detected: ${uri.toString()}");
//             //       try {
//             //         bool launched = await launchUrl(
//             //           uri,
//             //           mode: LaunchMode.externalApplication,
//             //         );
//             //         if (!launched) {
//             //           debugPrint("Could not launch UPI app");
//             //         }
//             //       } catch (e) {
//             //         debugPrint("Error launching UPI app: $e");
//             //       }
//             //       return NavigationActionPolicy.CANCEL;
//             //     }
//             //     return NavigationActionPolicy.ALLOW;
//             //   },
//             //   initialSettings: InAppWebViewSettings(
//             //     javaScriptEnabled: true,
//             //     javaScriptCanOpenWindowsAutomatically: true,
//             //   ),
//             //   onLoadStop: (controller, url) async {
//             //     print("onLoadStop: $url");
//             //     setState(() {
//             //       progress = 1.0;
//             //     });

//             //     if (url == null ||
//             //         !url.toString().contains("psa.atomtech.in/AtomInstaPay")) {
//             //       return;
//             //     }

//             //     print("AtomInstaPay URL detected: $url");

//             //     // For checkout-frame.jsp specifically
//             //     if (url.toString().contains("checkout-frame.jsp")) {
//             //       // No need to process this frame - it's just the initial checkout page
//             //       print(
//             //           "Initial checkout frame detected - waiting for transaction response");
//             //       return;
//             //     }

//             //     try {
//             //       // Check for response data in different possible elements
//             //       final Map<String, String> elementSelectors = {
//             //         "h5":
//             //             "document.getElementsByTagName('h5')[0]?.innerHTML || ''",
//             //         "div.response":
//             //             "document.querySelector('div.response')?.innerHTML || ''",
//             //         "body": "document.body.textContent || ''"
//             //       };

//             //       String response = "";
//             //       String sourceElement = "";

//             //       // Try each element selector until we find a response
//             //       for (var entry in elementSelectors.entries) {
//             //         final String elementContent =
//             //             await controller.evaluateJavascript(
//             //           source: entry.value,
//             //         );

//             //         if (elementContent.isNotEmpty &&
//             //             elementContent != "null" &&
//             //             elementContent != "undefined") {
//             //           response = elementContent.trim();
//             //           sourceElement = entry.key;
//             //           print("Found response in $sourceElement: $response");
//             //           break;
//             //         }
//             //       }

//             //       if (response.isEmpty) {
//             //         print("No response found in any elements");
//             //         await callCaptureResponseApi(
//             //             status: "No Response Data", responseData: null);
//             //         // _closeWebView(context, "No Response Data");
//             //         return;
//             //       }

//             //       // Handle transaction cancellation
//             //       if (response.contains("cancelTransaction")) {
//             //         print("Transaction was cancelled by user");
//             //         await callCaptureResponseApi(
//             //             status: "Transaction Cancelled", responseData: null);
//             //         _closeWebView(context, "Transaction Cancelled");
//             //         return;
//             //       }

//             //       // Process transaction response
//             //       Map<String, dynamic>? jsonInput;
//             //       String transactionResult = "";

//             //       try {
//             //         // Parse the response to extract the encrypted data
//             //         final List<String> split = response.split('|');
//             //         if (split.length <= 1) {
//             //           throw Exception(
//             //               "Invalid response format: missing pipe delimiter");
//             //         }

//             //         // Find the element containing "encData="
//             //         String? encDataEntry = split.firstWhere(
//             //             (element) => element.contains("encData="),
//             //             orElse: () => "");

//             //         if (encDataEntry.isEmpty) {
//             //           throw Exception("No encData found in response");
//             //         }

//             //         final List<String> encDataSplit = encDataEntry.split('=');
//             //         if (encDataSplit.length <= 1) {
//             //           throw Exception("Invalid encData format");
//             //         }

//             //         final String encData = encDataSplit[1];
//             //         print("Extracted encData: $encData");

//             //         // Decrypt the response data
//             //         final String decryptedData = await decrypt(encData);
//             //         print("Decrypted data: $decryptedData");

//             //         // Parse the JSON response
//             //         jsonInput = jsonDecode(decryptedData);

//             //         // Validate signature
//             //         bool signatureValid =
//             //             await validateSignature(jsonInput!, resHashKey);
//             //         print("Signature validation result: $signatureValid");

//             //         if (!signatureValid) {
//             //           transactionResult = "Signature Verification Failed";
//             //         } else {
//             //           // Check transaction status
//             //           final statusCode = jsonInput["payInstrument"]
//             //               ?["responseDetails"]?["statusCode"];
//             //           print("Transaction status code: $statusCode");

//             //           if (statusCode == 'OTS0000') {
//             //             transactionResult = "Transaction Success";
//             //             ScaffoldMessenger.of(context).showSnackBar(
//             //               SnackBar(
//             //                 content: Text("Transaction Successful!"),
//             //                 duration: Duration(seconds: 3),
//             //                 backgroundColor: Colors.green,
//             //               ),
//             //             );
//             //           } else {
//             //             transactionResult = "Transaction Failed: $statusCode";
//             //           }
//             //         }
//             //       } catch (parseError) {
//             //         print("Error processing response: $parseError");
//             //         transactionResult =
//             //             "Processing Error: ${parseError.toString()}";
//             //         jsonInput = null;
//             //       }

//             //       // Always call the API with the result and close the WebView
//             //       await callCaptureResponseApi(
//             //           status: transactionResult, responseData: jsonInput);
//             //       // _closeWebView(context, transactionResult);
//             //     } catch (e) {
//             //       print("Exception during payment processing: $e");
//             //       await callCaptureResponseApi(
//             //           status: "Processing Exception: ${e.toString()}",
//             //           responseData: null);
//             //       _closeWebView(context, "Processing Exception");
//             //     }
//             //   },

//             //   // onLoadStop: (controller, url) async {
//             //   //   print("onLoadStop");
//             //   //   print(url);
//             //   //   setState(() {
//             //   //     progress = 1.0;
//             //   //   });

//             //   //   if (url != null &&
//             //   //       url.toString().contains("psa.atomtech.in/AtomInstaPay")) {
//             //   //     print("AtomInstaPay URL detected");

//             //   //     try {
//             //   //       // First check if h5 element exists
//             //   //       final String elementExists =
//             //   //           await controller.evaluateJavascript(
//             //   //         source: "document.getElementsByTagName('h5').length > 0",
//             //   //       );

//             //   //       if (elementExists == "true") {
//             //   //         final String response =
//             //   //             await controller.evaluateJavascript(
//             //   //           source:
//             //   //               "document.getElementsByTagName('h5')[0].innerHTML",
//             //   //         );
//             //   //         debugPrint("HTML response : $response");

//             //   //         if (response.trim().isEmpty) {
//             //   //           debugPrint("Empty response from h5 element");
//             //   //           var transactionResult = "Response Format Error";
//             //   //           await callCaptureResponseApi(
//             //   //               status: transactionResult, responseData: null);
//             //   //           _closeWebView(context, transactionResult);
//             //   //           return;
//             //   //         }

//             //   //         var transactionResult = "";
//             //   //         Map<String, dynamic>? jsonInput;

//             //   //         if (response.trim().contains("cancelTransaction")) {
//             //   //           transactionResult = "Transaction Cancelled!";
//             //   //           await callCaptureResponseApi(
//             //   //               status: transactionResult, responseData: jsonInput);
//             //   //           _closeWebView(context, transactionResult);
//             //   //         } else {
//             //   //           try {
//             //   //             final split = response.trim().split('|');
//             //   //             final Map<int, String> values = {
//             //   //               for (int i = 0; i < split.length; i++) i: split[i]
//             //   //             };

//             //   //             if (split.length > 1 &&
//             //   //                 values.containsKey(1) &&
//             //   //                 values[1] != null) {
//             //   //               final splitTwo = values[1]!.split('=');

//             //   //               if (splitTwo.length > 1) {
//             //   //                 debugPrint("encData value: ${splitTwo[1]}");

//             //   //                 final decryptedResponseData =
//             //   //                     await decrypt(splitTwo[1].toString());
//             //   //                 debugPrint(
//             //   //                     'Decrypted response data: $decryptedResponseData');

//             //   //                 jsonInput = jsonDecode(decryptedResponseData);
//             //   //                 debugPrint("Reading full response: $jsonInput");

//             //   //                 var checkFinalTransaction =
//             //   //                     await validateSignature(
//             //   //                         jsonInput!, resHashKey);
//             //   //                 debugPrint(
//             //   //                     "Signature matched: $checkFinalTransaction");

//             //   //                 if (checkFinalTransaction) {
//             //   //                   if (jsonInput["payInstrument"]
//             //   //                           ["responseDetails"]["statusCode"] ==
//             //   //                       'OTS0000') {
//             //   //                     debugPrint("Transaction success and close");
//             //   //                     transactionResult = "Transaction Success";
//             //   //                     ScaffoldMessenger.of(context).showSnackBar(
//             //   //                       SnackBar(
//             //   //                         content: Text("Transaction Successful!"),
//             //   //                         duration: Duration(seconds: 3),
//             //   //                         backgroundColor: Colors.green,
//             //   //                       ),
//             //   //                     );
//             //   //                   } else {
//             //   //                     debugPrint("Transaction failed");
//             //   //                     transactionResult = "Transaction Failed";
//             //   //                   }
//             //   //                 } else {
//             //   //                   debugPrint("Signature mismatched");
//             //   //                   transactionResult = "Signature Failed";
//             //   //                 }
//             //   //               } else {
//             //   //                 debugPrint("Invalid split format for encData");
//             //   //                 transactionResult = "Response Format Error";
//             //   //               }
//             //   //             } else {
//             //   //               debugPrint(
//             //   //                   "Invalid response format, missing pipe delimiter or values");
//             //   //               transactionResult = "Response Format Error";
//             //   //             }
//             //   //           } catch (e) {
//             //   //             debugPrint("Error processing response: $e");
//             //   //             transactionResult = "Processing Error";
//             //   //           }

//             //   //           await callCaptureResponseApi(
//             //   //               status: transactionResult, responseData: jsonInput);
//             //   //           _closeWebView(context, transactionResult);
//             //   //         }
//             //   //       } else {
//             //   //         // Try alternative approach - maybe the response is in a different element
//             //   //         debugPrint(
//             //   //             "No h5 element found, checking for response in other elements");

//             //   //         // You could try to find the response in other elements or check the page URL parameters
//             //   //         // For example, checking if there's any div with response data
//             //   //         final String divResponse =
//             //   //             await controller.evaluateJavascript(
//             //   //           source: "document.body.textContent",
//             //   //         );

//             //   //         debugPrint("Page content: $divResponse");

//             //   //         var transactionResult = "Element Not Found";
//             //   //         await callCaptureResponseApi(
//             //   //             status: transactionResult, responseData: null);
//             //   //         _closeWebView(context, transactionResult);
//             //   //       }
//             //   //     } catch (e) {
//             //   //       debugPrint("Exception in payment processing: $e");
//             //   //       var transactionResult = "Processing Exception";
//             //   //       await callCaptureResponseApi(
//             //   //           status: transactionResult, responseData: null);
//             //   //       _closeWebView(context, transactionResult);
//             //   //     }
//             //   //   }
//             //   // },

//             //   onLoadError: (controller, url, code, message) {
//             //     debugPrint("WebView Load Error: $url");
//             //     debugPrint("Error Code: $code");
//             //     debugPrint("Error Message: $message");
//             //     _showErrorDialog("Failed to load payment page: $message");
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Advanced response extraction method
//   Future<String?> _extractPageResponse(
//       InAppWebViewController controller) async {
//     try {
//       // Try multiple JavaScript methods to extract response
//       final extractionMethods = [
//         "document.body.innerText",
//         "document.documentElement.textContent",
//         "document.body.textContent",
//         "document.body.innerHTML"
//       ];

//       for (var method in extractionMethods) {
//         final response = await controller.evaluateJavascript(
//           source: """
//             (function() {
//               try {
//                 return $method || 'No content found';
//               } catch (error) {
//                 return 'Error: ' + error.toString();
//               }
//             })();
//           """,
//         );

//         if (response != null && response.toString().isNotEmpty) {
//           debugPrint("Response extracted using $method: $response");
//           return response.toString();
//         }
//       }

//       return null;
//     } catch (e) {
//       debugPrint("Comprehensive extraction error: $e");
//       return null;
//     }
//   }

//   // Close WebView
//   void _closeWebView(BuildContext context, String transactionResult) {
//     debugPrint("Closing web with result: $transactionResult");
//     if (!mounted) return;
//     Navigator.of(context).pop(transactionResult);
//   }

//   Future<void> callCaptureResponseApi2({
//     required String status,
//     String? encData,
//   }) async {
//     final uri = Uri.parse(
//         "https://stmarysschool.lumensof.in/api/Paymet/api/payment/capture-response");

//     var request = http.MultipartRequest('POST', uri);
//     request.fields['status'] = status;
//     request.fields['encData'] = encData!; // Add the encData parameter

//     try {
//       final response = await request.send();
//       final responseBody = await response.stream.bytesToString();

//       // Handle success and failure cases
//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         // Success case
//         debugPrint("Capture Response API Success (${response.statusCode})");
//         debugPrint("Response Body: $responseBody");
//         return; // Success with void return
//       } else {
//         // Failure case - server responded but with an error code
//         debugPrint("API Error: Failed with status code ${response.statusCode}");
//         debugPrint("Error Response: $responseBody");
//         throw Exception(
//             "API failed with status ${response.statusCode}: $responseBody");
//       }
//     } catch (e) {
//       // Exception handling (network errors, etc.)
//       debugPrint("Error calling Capture Response API: $e");
//       throw Exception("Failed to communicate with server: $e");
//     }
//   }

//   Future<void> callCaptureResponseApi(
//       {required String status, Map<String, dynamic>? responseData}) async {
//     final uri = Uri.parse(
//         "https://stmarysschool.lumensof.in/api/Paymet/api/payment/capture-response");

//     var request = http.MultipartRequest('POST', uri);
//     request.fields['status'] = status;

//     // Handle nested JSON structure properly
//     if (responseData != null) {
//       // For top-level fields
//       responseData.forEach((key, value) {
//         if (value != null) {
//           if (value is Map || value is List) {
//             // Convert complex objects to JSON string
//             request.fields[key] = jsonEncode(value);
//           } else {
//             request.fields[key] = value.toString();
//           }
//         }
//       });

//       // Add important transaction details as individual fields for easier access
//       if (responseData["payInstrument"] != null &&
//           responseData["payInstrument"]["responseDetails"] != null) {
//         var details = responseData["payInstrument"]["responseDetails"];

//         // Add specific fields that are most important
//         if (details["statusCode"] != null) {
//           request.fields['statusCode'] = details["statusCode"].toString();
//         }

//         if (details["statusMessage"] != null) {
//           request.fields['statusMessage'] = details["statusMessage"].toString();
//         }

//         if (responseData["payInstrument"]["responseDetails"]["pgTxnId"] !=
//             null) {
//           request.fields['transactionId'] = responseData["payInstrument"]
//                   ["responseDetails"]["pgTxnId"]
//               .toString();
//         }

//         if (responseData["merchantTxnId"] != null) {
//           request.fields['merchantTxnId'] =
//               responseData["merchantTxnId"].toString();
//         }

//         if (responseData["atomTxnId"] != null) {
//           request.fields['atomTxnId'] = responseData["atomTxnId"].toString();
//         }
//       }

//       // Also include the raw data for complete record
//       request.fields['rawResponseData'] = jsonEncode(responseData);
//     }

//     try {
//       final response = await request.send();
//       final responseBody = await response.stream.bytesToString();
//       debugPrint("Capture Response API Status: ${response.statusCode}");
//       debugPrint("Capture Response API Body: $responseBody");

//       if (response.statusCode >= 400) {
//         debugPrint(
//             "API Error: Failed to capture response. Status: ${response.statusCode}");
//       }
//     } catch (e) {
//       debugPrint("Error calling Capture Response API: $e");
//     }
//   }
//   // Future<void> callCaptureResponseApi(
//   //     {required String status, Map<String, dynamic>? responseData}) async {
//   //   final uri = Uri.parse(
//   //       "https://stmarysschool.lumensof.in/api/Paymet/api/payment/capture-response");

//   //   var request = http.MultipartRequest('POST', uri);
//   //   request.fields['status'] = status;

//   //   if (responseData != null) {
//   //     responseData.forEach((key, value) {
//   //       request.fields[key] = value.toString(); // Convert all values to String
//   //     });
//   //   }

//   //   try {
//   //     final response = await request.send();
//   //     final responseBody = await response.stream.bytesToString();
//   //     debugPrint("Capture Response API Status: ${response.statusCode}");
//   //     debugPrint("Capture Response API Body: $responseBody");
//   //   } catch (e) {
//   //     debugPrint("Error calling Capture Response API: $e");
//   //   }
//   // }

//   // Future<void> callCaptureResponseApi(
//   //     {required String status, Map<String, dynamic>? responseData}) async {
//   //   final uri = Uri.parse(
//   //       "https://stmarysschool.lumensof.in/api/Paymet/api/payment/capture-response");
//   //   final headers = {"Content-Type": "application/json"};
//   //   final body = jsonEncode({"status": status, "responseData": responseData});

//   //   try {
//   //     final response = await http.post(uri, headers: headers, body: body);
//   //     debugPrint("Capture Response API Status: ${response.statusCode}");
//   //     debugPrint("Capture Response API Body: ${response.body}");
//   //   } catch (e) {
//   //     debugPrint("Error calling Capture Response API: $e");
//   //   }
//   // }

//   // Future<void> callCaptureResponseApi({
//   //   required String status,
//   //   Map<String, dynamic>? responseData,
//   //   String? customKey,
//   // }) async {
//   //   try {
//   //     final url = Uri.parse(
//   //         'https://stmaryswilliamnagarapi.lumensof.in/api/Paymet/api/payment/capture-response');

//   //     // Prepare the request body to match the expected format
//   //     String valueString = '';

//   //     if (responseData != null) {
//   //       // Extract relevant details from the response
//   //       String statusCode = responseData["payInstrument"]?["responseDetails"]
//   //               ?["statusCode"] ??
//   //           '';
//   //       String instrumentType =
//   //           responseData["payInstrument"]?["instrumentType"] ?? '';
//   //       String pgTxnId = responseData["payInstrument"]?["pgTxnId"] ?? '';

//   //       // Construct the value string with all available details
//   //       valueString = [
//   //         status,
//   //         widget.currentTxnId,
//   //         DateTime.now().toIso8601String(),
//   //         statusCode,
//   //         instrumentType,
//   //         pgTxnId
//   //       ].join('|');
//   //     } else {
//   //       // Minimal value string if no response data
//   //       valueString = [
//   //         status,
//   //         widget.currentTxnId,
//   //         DateTime.now().toIso8601String()
//   //       ].join('|');
//   //     }

//   //     final requestBody = {
//   //       "key": customKey ?? widget.currentTxnId,
//   //       "value": [valueString]
//   //     };

//   //     debugPrint('Capture Response Request Body: ${jsonEncode(requestBody)}');

//   //     final response = await http.post(
//   //       url,
//   //       headers: {
//   //         'Content-Type': 'application/json',
//   //         'Accept': 'application/json',
//   //       },
//   //       body: jsonEncode(requestBody),
//   //     );

//   //     // Logging
//   //     debugPrint('Capture Response API Call');
//   //     debugPrint('URL: ${url.toString()}');
//   //     debugPrint('Status: $status');
//   //     debugPrint('Response Status Code: ${response.statusCode}');
//   //     debugPrint('Response Body: ${response.body}');

//   //     // Throw an exception for non-200 status codes
//   //     if (response.statusCode != 200) {
//   //       throw HttpException(
//   //         'Failed to capture payment response. Status code: ${response.statusCode}, Body: ${response.body}',
//   //         uri: url,
//   //       );
//   //     }
//   //   } catch (e) {
//   //     debugPrint('Error calling capture response API: $e');

//   //     // More specific error handling
//   //     if (e is SocketException) {
//   //       debugPrint('Network error: ${e.message}');
//   //     } else if (e is HttpException) {
//   //       debugPrint('HTTP error: ${e.message}');
//   //     } else if (e is FormatException) {
//   //       debugPrint('Format error: ${e.message}');
//   //     }

//   //     rethrow;
//   //   }
//   // }

//   // Handle back button press
//   Future<bool> _handleBackButtonAction(BuildContext context) async {
//     debugPrint("_handleBackButtonAction called");

//     // Prevent back action if payment is in progress
//     if (_isPaymentProcessed) {
//       return false;
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Do you want to exit the payment?'),
//         actions: <Widget>[
//           ElevatedButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('No'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               // Call capture response API for cancelled transaction
//               await _callCaptureResponseApi("Transaction Cancelled");

//               Navigator.pop(context);
//               Navigator.of(context).pop();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                     content:
//                         Text("Transaction Status = Transaction cancelled")),
//               );
//             },
//             child: const Text('Yes'),
//           ),
//         ],
//       ),
//     );
//     return Future.value(true);
//   }
// }
