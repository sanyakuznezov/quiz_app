import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/main_screen.dart';
import 'package:quiz_app/presentation/quiz_screen.dart';
import 'package:quiz_app/presentation/splash_screen.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:quiz_app/locator.dart' as di;
import 'app_bloc/app_bloc.dart';
import 'resources/app_theme.dart';

void main() {
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider<AppBloc>(create: (_)=>AppBloc()),
    ],
    child:MaterialApp(
      theme: AppTheme.lightTheme,
      builder: (context,child)=>ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          backgroundColor: Colors.white54
      ),
      home: const QuizApp(),
    ));
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);



  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppBloc,AppState>(

        builder: (context,appState) {
          if(appState.qStatus==QuizStatus.loading){
            return const SplashScreen();
          }

          return const MainScreen();

        }
    );
  }


  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().add(InitApp());
  }
}
