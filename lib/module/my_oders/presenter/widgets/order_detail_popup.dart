import 'package:flutter/material.dart';

class OrderDetailsPopup extends StatelessWidget {
  const OrderDetailsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Text(
              'View Order Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: CustomStepper(
                  steps: [
                    StepperStep(
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icons/invoice.png',
                            width: 68,
                            height: 68,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xffF8FAFF),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text('CF0003034'),
                              ),
                              const Text('COD: Rs.250'),
                              const Text('Weight: 1kg'),
                              const Text('Created on: 02/06/2023 14:49'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    StepperStep(
                      title: const Text('Merchant Details'),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Iphone Store'),
                          Text('MC-0002'),
                          Text(
                              'Pickup Address: 280, Duplication Road, Colombo'),
                          Text('Origin City: Nugegoda'),
                          Text('Origin Warehouse: Trans Express'),
                        ],
                      ),
                    ),
                    StepperStep(
                      title: const Text('Customer Details'),
                      content: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mr. john Deo'),
                          Text('Nugegoda'),
                          Text('john@gmail.com'),
                          Text('0777678340'),
                          Text('Destination City: Colombo 01'),
                        ],
                      ),
                    ),
                    StepperStep(
                      title: const Text('Destination Warehouse'),
                      content: const Text('Trans Express'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                    radius: 12,
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
                      const SizedBox(height: 8),
                    ],
                    steps[index].content,
                    const SizedBox(height: 16),
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
