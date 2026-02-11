import 'package:aiservicewebsite/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ================= BLOG PAGE =================
class BlogPage extends StatelessWidget {
  const BlogPage({super.key, required void Function(String page) onNavigate});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _BlogHeroSection(isMobile: isMobile),
            _BlogFilterBar(isMobile: isMobile),
            _FeaturedBlogSection(isMobile: isMobile),
            _BlogGridSection(isMobile: isMobile),
          ],
        ),
      ),
    );
  }
}

/// ================= HERO =================
class _BlogHeroSection extends StatelessWidget {
  final bool isMobile;
  const _BlogHeroSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 60 : 100,
      ),
      width: double.infinity,
      color: AppColors.darkBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "AI Insights & Engineering Blog",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: isMobile ? 34 : 48,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            "Deep dives on AI engineering, SaaS architecture, startups and product development.",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: isMobile ? double.infinity : 420,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search articles...",
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// ================= FILTER BAR =================
class _BlogFilterBar extends StatelessWidget {
  final bool isMobile;
  const _BlogFilterBar({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final categories = [
      "All",
      "AI Engineering",
      "Startups",
      "SaaS",
      "Flutter",
      "Backend",
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 20,
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: categories
            .map(
              (c) => Chip(
                label: Text(c),
                backgroundColor: AppColors.darkBgSecondary,
                side: const BorderSide(color: AppColors.borderColor),
                labelStyle:
                    GoogleFonts.inter(color: AppColors.textSecondary),
              ),
            )
            .toList(),
      ),
    );
  }
}

/// ================= FEATURED BLOG =================
class _FeaturedBlogSection extends StatelessWidget {
  final bool isMobile;
  const _FeaturedBlogSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60, vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.darkBgSecondary,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _FeaturedText(),
                ],
              )
            : Row(
                children: const [
                  Expanded(child: _FeaturedText()),
                ],
              ),
      ),
    );
  }
}

class _FeaturedText extends StatelessWidget {
  const _FeaturedText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FEATURED ARTICLE",
          style: GoogleFonts.inter(
            color: AppColors.orange,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "How We Built an Enterprise AI SaaS Platform Using Flutter & Supabase",
          style: GoogleFonts.inter(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Architecture, scaling strategies, real production lessons and mistakes we made while building AI systems.",
          style: GoogleFonts.inter(
            fontSize: 15,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 18),
        ElevatedButton(onPressed: () {}, child: const Text("Read Article"))
      ],
    );
  }
}

/// ================= BLOG GRID =================
class _BlogGridSection extends StatelessWidget {
  final bool isMobile;
  const _BlogGridSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final blogs = List.generate(8, (i) => i);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 40,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 3;

          if (constraints.maxWidth < 1200) crossAxisCount = 2;
          if (constraints.maxWidth < 700) crossAxisCount = 1;

          const spacing = 20.0;
          final itemWidth = (constraints.maxWidth -
                  (crossAxisCount - 1) * spacing) /
              crossAxisCount;

          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: blogs
                .map(
                  (_) => SizedBox(
                    width: itemWidth,
                    child: const _BlogCard(),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

/// ================= BLOG CARD =================
class _BlogCard extends StatelessWidget {
  const _BlogCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.darkBgSecondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "AI Engineering",
            style: GoogleFonts.inter(
              color: AppColors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Building Production Ready AI APIs",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Lessons from deploying AI systems used by thousands of users in real startups.",
            style: GoogleFonts.inter(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          Text(
            "6 min read",
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
