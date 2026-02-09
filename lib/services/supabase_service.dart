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
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvbW1ocGl6Y3hlZmhpd3FseGVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA0NzMyNTMsImV4cCI6MjA4NjA0OTI1M30.cbAlI6cIclKf0R0p88k8h1J5Tsy69hAdxz6tptHz_Eg',
    );
  }

  SupabaseClient get client => Supabase.instance.client;

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
}
