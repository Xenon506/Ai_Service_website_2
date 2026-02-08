import 'package:flutter/material.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  final ScrollController scrollController = ScrollController();

  final heroKey = GlobalKey();
  final servicesKey = GlobalKey();
  final pricingKey = GlobalKey();
  final aboutKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0D0D0D),
                  Color(0xFF141414),
                  Color(0xFF0A0A0A),
                ],
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Section(key: heroKey, child: const HeroSection()),
                  const MetricsSection(),
                  Section(key: servicesKey, child: const ServicesSection()),
                  Section(key: pricingKey, child: const PricingSection()),
                  Section(key: aboutKey, child: const AboutUsSection()),
                  const FooterSection(),
                ],
              ),
            ),
          ),
          Navbar(
            onHero: () => scrollTo(heroKey),
            onServices: () => scrollTo(servicesKey),
            onPricing: () => scrollTo(pricingKey),
            onAbout: () => scrollTo(aboutKey),
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final Widget child;
  final bool narrowPadding;

  const Section({super.key, required this.child, this.narrowPadding = false});

  @override
  Widget build(BuildContext context) {
    final horizontal = MediaQuery.sizeOf(context).width > 800 ? 32.0 : 20.0;
    final vertical = narrowPadding ? 48.0 : 100.0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  final VoidCallback onHero;
  final VoidCallback onServices;
  final VoidCallback onPricing;
  final VoidCallback onAbout;

  const Navbar({
    super.key,
    required this.onHero,
    required this.onServices,
    required this.onPricing,
    required this.onAbout,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 72,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 28),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Row(
            children: [
              const Text(
                "AI SaaS",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const Spacer(),
              NavButton("Home", onHero),
              NavButton("Services", onServices),
              NavButton("Pricing", onPricing),
              NavButton("About", onAbout),
              const SizedBox(width: 16),
              _navCta(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navCta() {
    return TextButton(
      onPressed: onHero,
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text("Get Started"),
    );
  }
}

class NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavButton(this.title, this.onTap, {super.key});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(
          foregroundColor: hover ? Colors.deepOrange : Colors.white70,
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: hover ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({super.key, required this.child});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, hover ? -10 : 0, 0),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          boxShadow: hover
              ? [
                  BoxShadow(
                    color: Colors.deepOrange.withValues(alpha: 0.3),
                    blurRadius: 25,
                  )
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFFE0E0E0)],
          ).createShader(bounds),
          child: const Text(
            "Build AI Products\n10x Faster",
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.w800,
              height: 1.15,
              letterSpacing: -1.2,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Modern AI infrastructure for startups and enterprises. Ship smarter, scale faster.",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withValues(alpha: 0.7),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 36),
        Row(
          children: [
            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text("Get Started"),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white70,
                side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Watch Demo"),
            ),
          ],
        ),
      ],
    );
  }
}

class MetricsSection extends StatelessWidget {
  const MetricsSection({super.key});

  Widget metric(IconData icon, String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.deepOrange.withValues(alpha: 0.9), size: 32),
        const SizedBox(height: 12),
        Text(
          value,
          style: const TextStyle(
            fontSize: 36,
            color: Colors.deepOrange,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final m1 = metric(Icons.verified_outlined, "99%", "Accuracy");
    final m2 = metric(Icons.schedule_outlined, "24/7", "Uptime");
    final m3 = metric(Icons.rocket_launch_outlined, "10x", "Performance");
    return LayoutBuilder(
      builder: (context, constraints) {
        final useRow = constraints.maxWidth > 600;
        return Section(
          narrowPadding: true,
          child: useRow
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    m1,
                    Container(width: 1, height: 60, color: Colors.white12),
                    m2,
                    Container(width: 1, height: 60, color: Colors.white12),
                    m3,
                  ],
                )
              : Wrap(
                  spacing: 40,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: [m1, m2, m3],
                ),
        );
      },
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Services",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Everything you need to ship AI-powered products",
          style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.6)),
        ),
        const SizedBox(height: 48),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: [
            HoverCard(
              child: _ServiceTile(
                icon: Icons.analytics_outlined,
                title: "AI Analytics",
                subtitle: "Turn data into decisions with real-time insights.",
              ),
            ),
            HoverCard(
              child: _ServiceTile(
                icon: Icons.smart_toy_outlined,
                title: "AI Chatbots",
                subtitle: "Conversational AI that understands context.",
              ),
            ),
            HoverCard(
              child: _ServiceTile(
                icon: Icons.autorenew,
                title: "Automation",
                subtitle: "Workflows that scale without the headcount.",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ServiceTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.deepOrange, size: 36),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pricing",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Simple pricing that scales with you",
          style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.6)),
        ),
        const SizedBox(height: 48),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: const [
            _PricingCard(
              title: "Starter",
              price: "\$19",
              period: "/mo",
              features: ["Up to 10K requests", "3 team members", "Email support"],
              cta: "Start free trial",
              highlighted: false,
            ),
            _PricingCard(
              title: "Pro",
              price: "\$49",
              period: "/mo",
              features: ["Up to 100K requests", "Unlimited team", "Priority support", "API access"],
              cta: "Get Started",
              highlighted: true,
            ),
            _PricingCard(
              title: "Enterprise",
              price: "Custom",
              period: "",
              features: ["Unlimited everything", "Dedicated success manager", "SLA"],
              cta: "Contact sales",
              highlighted: false,
            ),
          ],
        ),
      ],
    );
  }
}

class _PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String period;
  final List<String> features;
  final String cta;
  final bool highlighted;

  const _PricingCard({
    required this.title,
    required this.price,
    required this.period,
    required this.features,
    required this.cta,
    required this.highlighted,
  });

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (highlighted)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: highlighted ? Colors.deepOrange : Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  period,
                  style: TextStyle(fontSize: 14, color: Colors.white60),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline,
                          size: 18, color: Colors.deepOrange.withValues(alpha: 0.9)),
                      const SizedBox(width: 10),
                      Text(f, style: TextStyle(fontSize: 14, color: Colors.white70)),
                    ],
                  ),
                )),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: highlighted ? Colors.deepOrange : Colors.white12,
                  foregroundColor: highlighted ? Colors.white : Colors.white70,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Text(cta),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final body = Text(
      "We build modern AI solutions for next-gen businesses. Our platform helps teams ship intelligent products faster—with less complexity and more control.",
      style: TextStyle(
        fontSize: 17,
        height: 1.6,
        color: Colors.white.withValues(alpha: 0.8),
      ),
    );
    final stats = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _AboutStat(value: "50+", label: "Enterprise customers"),
        const SizedBox(height: 16),
        _AboutStat(value: "99.9%", label: "Uptime SLA"),
        const SizedBox(height: 16),
        _AboutStat(value: "24/7", label: "Support"),
      ],
    );
    return LayoutBuilder(
      builder: (context, constraints) {
        final useRow = constraints.maxWidth > 640;
        return Column(
          children: [
            Text(
              "About us",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            useRow
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: body),
                      const SizedBox(width: 48),
                      Expanded(child: stats),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      body,
                      const SizedBox(height: 32),
                      stats,
                    ],
                  ),
          ],
        );
      },
    );
  }
}

class _AboutStat extends StatelessWidget {
  final String value;
  final String label;

  const _AboutStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(fontSize: 15, color: Colors.white70),
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.08))),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink("Privacy"),
              const SizedBox(width: 24),
              _footerLink("Terms"),
              const SizedBox(width: 24),
              _footerLink("Contact"),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "© 2026 AI SaaS. All rights reserved.",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String label) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(foregroundColor: Colors.white54),
      child: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }
}
