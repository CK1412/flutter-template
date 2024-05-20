import 'package:flutter/material.dart';

import '../../../shared/utils/platform_utils.dart';

class LoadingVisible extends StatelessWidget {
  const LoadingVisible({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: PopScope(
        onPopInvoked: PlatformUtils.isIOSDevice && !isLoading
            ? null
            : (didPop) => Future.value(!isLoading),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: Colors.black12,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
