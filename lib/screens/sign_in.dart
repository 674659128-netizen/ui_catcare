import 'package:flutter/material.dart';
import 'package:ui_catcare/screens/home.dart';
import 'package:ui_catcare/screens/register.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _rememberPassword = true;

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F0),
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      // Add Profile Photo Section
                      _buildAddProfileSection(),
                      const SizedBox(height: 32),

                      // Input Field 1: Email / Phone Number
                      _buildInputField(
                        controller: _emailOrPhoneController,
                        hintText: 'อีเมล / เบอร์โทรศัพท์',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 16),

                      // Input Field 2: Password
                      _buildInputField(
                        controller: _passwordController,
                        hintText: 'รหัสผ่าน',
                        icon: Icons.lock_outline,
                        isPassword: true,
                        isPasswordVisible: _isPasswordVisible,
                        onTogglePassword: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(height: 14),

                      // Remember Password Checkbox & Forgot Password Row
                      _buildRememberAndForgotRow(),
                      const SizedBox(height: 32),

                      // Login Submit Button
                      _buildLoginSubmitButton(context),
                      const SizedBox(height: 24),

                      // Register Link
                      _buildRegisterLink(context),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF382A25),
              size: 22,
            ),
          ),
          const Text(
            'เข้าสู่ระบบ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF382A25),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.pets,
              color: Color(0xFFEE5F4B),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddProfileSection() {
    return Column(
      children: [
        Container(
          width: 108,
          height: 108,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE8DF),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFF7D5C8), width: 2),
          ),
          child: const Center(
            child: Icon(
              Icons.camera_alt_outlined,
              color: Color(0xFF7C6B63),
              size: 38,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'เพิ่มรูปโปรไฟล์',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF7C6B63),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onTogglePassword,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEADBDB), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF382A25),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFA2938C),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF8E7E78),
            size: 22,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xFF8E7E78),
                    size: 22,
                  ),
                  onPressed: onTogglePassword,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildRememberAndForgotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _rememberPassword,
                activeColor: const Color(0xFFF06A55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                onChanged: (value) {
                  setState(() {
                    _rememberPassword = value ?? false;
                  });
                },
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'จำรหัสผ่าน',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF7C6B63),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            // Handle forgot password
          },
          child: const Text(
            'ลืมรหัสผ่าน?',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF8E7E78),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginSubmitButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFF06A55),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF06A55).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'เข้าสู่ระบบ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      },
      child: RichText(
        text: const TextSpan(
          text: 'ยังไม่มีบัญชี? ',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF7C6B63),
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: 'สมัครสมาชิก',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFF06A55),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
