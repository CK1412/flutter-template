import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../app/bloc/app/app_bloc.dart';
import '../../../../app/navigation/app_navigator.dart';
import '../../../../l10n/generated/l10n.dart';
import '../../../../shared/constants/locales.dart';
import '../../../../shared/resources/resources.dart';

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(L.current.lbl_language_settings),
      leading: const Icon(Icons.language),
      onTap: () {
        _chooseLanguage(context);
      },
    );
  }

  Future<void> _chooseLanguage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height / 2,
        minHeight: 0,
      ),
      builder: (ctx) {
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Gap(12),
                    Text(
                      L.current.lbl_language_settings,
                      style: AppTextStyles.robotoMedium14.copyWith(
                        color: context.colors.onBackground,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        AppNavigator.pop();
                      },
                      child: Text(L.current.lbl_close),
                    ),
                  ],
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final locale in L.delegate.supportedLocales)
                          RadioListTile<Locale>(
                            value: locale,
                            groupValue: state.locale,
                            onChanged: (value) {
                              if (value != null) {
                                context
                                    .read<AppBloc>()
                                    .add(LocaleUpdated(value));
                              }
                            },
                            title: Text(
                              Locales.languageName(locale.languageCode),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
