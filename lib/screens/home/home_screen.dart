import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/app_header.dart';
import 'package:flutter_assignment/widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppHeader(),
        Expanded(
          child: EmptyState(
            title: 'Home',
            message: 'Find venues for your next event.',
          ),
        ),
      ],
    );
  }
}
