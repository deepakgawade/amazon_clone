import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => UserProvider()))
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => generateRoute(settings),
        title: 'Amazon Clone',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.greyBackgroundCOlor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 22, color: Colors.black),
            labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == 'user'
                ? const BottomBar()
                : const AdminScreen()
            : const AuthScreen(),
      );
    });
  }
}
