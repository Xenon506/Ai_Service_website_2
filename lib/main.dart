import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'theme.dart';
import 'widgets/navigation.dart';
import 'widgets/footer.dart';
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/solutions_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'services/supabase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Language - AI Solutions & Services',
      theme: AppTheme.darkTheme(),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _currentPage = 'home';

  void _navigateTo(String page) {
    setState(() => _currentPage = page);
    // Scroll to top when navigating
    Scrollable.of(context).position.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildPage() {
    switch (_currentPage) {
      case 'home':
        return HomePage(onNavigate: _navigateTo);
      case 'services':
        return const ServicesPage();
      case 'solutions':
        return const SolutionsPage();
      case 'about':
        return const AboutPage();
      case 'contact':
        return const ContactPage();
      default:
        return HomePage(onNavigate: _navigateTo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      body: Column(
        children: [
          Navigation(
            currentPage: _currentPage,
            onNavigate: _navigateTo,
          ),
          Expanded(
            child: _buildPage(),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
