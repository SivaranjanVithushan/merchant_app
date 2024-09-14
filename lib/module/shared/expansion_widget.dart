import 'package:flutter/material.dart';

import '../../core/theme_data/text_theme.dart';

class ExpandableContainer extends StatefulWidget {
  final String title;
  final Widget content;
  final Color? iconColor;
  final IconData? icon;
  final bool initialExpanded;

  const ExpandableContainer({
    super.key,
    required this.title,
    required this.content,
    this.iconColor,
    this.icon,
    this.initialExpanded = false,
  });

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.initialExpanded; // Set initial state
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Card(
        child: Stack(
          children: [
            if (!isExpanded) ...[
              Positioned(
                right: 20,
                top: 10,
                child: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: const Color(0xff606060),
                ),
              ),
            ],
            if (isExpanded) ...[
              Positioned(
                right: 20,
                bottom: 10,
                child: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: const Color(0xff606060),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: widget.iconColor,
                              child: Icon(widget.icon),
                            ),
                            const SizedBox(width: 12),
                            Text(widget.title,
                                style: textTheme.headlineSmall!.copyWith(
                                  fontSize: 14,
                                  color: const Color(0xff606060),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (isExpanded) widget.content
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
