import 'package:flutter/material.dart';
import '../../../atomic_design/protons/colors.dart';
import 'user_data_pill_widget.dart';

class AppScaffoldWrapper extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool showUserPill;

  const AppScaffoldWrapper({
    super.key,
    required this.child,
    this.appBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.showUserPill = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.backgroundPrimary,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          child,
          if (showUserPill) const UserDataPill(),
        ],
      ),
    );
  }
}
