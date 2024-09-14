import 'package:flutter/material.dart';
import 'package:merchant_app/core/theme_data/text_theme.dart';

import '../shared/expansion_widget.dart';
import '../shared/main_layout.dart';

class StatusStatisticsScreen extends StatefulWidget {
  const StatusStatisticsScreen({super.key});

  @override
  State<StatusStatisticsScreen> createState() => _StatusStatisticsScreenState();
}

class _StatusStatisticsScreenState extends State<StatusStatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios_new)),
                  const SizedBox(width: 16.0),
                  Text(
                    'Status Statistics',
                    style: textTheme.titleSmall!.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  // _buildStatusCard(),
                  _buildExpansionTile(
                    title: 'Pickup Rider Assigned',
                    iconColor: Colors.purple,
                    icon: Icons.add,
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: _buildStatisticItem(
                                  icon: 'sign-in.png',
                                  value: '76',
                                  label: 'No of Orders',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatisticItem(
                                  icon: 'cash.png',
                                  value: '50371.50',
                                  label: 'Delivery Charge',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Ratio  :  67%',
                              style: textTheme.headlineSmall!.copyWith(
                                fontSize: 14,
                                color: const Color(0xff606060),
                              )),
                        ],
                      ),
                    ),
                  ),

                  _buildExpansionTile(
                    title: 'Picked Up',
                    iconColor: Colors.orange,
                    icon: Icons.done,
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: _buildStatisticItem(
                                  icon: 'sign-in.png',
                                  value: '76',
                                  label: 'No of Orders',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatisticItem(
                                  icon: 'cash.png',
                                  value: '50371.50',
                                  label: 'Delivery Charge',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Ratio  :  67%',
                              style: textTheme.headlineSmall!.copyWith(
                                fontSize: 14,
                                color: const Color(0xff606060),
                              )),
                        ],
                      ),
                    ),
                  ),
                  _buildExpansionTile(
                    title: 'Confirmed',
                    iconColor: Colors.green,
                    icon: Icons.done,
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: _buildStatisticItem(
                                  icon: 'sign-in.png',
                                  value: '76',
                                  label: 'No of Orders',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildStatisticItem(
                                  icon: 'cash.png',
                                  value: '50371.50',
                                  label: 'Delivery Charge',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text('Ratio  :  67%',
                              style: textTheme.headlineSmall!.copyWith(
                                fontSize: 14,
                                color: const Color(0xff606060),
                              )),
                        ],
                      ),
                    ),
                  ),
                  _buildExpansionTile(
                    title: 'Cancelled',
                    iconColor: Colors.red,
                    icon: Icons.cancel,
                    content: const Text(''),
                  ),
                  _buildExpansionTile(
                    title: 'Delivered',
                    iconColor: Colors.teal,
                    icon: Icons.add,
                    content: const Text(''),
                  ),
                  _buildExpansionTile(
                    title: 'Partially Delivered',
                    iconColor: Colors.blue,
                    icon: Icons.done,
                    content: const Text(''),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {
                      // Add action for "See more"
                    },
                    child: const Column(
                      children: [
                        Text(
                          'See more',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Powered by curfox.lk',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticItem({
    required String icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      decoration: BoxDecoration(
          color: const Color(0xffECF7FE),
          borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Text(label,
              style: textTheme.headlineSmall!.copyWith(
                fontSize: 14,
                color: const Color(0xff606060),
              )),
          const SizedBox(height: 8),
          Row(
            children: [
              Image.asset(
                'assets/icons/$icon',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff606060)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required Color iconColor,
    required IconData icon,
    required Widget content,
  }) {
    return ExpandableContainer(
      title: title,
      content: content,
      iconColor: iconColor,
      icon: icon,
    );
  }
}
