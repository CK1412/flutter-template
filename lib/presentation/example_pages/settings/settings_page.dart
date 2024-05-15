import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../shared/resources/resources.dart';
import '../../common_widgets/app_bar/common_app_bar.dart';
import '../../common_widgets/common_scaffold.dart';
import 'widgets/language_settings.dart';
import 'widgets/theme_mode_settings.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: L.current.lbl_settings,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              L.current.lbl_theme,
              style: AppTextStyles.robotoRegular16,
            ),
          ),
          const ThemeModeSettings(),
          Container(
            height: 10,
            color: context.colors.surfaceVariant,
          ),
          const LanguageSettings(),
        ],
      ),
    );
  }
}
