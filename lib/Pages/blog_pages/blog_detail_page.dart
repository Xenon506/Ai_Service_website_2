import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme.dart';
import '../../widgets/footer.dart';

class BlogDetailPage extends StatelessWidget {
  final String category;
  final String title;
  final String readTime;
  final String description;
  final List<String> sections;
  final Function(String) onNavigate;

  const BlogDetailPage({
    super.key,
    required this.category,
    required this.title,
    required this.readTime,
    required this.description,
    required this.sections,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: AppColors.darkBg,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: isMobile ? 32 : 56,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () => onNavigate('blogs'),
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: Text(
                    'Back to Blog',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.orange,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkBgSecondary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 30 : 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  readTime,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textTertiary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.darkBgSecondary,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: isMobile ? 32 : 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: sections
                  .map(
                    (text) => Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Text(
                        text,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          height: 1.7,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            color: AppColors.darkBg,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 60,
                vertical: isMobile ? 32 : 56,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.darkBgSecondary,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderColor),
                ),
                padding: EdgeInsets.all(isMobile ? 20 : 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Want to apply these ideas to your product?',
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 18 : 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Share your context and goals — we will map out a practical roadmap, architecture, and timeline for you.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ElevatedButton(
                          onPressed: () => onNavigate('contact'),
                          child: const Text('Talk to our team'),
                        ),
                        OutlinedButton(
                          onPressed: () => onNavigate('blogs'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.orange),
                          ),
                          child: Text(
                            'Browse more articles',
                            style: GoogleFonts.inter(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}

