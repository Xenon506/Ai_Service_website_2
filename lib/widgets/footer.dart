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
        horizontal: isMobile ? 24 : 72,
        vertical: 48,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 48,
            runSpacing: 40,
            alignment: WrapAlignment.spaceBetween,
            children: [
              _brandBlock(),
              _linksBlock(
                title: 'Quick Links',
                links: ['Home', 'Blog', 'Announcements', 'Contact'],
              ),
              _linksBlock(
                title: 'About',
                links: [
                  'Our Company',
                  'Our Leadership Team',
                  'Our Speakers',
                  'Our Event Highlights',
                  'Our Partners',
                ],
              ),
              _linksBlock(
                title: 'Services',
                links: [
                  'Conference & Summit',
                  'Tech Events',
                  'Concerts',
                  'Wedding',
                  'Corporate Events',
                  'Exhibitions',
                  'CSR Events',
                  'Fashion Shows',
                  'Product Launch',
                ],
              ),
            ],
          ),

          const SizedBox(height: 40),
          Divider(color: AppColors.borderColor.withValues(alpha: 0.4)),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2025 Dynamic Dazzle Entertainment LLP. All Rights Reserved.',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 13,
                ),
              ),
              Text(
                'Proudly Made in India 🇮🇳',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- BRAND BLOCK ----------------

  Widget _brandBlock() {
    return SizedBox(
      width: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dynamic Dazzle Entertainment LLP',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'A Delhi-based event management company delivering impactful, '
            'technology-driven, and seamlessly executed event experiences across India.',
            style: TextStyle(
              color: AppColors.textTertiary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          _infoRow(Icons.location_on, 'Delhi, India'),
          _infoRow(Icons.email, 'contact@ddeevents.com'),
          _infoRow(Icons.phone, '+91 9625961246, +91 9693856529'),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textTertiary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: AppColors.textTertiary),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- LINKS BLOCK ----------------

  Widget _linksBlock({
    required String title,
    required List<String> links,
  }) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ...links.map(
            (link) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                link,
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
