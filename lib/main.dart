import 'package:aiservicewebsite/Pages/blogs_page.dart';
import 'package:aiservicewebsite/Pages/admin_page.dart';
import 'package:aiservicewebsite/Pages/blog_pages/blog_ai_first_saas_architecture_page.dart';
import 'package:aiservicewebsite/Pages/blog_pages/blog_ai_saas_platform_page.dart';
import 'package:aiservicewebsite/Pages/blog_pages/blog_event_driven_ml_page.dart';
import 'package:aiservicewebsite/Pages/blog_pages/blog_flutter_web_dashboards_page.dart';
import 'package:aiservicewebsite/Pages/blog_pages/blog_mlops_checklist_page.dart';
import 'package:aiservicewebsite/Pages/blog_pages/blog_mvp_to_scalable_ai_page.dart';
import 'package:aiservicewebsite/Pages/blog_pages/blog_pricing_ai_saas_page.dart';
import 'package:aiservicewebsite/Pages/blog_pages/blog_production_ai_apis_page.dart';
import 'package:aiservicewebsite/Pages/solution_computer_vision_page.dart';
import 'package:aiservicewebsite/Pages/solution_document_intelligence_page.dart';
import 'package:aiservicewebsite/Pages/solution_machine_learning_models_page.dart';
import 'package:aiservicewebsite/Pages/solution_natural_language_processing_page.dart';
import 'package:aiservicewebsite/Pages/solution_predictive_analytics_page.dart';
import 'package:aiservicewebsite/Pages/solution_voice_ai_page.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets/navigation.dart';
import 'pages/home_page.dart';
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
      title: 'Dazzel - AI Solutions & Services',
      theme: AppTheme.darkTheme(),
      home: MainPage(),
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
      case 'blogs':
        return BlogPage(onNavigate: _navigateTo);
      case 'blog_ai_saas_platform':
        return BlogAiSaasPlatformPage(onNavigate: _navigateTo);
      case 'blog_production_ai_apis':
        return BlogProductionAiApisPage(onNavigate: _navigateTo);
      case 'blog_ai_first_saas_architecture':
        return BlogAiFirstSaasArchitecturePage(onNavigate: _navigateTo);
      case 'blog_mvp_to_scalable_ai':
        return BlogMvpToScalableAiPage(onNavigate: _navigateTo);
      case 'blog_pricing_ai_saas':
        return BlogPricingAiSaasPage(onNavigate: _navigateTo);
      case 'blog_flutter_web_dashboards':
        return BlogFlutterWebDashboardsPage(onNavigate: _navigateTo);
      case 'blog_event_driven_ml':
        return BlogEventDrivenMlPage(onNavigate: _navigateTo);
      case 'blog_mlops_checklist':
        return BlogMlopsChecklistPage(onNavigate: _navigateTo);
      case 'solutions':
        return SolutionsPage(onNavigate: _navigateTo);
      case 'solution_ml_models':
        return MachineLearningModelsPage(onNavigate: _navigateTo);
      case 'solution_nlp':
        return NaturalLanguageProcessingPage(onNavigate: _navigateTo);
      case 'solution_computer_vision':
        return ComputerVisionPage(onNavigate: _navigateTo);
      case 'solution_predictive_analytics':
        return PredictiveAnalyticsPage(onNavigate: _navigateTo);
      case 'solution_document_intelligence':
        return DocumentIntelligencePage(onNavigate: _navigateTo);
      case 'solution_voice_ai':
        return VoiceAISolutionsPage(onNavigate: _navigateTo);
      case 'contact':
        return ContactPage(onNavigate: _navigateTo);
      case 'about':
        return const AboutPage();
      case 'admin':
        return const AdminPage();
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
          Navigation(currentPage: _currentPage, onNavigate: _navigateTo),
          Expanded(child: _buildPage()),
        ],
      ),
    );
  }
}
