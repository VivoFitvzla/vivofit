import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDTXhSje_mzws0742myIfywZNrbas2sM0M",
            authDomain: "vivofit-7cb9d.firebaseapp.com",
            projectId: "vivofit-7cb9d",
            storageBucket: "vivofit-7cb9d.firebasestorage.app",
            messagingSenderId: "765513878752",
            appId: "1:765513878752:web:4e6e69938f567cf0b91485",
            measurementId: "G-2BKG3NY7JB"));
  } else {
    await Firebase.initializeApp();
  }
}
