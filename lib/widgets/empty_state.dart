import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_spacing.dart';
import 'package:flutter_assignment/utils/app_text_styles.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: Column(
        children: [
          const Spacer(),
          Text(title, textAlign: TextAlign.center, style: emptyTitleStyle()),
          padding8,
          Text(message, textAlign: TextAlign.center, style: emptyMessageStyle()),
          const Spacer(),
        ],
      ),
    );
  }
}
