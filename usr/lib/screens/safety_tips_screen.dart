import 'package:flutter/material.dart';

class SafetyTipsScreen extends StatelessWidget {
  const SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'] as String;
    final type = args['type'] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, title, type),
            const SizedBox(height: 24),
            const Text(
              'Safety Guidelines',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A148C),
              ),
            ),
            const SizedBox(height: 16),
            ..._getTipsForType(type).map((tip) => _buildTipCard(tip)),
            const SizedBox(height: 24),
            const Text(
              'Recent Reports',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A148C),
              ),
            ),
            const SizedBox(height: 16),
            _buildReportButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title, String type) {
    IconData icon;
    Color color;
    String description;

    switch (type) {
      case 'sms':
        icon = Icons.sms_failed_outlined;
        color = Colors.orange;
        description = 'Protect yourself from phishing links and fake lottery messages.';
        break;
      case 'calls':
        icon = Icons.phone_disabled_outlined;
        color = Colors.red;
        description = 'Identify and block fraudulent calls asking for personal info.';
        break;
      case 'news':
        icon = Icons.newspaper_outlined;
        color = Colors.blue;
        description = 'Verify news sources before sharing to stop misinformation.';
        break;
      case 'upi':
        icon = Icons.payment_outlined;
        color = Colors.green;
        description = 'Secure your UPI PIN and never share OTPs with anyone.';
        break;
      default:
        icon = Icons.security;
        color = Colors.purple;
        description = 'General safety tips for your digital life.';
    }

    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 64, color: color),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getTipsForType(String type) {
    switch (type) {
      case 'sms':
        return [
          'Never click on suspicious links in SMS.',
          'Verify the sender ID before trusting the message.',
          'Banks never ask for OTP or passwords via SMS.',
          'Report spam messages to your network provider.',
        ];
      case 'calls':
        return [
          'Do not share personal details over unknown calls.',
          'Disconnect immediately if asked for money or PIN.',
          'Use caller ID apps to identify spam numbers.',
          'Be aware of "family emergency" scam calls.',
        ];
      case 'news':
        return [
          'Check the source credibility before sharing.',
          'Look for official statements for major news.',
          'Reverse image search suspicious photos.',
          'Be skeptical of sensational headlines.',
        ];
      case 'upi':
        return [
          'Never enter your UPI PIN to receive money.',
          'Do not share OTPs with anyone, even bank officials.',
          'Verify the receiver name before sending money.',
          'Use official banking apps only.',
        ];
      default:
        return ['Stay alert and stay safe.'];
    }
  }

  Widget _buildTipCard(String tip) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                tip,
                style: const TextStyle(fontSize: 15, height: 1.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Report feature coming soon!')),
          );
        },
        icon: const Icon(Icons.report_problem_outlined),
        label: const Text('Report Suspicious Activity'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          side: const BorderSide(color: Colors.red),
          foregroundColor: Colors.red,
        ),
      ),
    );
  }
}
