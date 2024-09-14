import 'package:flutter/material.dart';
import '../shared/main_layout.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbarTitle: "Dashboard",
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildOrdersStatisticsCard(),
                    const SizedBox(height: 16),
                    _buildFinanceStatisticsCard(),
                    const SizedBox(height: 16),
                    _buildStatusStatisticsCard(),
                  ],
                ),
              ),
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
      ),
    );
  }

  Widget _buildOrdersStatisticsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Orders Statistics',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatisticItem(
                  icon: 'assets/icons/money-bag.png',
                  value: '3.1k',
                  label: 'Orders Count',
                ),
                _buildStatisticItem(
                  icon: 'assets/icons/money-exchange.png',
                  value: '4.8k',
                  label: 'Total Delivery Charge',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinanceStatisticsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Finance Statistics',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatisticItem(
                  icon: 'assets/icons/tax.png',
                  value: '234.1k',
                  label: 'Invoice value',
                ),
                _buildStatisticItem(
                  icon: 'assets/icons/analytics.png',
                  value: '122.3k',
                  label: 'Pending Invoice',
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatisticItem(
                  icon: 'assets/icons/coins.png',
                  value: '678.7k',
                  label: 'Paid Invoice value',
                ),
                _buildStatisticItem(
                  icon: 'assets/icons/approval.png',
                  value: '101.1k',
                  label: 'Approved Invoice',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStatisticsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/purchase-order.png',
              width: 45,
              height: 45,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Status Statistics',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        // Navigate to the status statistics screen
                        Navigator.of(context).pushNamed('/status-statistics');
                      },
                      child: const Text(
                        'show details',
                        style: TextStyle(color: Colors.blue),
                      ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          icon,
          width: 45,
          height: 45,
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
