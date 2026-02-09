import 'package:flutter/material.dart';
import '../theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: AppColors.darkBgSecondary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 🔑 VERY IMPORTANT
        children: [
          Wrap(
            spacing: 32,
            runSpacing: 24,
            alignment: WrapAlignment.spaceBetween,
            children: [
              _footerBlock(
                title: 'Dart Language',
                child: Text(
                  'Leading provider of AI-powered solutions and services.',
                  style: TextStyle(color: AppColors.textTertiary),
                ),
              ),
              _footerBlock(
                title: 'Quick Links',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Home'),
                    Text('Services'),
                    Text('Solutions'),
                    Text('About'),
                  ],
                ),
              ),
              _footerBlock(
                title: 'Contact',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('info@dartlanguage.com'),
                    Text('+1 (555) 123-4567'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(color: AppColors.borderColor.withValues(alpha: 0.4)),
          const SizedBox(height: 12),
          Text(
            '© 2026 Dart Language',
            style: TextStyle(color: AppColors.textTertiary),
          ),
        ],
      ),
    );
  }

  Widget _footerBlock({required String title, required Widget child}) {
    return SizedBox(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
