import 'package:aiservicewebsite/widgets/footer.dart';
import 'package:aiservicewebsite/services/supabase_service.dart';
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

          // 🔥 ABOUT PREVIEW SECTION
          _HomeAboutSection(isMobile: isMobile, onNavigate: onNavigate),

          _FeatureSection(isMobile: isMobile),

          _HomeBlogSection(
            isMobile: isMobile,
            onNavigate: onNavigate,
          ), // ✅ ADD THIS

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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 24, 24, 24),
            Color.fromARGB(255, 4, 3, 2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 60 : 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<Map<String, dynamic>?>(
              future: SupabaseService().getWebsiteSettings(),
              builder: (context, snapshot) {
                final hasCustom = snapshot.hasData && snapshot.data != null;
                final heroTitle =
                    hasCustom && (snapshot.data!['hero_title'] ?? '').isNotEmpty
                        ? snapshot.data!['hero_title'] as String
                        : 'Welcome to Dynamic Dazzel';
                final heroSubtitle = hasCustom &&
                        (snapshot.data!['hero_subtitle'] ?? '').isNotEmpty
                    ? snapshot.data!['hero_subtitle'] as String
                    : 'Empowering businesses with cutting-edge AI solutions and innovative services';
                final heroImageUrl =
                    (snapshot.data?['hero_image_url'] ?? '') as String;

                return Column(
                  children: [
                    Text(
                      heroTitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 32 : 56,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: isMobile ? double.infinity : 600,
                      child: Text(
                        heroSubtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: isMobile ? 16 : 20,
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                    ),
                    if (heroImageUrl.isNotEmpty) ...[
                      const SizedBox(height: 32),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          heroImageUrl,
                          height: isMobile ? 220 : 320,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, _, __) => const SizedBox(),
                        ),
                      ),
                    ],
                  ],
                );
              },
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

class _HomeAboutSection extends StatelessWidget {
  final bool isMobile;
  final Function(String) onNavigate;

  const _HomeAboutSection({required this.isMobile, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBg,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 40 : 80,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT CONTENT
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About ',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 28 : 46,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'DDE',
                          style: GoogleFonts.inter(
                            fontSize: isMobile ? 28 : 42,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'We are a technology-driven company focused on delivering intelligent AI solutions that help businesses scale, innovate, and stay competitive in a fast-changing digital world.',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      color: AppColors.textTertiary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'From strategy to execution, our team blends deep technical expertise with real business understanding.',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      color: AppColors.textTertiary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  OutlinedButton(
                    onPressed: () => onNavigate('about'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppColors.orange.withValues(alpha: 0.8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'Learn More About Us',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // RIGHT STATS (desktop only)
            if (!isMobile) const SizedBox(width: 48),
            if (!isMobile)
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.darkBgSecondary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.orange.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    children: const [
                      _MiniStat(number: '500+', label: 'Projects'),
                      SizedBox(height: 24),
                      _MiniStat(number: '200+', label: 'Clients'),
                      SizedBox(height: 24),
                      _MiniStat(number: '15+', label: 'Countries'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String number;
  final String label;

  const _MiniStat({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.orange,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 13, color: AppColors.textTertiary),
        ),
      ],
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 31, 31, 32),
            Color.fromARGB(255, 10, 10, 10),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
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

            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 4;

                if (constraints.maxWidth < 1100) {
                  crossAxisCount = 2;
                }
                if (constraints.maxWidth < 650) {
                  crossAxisCount = 1;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: features.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                     childAspectRatio: isMobile ? 2.2 : 1.6, /// 🔥 THIS makes cards small + premium
                  ),
                  itemBuilder: (context, index) {
                    final feature = features[index];

                    return _FeatureCard(
                      icon: feature['icon'] as IconData,
                      title: feature['title'] as String,
                      description: feature['description'] as String,
                    );
                  },
                );
              },
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(22), // 🔥 more internal space
        decoration: BoxDecoration(
          color: const Color(0xff1a2433), // 🔥 lighter card bg like screenshot
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1.2, // 🔥 slightly thicker border
            color: AppColors.orange.withValues(alpha: 0.35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ICON BOX (bigger like design)
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.orange.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(widget.icon, size: 24, color: AppColors.orange),
            ),

            const SizedBox(height: 22),

            /// TITLE (bigger)
            Text(
              widget.title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: 12),

            /// DESCRIPTION
            Text(
              widget.description,
              style: GoogleFonts.inter(
                fontSize: 15,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeBlogSection extends StatelessWidget {
  final bool isMobile;
  final Function(String) onNavigate;

  const _HomeBlogSection({required this.isMobile, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final blogs = [
      {
        "icon": Icons.auto_awesome,
        "title": "AI in Modern SaaS",
        "description":
            "How AI is transforming modern SaaS platforms with automation and intelligence.",
      },
      {
        "icon": Icons.public,
        "title": "Scaling Flutter Web",
        "description":
            "Best practices to deploy scalable enterprise SaaS using Flutter Web.",
      },
      {
        "icon": Icons.memory,
        "title": "AI Architecture",
        "description":
            "Modern backend & AI architecture used by real world startups.",
      },
      {
        "icon": Icons.analytics,
        "title": "Startup Growth Metrics",
        "description":
            "Key analytics & growth metrics every SaaS founder must track.",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Latest Blogs ",
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 28 : 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            

            SizedBox(height: 10),
            TextButton(
              onPressed: () => onNavigate('blog'),
              child: Text(
                "View All",
                style: GoogleFonts.inter(
                  color: AppColors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 36),

            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 3;

                if (constraints.maxWidth < 1100) crossAxisCount = 2;
                if (constraints.maxWidth < 700) crossAxisCount = 1;

                return GridView.count(
                  crossAxisCount: isMobile ? 1 : 4,
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isMobile ? 2.2 : 1.6, // ⭐ MAIN FIX
                  physics: const NeverScrollableScrollPhysics(),
                  children: blogs
                      .map(
                        (blog) => _BlogCard(
                          icon: blog['icon'] as IconData,
                          title: blog['title'] as String,
                          description: blog['description'] as String,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BlogCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _BlogCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return _FeatureCard(icon: icon, title: title, description: description);
  }
}

class _HomeBlogCard extends StatelessWidget {
  final String title;
  final String description;
  final String tag;
  final String readTime;

  const _HomeBlogCard({
    required this.title,
    required this.description,
    required this.tag,
    required this.readTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkBgTertiary,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tag,
            style: GoogleFonts.inter(
              color: AppColors.orange,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.inter(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const Spacer(),
          Text(
            readTime,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: AppColors.textTertiary,
            ),
          ),
        ],
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
      color: const Color.fromARGB(255, 8, 8, 8),
      width: double.infinity,
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
