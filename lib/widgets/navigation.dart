import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class Navigation extends StatelessWidget {
  final String currentPage;
  final Function(String) onNavigate;

  const Navigation({
    required this.currentPage,
    required this.onNavigate, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBgSecondary,
        border: Border(
          bottom: BorderSide(
            color: AppColors.orange.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 32,
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your AI',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.orange,
              ),
            ),
            if (!isMobile)
              Row(
                spacing: 32,
                children: [
                  _NavLink(
                    label: 'Home',
                    isActive: currentPage == 'home',
                    onTap: () => onNavigate('home'),
                  ),
                  _NavLink(
                    label: 'Blogs',
                    isActive: currentPage == 'blogs',
                    onTap: () => onNavigate('blogs'),
                  ),
                  _NavLink(
                    label: 'Solutions',
                    isActive: currentPage == 'solutions',
                    onTap: () => onNavigate('solutions'),
                  ),
                  _NavLink(
                    label: 'About Us',
                    isActive: currentPage == 'about',
                    onTap: () => onNavigate('about'),
                  ),
                  _NavLink(
                    label: 'Contact',
                    isActive: currentPage == 'contact',
                    onTap: () => onNavigate('contact'),
                  ),
                ],
              ),
            if (isMobile)
              _MobileMenu(
                currentPage: currentPage,
                onNavigate: onNavigate,
              ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: widget.isActive
                    ? AppColors.orange
                    : (_isHovered
                        ? AppColors.orangeLight
                        : AppColors.textSecondary),
              ),
            ),
            if (widget.isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color: AppColors.orange,
              ),
          ],
        ),
      ),
    );
  }
}

class _MobileMenu extends StatefulWidget {
  final String currentPage;
  final Function(String) onNavigate;

  const _MobileMenu({
    required this.currentPage,
    required this.onNavigate,
  });

  @override
  State<_MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<_MobileMenu> {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        widget.onNavigate(value);
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'home',
          child: Text('Home', style: GoogleFonts.inter()),
        ),
        PopupMenuItem(
          value: 'blogs',
          child: Text('Blogs', style: GoogleFonts.inter()),
        ),
        PopupMenuItem(
          value: 'solutions',
          child: Text('Solutions', style: GoogleFonts.inter()),
        ),
        PopupMenuItem(
          value: 'about',
          child: Text('About Us', style: GoogleFonts.inter()),
        ),
        PopupMenuItem(
          value: 'contact',
          child: Text('Contact', style: GoogleFonts.inter()),
        ),
      ],
      child: Icon(Icons.menu, color: AppColors.textSecondary),
    );
  }
}
