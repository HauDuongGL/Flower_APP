import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/init_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'handle_app.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  Gemini.init(apiKey: "AIzaSyCAOwRF-OCEmsVfZ8d5vi644l4pjxsfXP8");
  await initApp();
  runApp(startApp());
}
