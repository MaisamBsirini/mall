import 'package:flutter/material.dart';

import '../../../design_system/scope/design_system_scope.dart';
import '../booking_prototype_flow.dart';
import '../booking_tokens.dart';

/// Prototype D — one expandable panel at a time; order is fixed 1→4.
class AccordionStepFlowStyle extends StatefulWidget {
  const AccordionStepFlowStyle({super.key});

  @override
  State<AccordionStepFlowStyle> createState() => _AccordionStepFlowStyleState();
}

class _AccordionStepFlowStyleState extends State<AccordionStepFlowStyle> {
  static const _steps = [
    BookingFlowStep.service,
    BookingFlowStep.staff,
    BookingFlowStep.date,
    BookingFlowStep.time,
  ];

  int _expandedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: BookingTokens.textLine(
            context,
            widthFactor: 0.28,
            heightFactor: 0.009,
          ),
        ),
        BookingPrototypeFlow.prototypeBanner(context),
        SizedBox(height: BookingTokens.gapSm(context)),
        Padding(
          padding: BookingTokens.sectionPadding(context),
          child: Column(
            children: [
              for (var i = 0; i < _steps.length; i++)
                _AccordionPanel(
                  step: _steps[i],
                  index: i,
                  expanded: _expandedIndex == i,
                  isLast: i == _steps.length - 1,
                  onTap: () => setState(() => _expandedIndex = i),
                  child: _panelContent(context, _steps[i]),
                ),
              SizedBox(height: BookingTokens.gapSm(context)),
              BookingPrototypeFlow.confirmBlock(context, showSummary: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _panelContent(BuildContext context, BookingFlowStep step) {
    return switch (step) {
      BookingFlowStep.service => BookingPrototypeFlow.servicePicker(context),
      BookingFlowStep.staff => BookingPrototypeFlow.staffPicker(context),
      BookingFlowStep.date => BookingPrototypeFlow.dateChips(context, compact: true),
      BookingFlowStep.time => BookingPrototypeFlow.timeSlots(context, columns: 3),
      BookingFlowStep.confirm => const SizedBox.shrink(),
    };
  }
}

class _AccordionPanel extends StatelessWidget {
  final BookingFlowStep step;
  final int index;
  final bool expanded;
  final bool isLast;
  final VoidCallback onTap;
  final Widget child;

  const _AccordionPanel({
    required this.step,
    required this.index,
    required this.expanded,
    required this.isLast,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : BookingTokens.gapSm(context)),
      child: Material(
        color: BookingTokens.surface(context),
        borderRadius: BookingTokens.borderMd(context),
        child: InkWell(
          onTap: onTap,
          borderRadius: BookingTokens.borderMd(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BookingTokens.borderMd(context),
              border: Border.all(
                color: expanded ? palette.primary : palette.border,
                width: expanded ? 1.5 : 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: BookingTokens.gapMd(context),
                    vertical: BookingTokens.gapSm(context),
                  ),
                  child: Row(
                    children: [
                      BookingPrototypeFlow.stepBadge(
                        context,
                        step: index + 1,
                        active: expanded,
                        completed: index < 3 && !expanded,
                      ),
                      SizedBox(width: BookingTokens.gapSm(context)),
                      Expanded(
                        child: Text(
                          step.label,
                          style: context.ds.typography.subtitle(context).copyWith(
                                fontSize: 13,
                              ),
                        ),
                      ),
                      Icon(
                        expanded ? Icons.expand_less : Icons.expand_more,
                        size: 20,
                        color: palette.textSecondary,
                      ),
                    ],
                  ),
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: EdgeInsets.fromLTRB(
                      BookingTokens.gapMd(context),
                      0,
                      BookingTokens.gapMd(context),
                      BookingTokens.gapMd(context),
                    ),
                    child: child,
                  ),
                  crossFadeState: expanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
