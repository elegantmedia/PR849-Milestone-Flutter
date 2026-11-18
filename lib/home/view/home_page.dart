import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:milestone/app/app.dart';
//import 'package:milestone/app/controller/controller.dart';
import 'package:milestone/home/widgets/widgets.dart';
import 'package:milestone/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    log('HomePage initialized', name: 'HomePage');
    super.initState();
  }

  @override
  void dispose() {
    log('HomePage disposed', name: 'HomePage');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.home, style: context.headline1()),
              const SizedBox(height: 40),
              Text(
                l10n.homeWelcomeBack,
                style: context.headline3(color: colors.secondary),
              ),
              const SizedBox(height: 12),
              Text(l10n.homeGreeting, style: context.headline1()),
              const SizedBox(height: 4),
              Text(
                l10n.homeRecoveryJourney,
                style: context.bodyLarge(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              ProgressCard(
                hasActiveProgram: false,
                title: l10n.homeResumeProgress,
                injury: l10n.homeInjuryName,
                progressLabel: l10n.homeProgressCompleted,
                phase: l10n.homePhase,
                nextSession: l10n.homeNextSession,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  ActionCard(
                    icon: Icons.medical_services,
                    color: Colors.amber,
                    label: l10n.homeDiagnoseInjury,
                    onTap: () {
                      Pages.diagnoseMyInjury.go(context);
                    },
                  ),
                  const SizedBox(width: 10),
                  ActionCard(
                    icon: Icons.menu_book_outlined,
                    color: colors.secondary,
                    label: l10n.homeAllPrograms,
                  ),
                  const SizedBox(width: 10),
                  ActionCard(
                    icon: Icons.chat_outlined,
                    color: Colors.greenAccent,
                    label: l10n.homeChatExperts,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
