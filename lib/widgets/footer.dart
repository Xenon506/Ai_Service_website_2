import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBgSecondary,
        border: Border(
          top: BorderSide(
            color: AppColors.orange.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 48,
          vertical: isMobile ? 16 : 28,
        ),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: isMobile ? 1 : 3,
              shrinkWrap: true,
              crossAxisSpacing: 32,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1 : 1.2,
              children: [
                _FooterSection(
                  title: 'Dart Language',
                  children: [
                    Text(
                      'Leading provider of AI-powered solutions and services for modern businesses.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: AppColors.textTertiary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                _FooterSection(
                  title: 'Quick Links',
                  children: [
                    _FooterLink(label: 'Home', onTap: () {}),
                    _FooterLink(label: 'Services', onTap: () {}),
                    _FooterLink(label: 'Solutions', onTap: () {}),
                    _FooterLink(label: 'About Us', onTap: () {}),
                  ],
                ),
                _FooterSection(
                  title: 'Contact Info',
                  children: [
                    _ContactItem(
                      icon: OtherIcons.mail,
                      text: 'info@dartlanguage.com',
                    ),
                    _ContactItem(
                      icon: OtherIcons.phone,
                      text: '+1 (555) 123-4567',
                    ),
                    _ContactItem(
                      icon: OtherIcons.pin,
                      text: '123 Tech Street, Silicon Valley',
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: AppColors.borderColor.withValues(alpha: 0.4),
              height: 32,
            ),
            Text(
              '© 2024 Dart Language. All rights reserved.',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FooterSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.orange,
          ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({
    required this.label,
    required this.onTap,
  });

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: _isHovered
                ? AppColors.orangeLight
                : AppColors.textTertiary,
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: AppColors.orange,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
