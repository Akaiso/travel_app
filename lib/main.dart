import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/model/provider.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
      options: FirebaseOptions(
    //WHICH EVER FORMAT IS FINE:
    apiKey: dotenv.get("API_KEY"), //"${dotenv..env["API_KEY"]}",
    appId: dotenv.get("APP_ID"), //"${dotenv.env["APP_ID"]}",
    messagingSenderId: dotenv
        .get("MESSAGING_SENDER_ID"), //"${dotenv.env["MESSAGING_SENDER_ID"]}",
    projectId: dotenv.get("PROJECT_ID"), //"${dotenv.env["PROJECT_ID"]}"
  ));
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatListProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ChangeOriginProvider()),
        ChangeNotifierProvider(create: (context) => DioSearchListProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trips Guard',
        theme: ThemeData(
          scaffoldBackgroundColor: kScaffoldBg(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const HomePage(),
        initialRoute: "/",
        // routes: {"/": (context)=> const HomePage()},
      ),
    );
  }
}
