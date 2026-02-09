import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SingleChildScrollView(
      child: Column(
        children: [
          _HeaderSection(isMobile: isMobile),
          _ServicesGrid(isMobile: isMobile),
          _CustomSolutionSection(isMobile: isMobile),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final bool isMobile;

  const _HeaderSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
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
              'Our ',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 36 : 48,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Services',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 36 : 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: isMobile ? double.infinity : 700,
              child: Text(
                'Comprehensive technology solutions designed to accelerate your business growth',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 14 : 18,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServicesGrid extends StatelessWidget {
  final bool isMobile;

  const _ServicesGrid({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'icon': OtherIcons.code,
        'title': 'Custom Development',
        'description':
            'Tailored software solutions built to meet your unique business requirements with cutting-edge technologies.',
        'features': [
          'Full-stack development',
          'API integration',
          'Code optimization',
          'Technical consulting'
        ],
      },
      {
        'icon': OtherIcons.cloud,
        'title': 'Cloud Solutions',
        'description':
            'Scalable cloud infrastructure and migration services to power your business growth.',
        'features': [
          'Cloud migration',
          'Infrastructure setup',
          'Performance optimization',
          '24/7 monitoring'
        ],
      },
      {
        'icon': OtherIcons.database,
        'title': 'Data Management',
        'description':
            'Comprehensive data solutions for storage, processing, and analytics at any scale.',
        'features': [
          'Database design',
          'Data warehousing',
          'Real-time analytics',
          'Data security'
        ],
      },
      {
        'icon': OtherIcons.lock,
        'title': 'Security Services',
        'description':
            'Enterprise-grade security solutions to protect your business and customer data.',
        'features': [
          'Security audits',
          'Compliance management',
          'Threat detection',
          'Incident response'
        ],
      },
      {
        'icon': OtherIcons.smartphone,
        'title': 'Mobile Development',
        'description':
            'Native and cross-platform mobile applications that engage and delight users.',
        'features': [
          'iOS & Android apps',
          'Cross-platform solutions',
          'UI/UX design',
          'App maintenance'
        ],
      },
      {
        'icon': OtherIcons.trendingUp,
        'title': 'Business Intelligence',
        'description':
            'Transform your data into actionable insights with powerful analytics and reporting.',
        'features': [
          'Dashboard creation',
          'Predictive analytics',
          'Custom reporting',
          'Data visualization'
        ],
      },
    ];

    return Container(
      color: AppColors.darkBg,
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 48),
        child: GridView.count(
          crossAxisCount: isMobile ? 1 : 3,
          shrinkWrap: true,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: isMobile ? 1 : 0.95,
          children: services
              .map((service) => _ServiceCard(
                    icon: service['icon'] as IconData,
                    title: service['title'] as String,
                    description: service['description'] as String,
                    features: service['features'] as List<String>,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> features;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..scaleByDouble(1.02, 1.02, 1.02, 1.0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: AppColors.darkBgSecondary,
          border: Border.all(
            color: _isHovered
                ? AppColors.orange.withValues(alpha: 0.4)
                : AppColors.orange.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                widget.icon,
                color: AppColors.orange,
                size: 28,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textTertiary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            ...widget.features
                .map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class _CustomSolutionSection extends StatelessWidget {
  final bool isMobile;

  const _CustomSolutionSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBgSecondary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 40 : 80,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.orange.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(12),
            color: AppColors.orange.withValues(alpha: 0.05),
          ),
          padding: EdgeInsets.all(isMobile ? 24 : 48),
          child: Column(
            children: [
              Text(
                'Need a Custom Solution?',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'We specialize in creating bespoke solutions tailored to your specific needs',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 14 : 18,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                ),
                child: Text(
                  'Discuss Your Project',
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
      ),
    );
  }
}
