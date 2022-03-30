import 'package:flutter/material.dart';
import 'package:lifetap_assignment/bloc/lifetap_bloc.dart';
import 'package:lifetap_assignment/foundation/theme.dart';
import 'package:lifetap_assignment/view/pages/country_picker/country_picker_page.dart';
import 'package:lifetap_assignment/foundation/di_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lifetapTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => locator<CountryPickerCubit>(),
                ),
                BlocProvider(
                  create: (context) => locator<SelectedCountryCubit>(),
                ),
              ],
              child: const CountryPickerPage(),
            )
      },
    );
  }
}
