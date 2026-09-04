// File Name: home_dashboard.dart
import 'package:flutter/material.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore calculators', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Daily Math'),
          _buildGrid([
            _buildToolCard(context, Icons.calculate, 'Basic', 'Everyday arithmetic'),
          ]),
          const SizedBox(height: 16),
          
          _buildSectionTitle('Investments'),
          _buildGrid([
            _buildToolCard(context, Icons.trending_up, 'SIP', 'Project future value'),
            _buildToolCard(context, Icons.savings, 'FD / RD', 'Deposit maturity'),
          ]),
          const SizedBox(height: 16),

          _buildSectionTitle('Loans'),
          _buildGrid([
            _buildToolCard(context, Icons.account_balance, 'EMI', 'Estimate monthly payments'),
            _buildToolCard(context, Icons.trending_down, 'Inflation', 'See how inflation erodes'),
          ]),
          const SizedBox(height: 16),

          _buildSectionTitle('Business'),
          _buildGrid([
            _buildToolCard(context, Icons.percent, 'GST', 'Add or remove GST'),
            _buildToolCard(context, Icons.price_change, 'Profit Margin', 'Profit and margin'),
            _buildToolCard(context, Icons.discount, 'Discount', 'Final price after discount'),
            _buildToolCard(context, Icons.receipt_long, 'Split Bill & Tip', 'Split a bill fairly'),
          ]),
          const SizedBox(height: 16),

          _buildSectionTitle('Utility'),
          _buildGrid([
            _buildToolCard(context, Icons.account_balance_wallet, 'Budget', 'Track monthly income'),
            _buildToolCard(context, Icons.cake, 'Age', 'Your exact age'),
          ]),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildGrid(List<Widget> cards) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.1,
      children: cards,
    );
  }

  Widget _buildToolCard(BuildContext context, IconData icon, String title, String subtitle) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title opened (Coming soon)')));
        },
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.blueAccent, size: 28),
              ),
              const Spacer(),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}

