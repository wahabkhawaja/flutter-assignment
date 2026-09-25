import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/app_header.dart';
import 'package:flutter_assignment/widgets/empty_state.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppHeader(),
        Expanded(
          child: EmptyState(
            title: 'Explore',
            message: 'Browse spaces, vendors, and ideas.',
          ),
        ),
      ],
    );
  }
}
