import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/core/network/di/module.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/network/di/middle_ware/http_override.dart';
import 'domain/locals/prefs_service.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await PrefsService.init();
  configureDependencies();
  await Supabase.initialize(
    url: 'https://zvkmrsfxzkwlhaejiysh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp2a21yc2Z4emt3bGhhZWppeXNoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg2ODMxMDMsImV4cCI6MjA1NDI1OTEwM30.b6JNmekQwk3ZMrcul6ClGzkI9-Hc3IvgP_-dFN0vHCY',
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}
