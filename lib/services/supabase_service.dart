import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();

  factory SupabaseService() {
    return _instance;
  }

  SupabaseService._internal();

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://hommhpizcxefhiwqlxen.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvbW1ocGl6Y3hlZmhpd3FseGVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA0NzMyNTMsImV4cCI6MjA4NjA0OTI1M30.cbAlI6cIclKf0R0p88k8h1J5Tsy69hAdxz6tptHz_Eg',
    );
  }

  SupabaseClient get client => Supabase.instance.client;

  /// CONTACT FORM
  Future<void> submitContactForm({
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String message,
  }) async {
    try {
      await client.from('contact_submissions').insert({
        'name': name,
        'email': email,
        'phone': phone,
        'subject': subject,
        'message': message,
      });
    } catch (e) {
      throw Exception('Failed to submit contact form: $e');
    }
  }

  /// WEBSITE SETTINGS (for admin panel)
  ///
  /// Expects a table `website_settings` with at least:
  /// id (int, pk), hero_title (text), hero_subtitle (text), hero_image_url (text).
  Future<Map<String, dynamic>?> getWebsiteSettings() async {
    final response =
        await client.from('website_settings').select().limit(1).maybeSingle();
    return response;
  }

  Future<void> upsertWebsiteSettings({
    required String heroTitle,
    required String heroSubtitle,
    required String heroImageUrl,
  }) async {
    await client.from('website_settings').upsert({
      'id': 1, // keep a single row we update
      'hero_title': heroTitle,
      'hero_subtitle': heroSubtitle,
      'hero_image_url': heroImageUrl,
    });
  }

  /// EVENTS (for admin panel)
  ///
  /// Expects a table `events` with at least:
  /// id (uuid or int), title (text), date (text), location (text).
  Future<List<Map<String, dynamic>>> getEvents() async {
    final response =
        await client.from('events').select().order('date', ascending: true);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> addEvent({
    required String title,
    required String date,
    required String location,
  }) async {
    await client.from('events').insert({
      'title': title,
      'date': date,
      'location': location,
    });
  }

  Future<void> deleteEvent({required dynamic id}) async {
    await client.from('events').delete().eq('id', id);
  }
}

