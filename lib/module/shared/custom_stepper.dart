import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final List<StepperStep> steps;

  const CustomStepper({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 7.5,
                    backgroundColor: const Color(0xff42BFEC),
                    child: steps[index].icon != null
                        ? Icon(steps[index].icon, color: Colors.white, size: 16)
                        : null,
                  ),
                  if (index != steps.length - 1)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: const Color(0xff42BFEC),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (steps[index].title != null) ...[
                      steps[index].title!,
                      const SizedBox(height: 8.0),
                    ],
                    steps[index].content,
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class StepperStep {
  final Widget? title;
  final IconData? icon;
  final Widget content;

  StepperStep({this.title, this.icon, required this.content});
}
