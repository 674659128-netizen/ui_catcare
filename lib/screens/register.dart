import 'package:flutter/material.dart';
import 'package:ui_catcare/screens/sign_in.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
                      const SizedBox(height: 12),
                      // Profile Avatar Illustration
                      _buildAvatarSection(),
                      const SizedBox(height: 28),

                      // Input Fields
                      _buildInputField(
                        controller: _nameController,
                        hintText: 'ชื่อ-นามสกุล',
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 16),

                      _buildInputField(
                        controller: _emailController,
                        hintText: 'อีเมล',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      _buildInputField(
                        controller: _phoneController,
                        hintText: 'เบอร์โทรศัพท์',
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),

                      _buildInputField(
                        controller: _passwordController,
                        hintText: 'ตั้งรหัสผ่าน',
                        icon: Icons.lock_outline,
                        isPassword: true,
                        isPasswordVisible: _isPasswordVisible,
                        onTogglePassword: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(height: 32),

                      // Register Button
                      _buildRegisterSubmitButton(context),
                      const SizedBox(height: 20),

                      // Already have an account link
                      _buildLoginLink(context),
                      const SizedBox(height: 20),
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
            'สมัครสมาชิก',
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

  Widget _buildAvatarSection() {
    return Container(
      width: 108,
      height: 108,
      decoration: BoxDecoration(
        color: const Color(0xFFFFE8DF),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFF7D5C8), width: 2),
      ),
      child: ClipOval(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(100, 100),
              painter: CatAvatarPainter(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onTogglePassword,
    TextInputType keyboardType = TextInputType.text,
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
        keyboardType: keyboardType,
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

  Widget _buildRegisterSubmitButton(BuildContext context) {
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
          // Handle registration logic or navigation
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('สมัครสมาชิกสำเร็จ!'),
              backgroundColor: Color(0xFFF06A55),
            ),
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
          'สมัครสมาชิก',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      },
      child: RichText(
        text: const TextSpan(
          text: 'มีบัญชีอยู่แล้ว? ',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF7C6B63),
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: 'เข้าสู่ระบบ',
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

/// Custom painter to render cute cat avatar inside registration screen
class CatAvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final bodyWhite = Paint()..color = Colors.white;
    final bodyGrey = Paint()..color = const Color(0xFF8E8885);
    final lightGrey = Paint()..color = const Color(0xFFEBEAE8);
    final darkStripes = Paint()..color = const Color(0xFF5A524E);
    final innerEarPink = Paint()..color = const Color(0xFFFFAAA6);
    final eyePaint = Paint()..color = const Color(0xFF2A221E);
    final eyeShine = Paint()..color = Colors.white;
    final nosePink = Paint()..color = const Color(0xFFEE8A78);
    final lineOutline = Paint()
      ..color = const Color(0xFF4A3E39)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;

    // Ears
    final leftEar = Path()
      ..moveTo(cx - 30, cy - 10)
      ..lineTo(cx - 40, cy - 40)
      ..lineTo(cx - 10, cy - 25)
      ..close();
    canvas.drawPath(leftEar, bodyGrey);

    final leftInnerEar = Path()
      ..moveTo(cx - 28, cy - 12)
      ..lineTo(cx - 36, cy - 35)
      ..lineTo(cx - 14, cy - 24)
      ..close();
    canvas.drawPath(leftInnerEar, innerEarPink);

    final rightEar = Path()
      ..moveTo(cx + 30, cy - 10)
      ..lineTo(cx + 40, cy - 40)
      ..lineTo(cx + 10, cy - 25)
      ..close();
    canvas.drawPath(rightEar, bodyGrey);

    final rightInnerEar = Path()
      ..moveTo(cx + 28, cy - 12)
      ..lineTo(cx + 36, cy - 35)
      ..lineTo(cx + 14, cy - 24)
      ..close();
    canvas.drawPath(rightInnerEar, innerEarPink);

    // Head Base
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, cy), width: 72, height: 60),
      lightGrey,
    );

    // Head Grey Cap
    final headCap = Path()
      ..addArc(Rect.fromCenter(center: Offset(cx, cy - 8), width: 70, height: 45), 3.14, 3.14);
    canvas.drawPath(headCap, bodyGrey);

    // Forehead Stripes
    final stripe = Path()
      ..moveTo(cx - 4, cy - 26)
      ..lineTo(cx, cy - 16)
      ..lineTo(cx + 4, cy - 26)
      ..close();
    canvas.drawPath(stripe, darkStripes);

    // Muzzle / Cheeks
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, cy + 8), width: 52, height: 32),
      bodyWhite,
    );

    // Eyes
    canvas.drawCircle(Offset(cx - 16, cy - 2), 8, eyePaint);
    canvas.drawCircle(Offset(cx + 16, cy - 2), 8, eyePaint);
    canvas.drawCircle(Offset(cx - 18, cy - 4), 3, eyeShine);
    canvas.drawCircle(Offset(cx + 14, cy - 4), 3, eyeShine);

    // Nose
    final nose = Path()
      ..moveTo(cx - 4, cy + 4)
      ..lineTo(cx + 4, cy + 4)
      ..lineTo(cx, cy + 8)
      ..close();
    canvas.drawPath(nose, nosePink);

    // Mouth
    final mouth = Path()
      ..moveTo(cx - 6, cy + 10)
      ..quadraticBezierTo(cx - 3, cy + 14, cx, cy + 10)
      ..quadraticBezierTo(cx + 3, cy + 14, cx + 6, cy + 10);
    canvas.drawPath(mouth, lineOutline);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
