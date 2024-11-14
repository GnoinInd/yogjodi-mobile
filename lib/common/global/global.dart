import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

SharedPreferences? sharedPreferences;
late IO.Socket socket;
late String token;
late String userId;
const String apiBaseUrl = "https://rest-apis-chat-app.onrender.com";
// const String apiBaseUrl =
//     "https://5aee-2401-4900-1ca9-c69d-dcff-613a-8dbe-c40e.ngrok-free.app";

/// One Signal
const String oneSignalAppId = "a1583783-9e3f-4045-9953-2cc1b9e1ee24";
String deviceId = "";