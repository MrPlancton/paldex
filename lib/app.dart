import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:paldex/configs/constants.dart';
import 'package:paldex/configs/theme.dart';
import 'package:paldex/routes.dart';
import 'package:paldex/states/theme/theme_cubit.dart';

class PaldexApp extends StatelessWidget {
  const PaldexApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return FlutterWebFrame(
      maximumSize: const Size.fromWidth(600),
      backgroundColor: isDark ? Colors.black12 : Colors.grey[200],
      enabled: kIsWeb || !Platform.isAndroid && !Platform.isIOS,
      builder: (context) {
        return MaterialApp(
          color: Colors.white,
          title: 'Paldex',
          theme: isDark ? Themings.darkTheme : Themings.lightTheme,
          navigatorKey: AppNavigator.navigatorKey,
          onGenerateRoute: AppNavigator.onGenerateRoute,
          builder: (context, child) {
            if (child == null) return const SizedBox.shrink();

            final data = MediaQuery.of(context);
            final smallestSize = min(data.size.width, data.size.height);
            final textScaleFactor = min(smallestSize / AppConstants.designScreenSize.width, 1.0);

            return MediaQuery(
              data: data.copyWith(
                textScaler: TextScaler.linear(textScaleFactor),
              ),
              child: child,
            );
          },
        );
      },
    );
  }
}
