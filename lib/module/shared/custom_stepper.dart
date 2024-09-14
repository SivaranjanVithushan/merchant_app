import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final List<Steps> steps;

  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: _StepConnectorPainter(
            stepCount: steps.length,
            stepHeight: _calculateStepHeight(context),
          ),
          size: Size.infinite,
        ),
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildStep(context, index);
                },
                childCount: steps.length,
              ),
            ),
          ],
        ),
      ],
    );
  }

  double _calculateStepHeight(BuildContext context) {
    // Estimate the height for each step based on its content.
    // For accurate height, you might want to calculate this based on real content or constraints.
    return MediaQuery.of(context).size.height / steps.length;
  }

  Widget _buildStep(BuildContext context, int index) {
    final step = steps[index];
    final isActive = index == currentStep;
    final isCompleted = index < currentStep;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStepIcon(isActive, isCompleted),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                step.title,
                const SizedBox(height: 8.0),
                step.content,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIcon(bool isActive, bool isCompleted) {
    return SizedBox(
      width: 30.0, // Set a fixed width for the icon container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 7.5,
            backgroundColor: isCompleted ? Colors.blue : Colors.grey,
            child: Text(
              isCompleted ? '✓' : (isActive ? '→' : '•'),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepConnectorPainter extends CustomPainter {
  final int stepCount;
  final double stepHeight;

  _StepConnectorPainter({
    required this.stepCount,
    required this.stepHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0;

    for (int i = 0; i < stepCount - 1; i++) {
      final yStart = (i + 1) * stepHeight;
      final yEnd = (i + 2) * stepHeight;

      canvas.drawLine(
        Offset(size.width / 2 - 1, yStart),
        Offset(size.width / 2 - 1, yEnd),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Steps {
  final Widget title;
  final Widget content;

  Steps({required this.title, required this.content});
}
