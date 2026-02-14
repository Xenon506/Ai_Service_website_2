import 'package:aiservicewebsite/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import '../theme.dart';

class AboutPage extends StatelessWidget {
  final Function(String)? onNavigate;

  const AboutPage({Key? key, this.onNavigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SingleChildScrollView(
      child: Column(
        children: [
          _HeaderSection(isMobile: isMobile),
          _StorySection(isMobile: isMobile),
          _ValuesSection(isMobile: isMobile),
          _ImpactSection(isMobile: isMobile),
          _WhyChooseSection(isMobile: isMobile),
          Footer(),
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
              'About ',
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
                    text: 'Dart Language',
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
            Text(
              'Pioneering the future of business technology with innovative AI solutions',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 18,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StorySection extends StatelessWidget {
  final bool isMobile;

  const _StorySection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBg,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 40 : 80,
        ),
        child: Column(
          children: [
            if (!isMobile)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 48,
                children: [
                  Expanded(
                    child: _StoryContent(),
                  ),
                  Expanded(
                    child: _MissionCard(),
                  ),
                ],
              ),
            if (isMobile)
              Column(
                spacing: 32,
                children: [
                  _StoryContent(),
                  _MissionCard(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _StoryContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our ',
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Story',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Founded with a vision to democratize artificial intelligence and make cutting-edge technology accessible to businesses of all sizes, Dart Language has grown into a leading provider of AI solutions and services.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.textTertiary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Our journey began when a group of passionate technologists recognized the transformative potential of AI and machine learning. We set out to bridge the gap between complex technology and practical business applications.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.textTertiary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Today, we work with companies across the globe, helping them leverage AI to solve complex challenges, optimize operations, and unlock new opportunities for growth.',
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.textTertiary,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _MissionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBgSecondary,
        border: Border.all(color: AppColors.orange.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'Our Mission',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'To empower businesses worldwide with intelligent, scalable, and innovative technology solutions that drive measurable results and sustainable growth.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textTertiary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: AppColors.orange.withValues(alpha: 0.1),
              border: Border.all(color: AppColors.orange.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.globe,
                  color: AppColors.orange,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Global Impact',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'Making technology accessible worldwide ',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ValuesSection extends StatelessWidget {
  final bool isMobile;

  const _ValuesSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final values = [
  {
    'icon': CupertinoIcons.heart,
    'title': 'Customer First',
    'description': 'We prioritize our clients needs and success above all else'
  },
  {
    'icon': CupertinoIcons.check_mark_circled,
    'title': 'Excellence',
    'description': 'We strive for excellence in every project we undertake'
  },
  {
    'icon': CupertinoIcons.rocket,
    'title': 'Innovation',
    'description': 'We embrace cutting-edge technologies and creative solutions'
  },
  {
    'icon': Icons.supervised_user_circle_outlined,
    'title': 'Collaboration',
    'description': 'We work closely with clients as true partners'
  },
];
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
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Values',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            GridView.count(
              crossAxisCount: isMobile ? 2 : 4,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isMobile ? 0.85 : 0.95,
              children: values
                  .map((value) => _ValueCard(
                        icon: value['icon'] as IconData,
                        title: value['title'] as String,
                        description: value['description'] as String,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ValueCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_ValueCard> createState() => _ValueCardState();
}

class _ValueCardState extends State<_ValueCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBgTertiary,
          border: Border.all(
            color: _isHovered
                ? AppColors.orange.withValues(alpha: 0.4)
                : AppColors.orange.withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Icon(
                widget.icon,
                color: AppColors.orange,
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12,
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

class _ImpactSection extends StatelessWidget {
  final bool isMobile;

  const _ImpactSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final stats = [
      {'number': '500+', 'label': 'Projects Completed'},
      {'number': '200+', 'label': 'Happy Clients'},
      {'number': '50+', 'label': 'Team Members'},
      {'number': '15+', 'label': 'Countries Served'},
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
            Text(
              'Our ',
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
                    text: 'Impact',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            GridView.count(
              crossAxisCount: isMobile ? 2 : 4,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              children: stats
                  .map((stat) => _StatCard(
                        number: stat['number']!,
                        label: stat['label']!,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;

  const _StatCard({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.orange,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}

class _WhyChooseSection extends StatelessWidget {
  final bool isMobile;

  const _WhyChooseSection({required this.isMobile});

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
              'Why ',
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
                    text: 'Choose Us?',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'We combine technical expertise with business acumen to deliver solutions that matter',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 18,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 48),
            GridView.count(
              crossAxisCount: isMobile ? 1 : 3,
              shrinkWrap: true,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1 : 1.1,
              children: [
                _ReasonCard(
                  icon: Bootstrap.award,
                  title: 'Industry Expertise',
                  description: 'Years of experience across multiple industries and technology domains',
                ),
                _ReasonCard(
                  icon: Bootstrap.rulers,
                  title: 'Dedicated Team',
                  description: 'A talented team of developers, data scientists, and AI specialists',
                ),
                _ReasonCard(
                  icon: Bootstrap.rocket,
                  title: 'Proven Results',
                  description: 'Track record of successful projects and satisfied clients worldwide',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReasonCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ReasonCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBgTertiary,
        border: Border.all(color: AppColors.orange.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Icon(

            icon,
            color: AppColors.orange,
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppColors.textTertiary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
