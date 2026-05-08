import 'package:flutter/material.dart';

import '../../../core/widgets/app_background.dart';

import '../widgets/announcement/announcement_card.dart';
import '../widgets/floors/floors_stack.dart';
import '../widgets/home_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HomeHeader(),
              ),

               AnnouncementCard(),

              const SizedBox(height: 30),

              const Expanded(
                child: FloorsStack(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}