import 'package:aiservicewebsite/services/supabase_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import '../theme.dart';
// import '..sevices/supabase_services.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isLoading = false;
  String? _successMessage;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _showMessage(String message, bool isSuccess) {
    setState(() {
      if (isSuccess) {
        _successMessage = message;
        _errorMessage = null;
      } else {
        _errorMessage = message;
        _successMessage = null;
      }
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _successMessage = null;
          _errorMessage = null;
        });
      }
    });
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await SupabaseService().submitContactForm(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        subject: _subjectController.text,
        message: _messageController.text,
      );

      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _subjectController.clear();
      _messageController.clear();

      _showMessage('Thank you! Your message has been sent successfully.', true);
    } catch (e) {
      _showMessage('Failed to submit the form. Please try again.', false);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SingleChildScrollView(
      child: Column(
        children: [
          _HeaderSection(isMobile: isMobile),
          _ContactSection(
            isMobile: isMobile,
            nameController: _nameController,
            emailController: _emailController,
            phoneController: _phoneController,
            subjectController: _subjectController,
            messageController: _messageController,
            isLoading: _isLoading,
            successMessage: _successMessage,
            errorMessage: _errorMessage,
            onSubmit: _submitForm,
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final bool isMobile;

  const _HeaderSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBgSecondary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 40 : 80,
        ),
        child: Column(
          children: [
            Text(
              'Contact ',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: isMobile ? 36 : 48,
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
                      fontSize: isMobile ? 36 : 48,
                      fontWeight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: isMobile ? double.infinity : 700,
              child: Text(
                'Get in touch with our team to discuss your project or learn more about our services',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 14 : 18,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  final bool isMobile;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;
  final VoidCallback onSubmit;
  final GlobalKey<FormState> formKey;

  const _ContactSection({
    required this.isMobile,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.subjectController,
    required this.messageController,
    required this.isLoading,
    required this.successMessage,
    required this.errorMessage,
    required this.onSubmit,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBg,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 48,
          vertical: isMobile ? 40 : 80,
        ),
        child: Column(
          children: [
            if (isMobile)
              Column(

                children: [
                  const SizedBox(width: 32),
                  _FormCard(
                    isMobile: isMobile,
                    nameController: nameController,
                    emailController: emailController,
                    phoneController: phoneController,
                    subjectController: subjectController,
                    messageController: messageController,
                    isLoading: isLoading,
                    successMessage: successMessage,
                    errorMessage: errorMessage,
                    onSubmit: onSubmit,
                    formKey: formKey,
                  ),
                  _ContactInfoCards(isMobile: isMobile),
                ],
              ),
            if (!isMobile)
              Row(
                // spacing: 48,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(width: 48),
                  Expanded(
                    child: _ContactInfoCards(isMobile: isMobile),
                  ),
                  Expanded(
                    child: _FormCard(
                      isMobile: isMobile,
                      nameController: nameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      subjectController: subjectController,
                      messageController: messageController,
                      isLoading: isLoading,
                      successMessage: successMessage,
                      errorMessage: errorMessage,
                      onSubmit: onSubmit,
                      formKey: formKey,
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

class _ContactInfoCards extends StatelessWidget {
  final bool isMobile;

  const _ContactInfoCards({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 24,
      children: [
        const SizedBox(width: 24),
        _InfoCard(
          icon: CupertinoIcons.mail,
          title: 'Email Us',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'info@dartlanguage.com',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
              Text(
                'support@dartlanguage.com',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ),
        _InfoCard(
          icon: Bootstrap.phone,
          title: 'Call Us',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '+1 (555) 123-4567',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
              Text(
                'Mon-Fri, 9am-6pm EST',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ),
        _InfoCard(
          icon: OtherIcons.mapPin,
          title: 'Visit Us',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '123 Tech Street',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
              Text(
                'Silicon Valley, CA 94025',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget content;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBgSecondary,
        border: Border.all(color: AppColors.orange.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: AppColors.orange,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final bool isMobile;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;
  final VoidCallback onSubmit;
  final GlobalKey<FormState> formKey;

  const _FormCard({
    required this.isMobile,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.subjectController,
    required this.messageController,
    required this.isLoading,
    required this.successMessage,
    required this.errorMessage,
    required this.onSubmit,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBgSecondary,
        border: Border.all(color: AppColors.orange.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(32),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send us a Message',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 24),
            if (successMessage != null)
              _MessageBanner(
                message: successMessage!,
                isSuccess: true,
              ),
            if (errorMessage != null)
              _MessageBanner(
                message: errorMessage!,
                isSuccess: false,
              ),
            const SizedBox(height: 24),
            _FormField(
              label: 'Full Name *',
              controller: nameController,
              hint: 'John Doe',
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Name is required';
                return null;
              },
            ),
            const SizedBox(height: 16),
            _FormField(
              label: 'Email Address *',
              controller: emailController,
              hint: 'john@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Email is required';
                if (!RegExp(
                        r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$')
                    .hasMatch(value ?? '')) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _FormField(
              label: 'Phone Number',
              controller: phoneController,
              hint: '+1 (555) 123-4567',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            _SubjectDropdown(controller: subjectController),
            const SizedBox(height: 16),
            _FormField(
              label: 'Message *',
              controller: messageController,
              hint: 'Tell us about your project or inquiry...',
              maxLines: 6,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Message is required';
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  disabledBackgroundColor: AppColors.orange.withValues(alpha: 0.5),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoading)
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white.withValues(alpha: 0.7),
                          ),
                          strokeWidth: 2,
                        ),
                      )
                    else
                      Icon(
                        Bootstrap.send,
                        size: 20,
                      ),
                    const SizedBox(width: 8),
                    Text(
                      isLoading ? 'Sending...' : 'Send Message',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
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

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  const _FormField({
    required this.label,
    required this.controller,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.darkBgTertiary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.orange,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SubjectDropdown extends StatefulWidget {
  final TextEditingController controller;

  const _SubjectDropdown({required this.controller});

  @override
  State<_SubjectDropdown> createState() => _SubjectDropdownState();
}

class _SubjectDropdownState extends State<_SubjectDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subject *',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: _selectedValue,
          items: [
            'General Inquiry',
            'Services Information',
            'AI Solutions',
            'Technical Support',
            'Partnership Opportunity',
          ]
              .map((subject) => DropdownMenuItem(
                    value: subject,
                    child: Text(subject),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() => _selectedValue = value);
            widget.controller.text = value ?? '';
          },
          decoration: InputDecoration(
            hintText: 'Select a subject',
            filled: true,
            fillColor: AppColors.darkBgTertiary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.orange,
                width: 2,
              ),
            ),
          ),
          validator: (value) =>
              value == null || value.isEmpty ? 'Please select a subject' : null,
        ),
      ],
    );
  }
}

class _MessageBanner extends StatelessWidget {
  final String message;
  final bool isSuccess;

  const _MessageBanner({
    required this.message,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSuccess
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.red.withValues(alpha: 0.1),
        border: Border.all(
          color: isSuccess
              ? Colors.green.withValues(alpha: 0.3)
              : Colors.red.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            isSuccess ? Bootstrap.check_circle : CupertinoIcons.alarm,
            color: isSuccess ? Colors.green : Colors.red,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: isSuccess ? Colors.green : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
