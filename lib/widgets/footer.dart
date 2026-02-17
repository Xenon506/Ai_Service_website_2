import 'package:flutter/material.dart';
import '../theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      color: AppColors.darkBgSecondary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 140,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ----------- TOP LINK SECTIONS -----------
          Wrap(
            spacing: 100,
            runSpacing: 50,
            children: [
              _linksBlock(
                title: "AI",
                links: [
                  "JetBrains AI",
                  "AI Assistant",
                  "Junie",
                  "AI in IDEs",
                  "AI Enterprise",
                  "AI News",
                ],
              ),
              _linksBlock(
                title: "Developer Tools",
                links: [
                  "All Products",
                  "IDEs",
                  ".NET and Visual Studio",
                  "Team Tools",
                  "Plugin Marketplace",
                  "Toolbox App",
                ],
              ),
              _linksBlock(
                title: "Solutions",
                links: [
                  "Business",
                  "Data",
                  "IDE Services",
                  "Remote Development",
                  "Game Development",
                  "DevOps",
                ],
              ),
              _linksBlock(
                title: "Initiatives",
                links: [
                  "Kotlin",
                  "Open Source",
                  "JetBrains Research",
                  "JetBrains Mono",
                  "MPS",
                ],
              ),
              _linksBlock(
                title: "Education",
                links: [
                  "Students",
                  "Teachers",
                  "Bootcamps",
                  "Teams",
                  "Course Catalog",
                  "University Programs",
                ],
              ),
              _linksBlock(
                title: "Store",
                links: [
                  "Plans and Pricing",
                  "All Products Pack",
                  "dotUltimate",
                  "Partners and Resellers",
                  "Customers and Awards",
                ],
              ),
              _linksBlock(
                title: "Support",
                links: [
                  "Technical Support",
                  "Contact Sales",
                  "Documentation",
                  "JetBrains Account",
                ],
              ),
              _linksBlock(
                title: "Resources",
                links: [
                  "Blog",
                  "Early Access",
                  "Events and Livestreams",
                  "Newsletters",
                  "Industry Reports",
                  "Inspectopedia",
                  "Desktop Art",
                ],
              ),
              _linksBlock(
                title: "Community",
                links: [
                  "User Groups",
                  "Open-Source Partnerships",
                  "Developer Recognition",
                  "Content Creators",
                ],
              ),
              _linksBlock(
                title: "Company",
                links: [
                  "About",
                  "Contacts",
                  "Careers",
                  "Brand Assets",
                  "Merchandise",
                  "Trust Center",
                ],
              ),
            ],
          ),

          const SizedBox(height: 60),

          Divider(
            color: const Color.fromARGB(255, 12, 12, 13).withValues(alpha: 0.3),
            thickness: 2,
          ),

          const SizedBox(height: 30),

          /// ----------- SOCIAL + LEGAL SECTION -----------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// Social Icons
              Row(
                children: [
                  _socialIcon(Icons.facebook),
                  _socialIcon(Icons.close), // X
                  _socialIcon(Icons.linked_camera), // LinkedIn alt
                  _socialIcon(Icons.play_circle_fill), // YouTube
                  _socialIcon(Icons.camera_alt), // Instagram
                  _socialIcon(Icons.music_note), // TikTok
                  _socialIcon(Icons.rss_feed),
                ],
              ),

              /// Country + Language
              Row(
                children: [
                  Icon(Icons.public,
                      size: 18, color: AppColors.textTertiary),
                  const SizedBox(width: 6),
                  Text("India",
                      style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 14)),
                  const SizedBox(width: 24),
                  Icon(Icons.language,
                      size: 18, color: AppColors.textTertiary),
                  const SizedBox(width: 6),
                  Text("English",
                      style: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 14)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 25),
          
          /// Bottom Legal Links
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: [
              _bottomLink("Privacy and Security"),
              _bottomLink("Privacy Notice"),
              _bottomLink("Terms of Use"),
              _bottomLink("Attributions"),
              _bottomLink("Legal"),
              _bottomLink("Genuine Tools"),
              _bottomLink("Opt-Out"),
            ],
          ),

          const SizedBox(height: 25),

          /// Copyright
          Text(
            "Copyright © 2000–2026 JetBrains s.r.o.",
            style: TextStyle(
              color: AppColors.textTertiary,
              fontSize: 13,
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
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
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

  // ---------------- SOCIAL ICON ----------------

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Icon(
        icon,
        size: 20,
        color: AppColors.textTertiary,
      ),
    );
  }

  Widget _bottomLink(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textTertiary,
        fontSize: 13,
      ),
    );
  }
}
