import 'dart:io';

import 'package:flutter/material.dart';

class LoadingVisible extends StatelessWidget {
  const LoadingVisible({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: WillPopScope(
        onWillPop: Platform.isIOS && !isLoading
            ? null
            : () => Future.value(!isLoading),
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
