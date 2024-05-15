import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/bloc/app/app_bloc.dart';
import '../../../../l10n/generated/l10n.dart';

class ThemeModeSettings extends StatelessWidget {
  const ThemeModeSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (final themeMode in ThemeMode.values)
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Radio<ThemeMode>(
                    value: themeMode,
                    groupValue: state.themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<AppBloc>().add(ThemeModeUpdated(value));
                      }
                    },
                  ),
                  Text(getThemeModeName(themeMode)),
                ],
              ),
          ],
        );
      },
    );
  }

  String getThemeModeName(ThemeMode themeMode) {
    return switch (themeMode) {
      ThemeMode.dark => L.current.lbl_dark_theme_message,
      ThemeMode.light => L.current.lbl_light_theme_message,
      ThemeMode.system => L.current.lbl_system_theme_message,
    };
  }
}
