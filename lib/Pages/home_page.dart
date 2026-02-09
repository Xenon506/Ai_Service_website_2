import 'package:aiservicewebsite/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class HomePage extends StatelessWidget {
  final Function(String) onNavigate;

  const HomePage({required this.onNavigate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SingleChildScrollView(
      child: Column(
        children: [
          _HeroSection(onNavigate: onNavigate),
          _FeatureSection(isMobile: isMobile),
          _CTASection(onNavigate: onNavigate),
          Footer(),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  final Function(String) onNavigate;

  const _HeroSection({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color: AppColors.darkBgSecondary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 60 : 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to ',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 32 : 56,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Dynamic Dazzel',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 32 : 56,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: isMobile ? double.infinity : 600,
              child: Text(
                'Empowering businesses with cutting-edge AI solutions and innovative services',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 16 : 20,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => onNavigate('solutions'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : 32,
                      vertical: 12,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Explore Solutions',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // FIX: Use an existing icon instead, since OtherIcons.arrow_right doesn't exist or isn't defined.
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
                if (!isMobile) const SizedBox(width: 16),
                if (!isMobile)
                  OutlinedButton(
                    onPressed: () => onNavigate('contact'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.orange,
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureSection extends StatelessWidget {
  final bool isMobile;

  const _FeatureSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        // FIX: Use Material Icons equivalents since OtherIcons.bolt, ... are not defined in theme.dart
        'icon': Icons.bolt, // Lightning fast
        'title': 'Fast & Efficient',
        'description':
            'Lightning-fast solutions that deliver results in record time',
      },
      {
        'icon': Icons.center_focus_strong, // Targeting / Precision
        'title': 'Precision Driven',
        'description': 'Accurate AI models tailored to your specific needs',
      },
      {
        'icon': Icons.shield_outlined, // Security
        'title': 'Secure & Reliable',
        'description': 'Enterprise-grade security for your peace of mind',
      },
      {
        'icon': Icons.auto_awesome, // Sparkles / Innovation
        'title': 'Innovation First',
        'description': 'Cutting-edge technology that stays ahead of the curve',
      },
    ];

    return Container(
      color: AppColors.darkBg,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 40 : 80,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  'Why Choose ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 28 : 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Us',
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 28 : 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 48),
            
            GridView.count(
              crossAxisCount: isMobile ? 1 : 2,
              shrinkWrap: true,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 2.5 : 3.5,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling inside SingleChildScrollView
              children: features
                  .map(
                    (feature) => _FeatureCard(
                      icon: feature['icon'] as IconData,
                      title: feature['title'] as String,
                      description: feature['description'] as String,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBgSecondary,
          border: Border.all(
            color: _isHovered
                ? AppColors.orange.withValues(alpha: 0.4)
                : AppColors.orange.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 🔥 key line
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(widget.icon, color: AppColors.orange, size: 24),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textTertiary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CTASection extends StatelessWidget {
  final Function(String) onNavigate;

  const _CTASection({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      color: AppColors.darkBgSecondary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 40 : 80,
        ),
        child: Column(
          children: [
            Text(
              'Ready to Transform Your Business?',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 24 : 36,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Join hundreds of companies already leveraging our AI solutions',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 18,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => onNavigate('contact'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24 : 32,
                  vertical: 12,
                ),
              ),
              child: Text(
                'Contact Us Today',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
