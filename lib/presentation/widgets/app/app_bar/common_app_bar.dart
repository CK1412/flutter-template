import 'package:flutter/material.dart';

import '../../../../app/navigation/app_navigator.dart';
import '../../../../app/resources/constants.dart';
import '../../../../app/resources/resources.dart';
import '../../../../gen/assets.gen.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.toolbarHeight,
    this.leading,
    this.leadingIcon = AppBarLeadingIcon.back,
    this.onLeadingTap,
    this.backgroundColor,
    this.foregroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.bottom,
    this.elevation = 1,
    this.scrolledUnderElevation = 1,
    this.actions,
    this.centerTitle,
    this.titleWidget,
    this.titleType = AppBarTitle.text,
    this.onTitleTap,
    this.title,
    this.titleLogo,
    this.titleStyle,
    this.leadingWidth,
    this.bottomOpacity = 1,
    this.flexibleSpace,
  });

  final double? toolbarHeight;
  final double bottomOpacity;

  final Color? surfaceTintColor;
  final Color? backgroundColor;
  final Color? foregroundColor;

  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;

  final Widget? leading;
  final AppBarLeadingIcon leadingIcon;
  final VoidCallback? onLeadingTap;
  final double? leadingWidth;

  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Widget? flexibleSpace;

  final Widget? titleWidget;
  final bool? centerTitle;
  final AppBarTitle titleType;
  final VoidCallback? onTitleTap;
  final String? title;
  final Widget? titleLogo;
  final TextStyle? titleStyle;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _buildLeading(),
      backgroundColor: backgroundColor ?? context.colors.background,
      surfaceTintColor: surfaceTintColor ?? context.colors.background,
      foregroundColor: foregroundColor ?? context.colors.onBackground,
      bottom: bottom,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor ?? context.colors.shadow,
      actions: actions,
      centerTitle: centerTitle,
      title: _buildTitle(),
      leadingWidth: leadingWidth,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      flexibleSpace: flexibleSpace,
    );
  }

  Widget? _buildLeading() {
    if (leading != null) {
      return leading;
    }

    final Widget? icon = switch (leadingIcon) {
      AppBarLeadingIcon.back => const Icon(Icons.arrow_back_ios_new_rounded),
      AppBarLeadingIcon.close => const Icon(Icons.close_rounded),
      AppBarLeadingIcon.none => null,
    };

    if (icon == null) {
      return null;
    }

    return GestureDetector(
      onTap: onLeadingTap ?? () => AppNavigator.pop(),
      child: icon,
    );
  }

  Widget? _buildTitle() {
    if (titleWidget != null) {
      return titleWidget;
    }

    final Widget? appBarTitle = switch (titleType) {
      AppBarTitle.text => Text(
          title ?? '',
          style: titleStyle ??
              AppTextStyles.robotoRegular16.copyWith(color: foregroundColor),
        ),
      AppBarTitle.logo => titleLogo ??
          Assets.icons.appLogo.image(height: Constants.defaultIconSize),
      AppBarTitle.none => null,
    };

    if (appBarTitle == null) {
      return null;
    }

    return GestureDetector(
      onTap: onTitleTap,
      behavior: HitTestBehavior.opaque,
      child: appBarTitle,
    );
  }
}

enum AppBarLeadingIcon {
  back,
  close,
  none,
}

enum AppBarTitle {
  text,
  logo,
  none,
}
