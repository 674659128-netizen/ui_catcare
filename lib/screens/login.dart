import 'package:flutter/material.dart';
import 'package:ui_catcare/screens/register.dart';
import 'package:ui_catcare/screens/sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // App Title & Logo
              _buildHeader(),
              const SizedBox(height: 6),
              // Subtitle
              const Text(
                'ดูแลแมว...ให้ดีที่สุด',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6E5D57),
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 20),
              // Illustration area with Cat & Background Decor
              SizedBox(
                height: 330,
                width: double.infinity,
                child: CustomPaint(
                  painter: CatIllustrationPainter(),
                ),
              ),
              const SizedBox(height: 24),
              // Action Buttons
              _buildLoginButton(context),
              const SizedBox(height: 14),
              _buildRegisterButton(context),
              const SizedBox(height: 24),
              // Divider
              _buildDivider(),
              const SizedBox(height: 20),
              // Social Login Options
              _buildSocialLoginButtons(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Cat',
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF382A25),
                ),
              ),
            ],
          ),
        ),
        // Custom Paw Icon in 'C' or between
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: Color(0xFFEE5F4B),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.pets,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'are',
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFEE5F4B),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 4),
        // Small heart at the end of title
        const Padding(
          padding: EdgeInsets.only(bottom: 28.0),
          child: Icon(
            Icons.favorite,
            color: Color(0xFFEE5F4B),
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, color: Colors.white, size: 26),
            SizedBox(width: 12),
            Text(
              'เข้าสู่ระบบ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFF06A55), width: 1.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, color: Color(0xFFF06A55), size: 26),
            SizedBox(width: 12),
            Text(
              'สมัครสมาชิก',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF382A25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xFFE2D6D0),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'หรือเข้าสู่ระบบด้วย',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF8E7E78),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xFFE2D6D0),
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // LINE Button
        _buildSocialButton(
          bgColor: const Color(0xFF06C755),
          child: const Text(
            'LINE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 13,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(width: 24),
        // Facebook Button
        _buildSocialButton(
          bgColor: const Color(0xFF1877F2),
          child: const Text(
            'f',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        const SizedBox(width: 24),
        // Google Button
        _buildSocialButton(
          bgColor: Colors.white,
          isBordered: true,
          child: const Text(
            'G',
            style: TextStyle(
              color: Color(0xFFEA4335),
              fontWeight: FontWeight.w900,
              fontSize: 26,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required Color bgColor,
    required Widget child,
    bool isBordered = false,
  }) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: isBordered ? Border.all(color: const Color(0xFFE5E5E5), width: 1) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}

/// Custom painter to render the illustration of Cat, Plant, Cat Tree, Heart, Yarn ball
class CatIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;

    // 1. Background Paw Prints
    _drawPawPrints(canvas, size);

    // 2. Plant in terracotta pot on the left
    _drawPlant(canvas, size);

    // 3. Cat tree / scratching post on the right
    _drawCatTree(canvas, size);

    // 4. Yarn ball at bottom right
    _drawYarnBall(canvas, size);

    // 5. Heart speech bubble above plant
    _drawHeartBubble(canvas, size);

    // 6. Cute Cat in the center
    _drawCat(canvas, cx, cy + 10);
  }

  void _drawPawPrints(Canvas canvas, Size size) {
    final pawPaint = Paint()..color = const Color(0xFFF7E6DE);

    // Left background paw
    canvas.drawCircle(Offset(size.width * 0.12, size.height * 0.22), 6, pawPaint);
    canvas.drawCircle(Offset(size.width * 0.10, size.height * 0.18), 2.5, pawPaint);
    canvas.drawCircle(Offset(size.width * 0.13, size.height * 0.16), 2.5, pawPaint);
    canvas.drawCircle(Offset(size.width * 0.16, size.height * 0.18), 2.5, pawPaint);

    // Right background paw
    canvas.drawCircle(Offset(size.width * 0.88, size.height * 0.28), 7, pawPaint);
    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.23), 2.5, pawPaint);
    canvas.drawCircle(Offset(size.width * 0.88, size.height * 0.21), 2.5, pawPaint);
    canvas.drawCircle(Offset(size.width * 0.91, size.height * 0.24), 2.5, pawPaint);
  }

  void _drawPlant(Canvas canvas, Size size) {
    final potPaint = Paint()..color = const Color(0xFFE8A593);
    final potRimPaint = Paint()..color = const Color(0xFFDF9583);
    final leafPaint = Paint()..color = const Color(0xFF8BA683);
    final leafLightPaint = Paint()..color = const Color(0xFFA5BF9D);

    final double potBottomY = size.height * 0.85;
    final double potTopY = size.height * 0.65;
    final double potX = size.width * 0.18;

    // Pot Body
    final potPath = Path()
      ..moveTo(potX - 22, potTopY)
      ..lineTo(potX + 22, potTopY)
      ..lineTo(potX + 16, potBottomY)
      ..lineTo(potX - 16, potBottomY)
      ..close();
    canvas.drawPath(potPath, potPaint);

    // Pot Rim
    final rrectRim = RRect.fromRectAndRadius(
      Rect.fromLTRB(potX - 25, potTopY - 8, potX + 25, potTopY),
      const Radius.circular(3),
    );
    canvas.drawRRect(rrectRim, potRimPaint);

    // Leaves
    final stemPaint = Paint()
      ..color = const Color(0xFF708B68)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    // Stems
    canvas.drawLine(Offset(potX, potTopY), Offset(potX, size.height * 0.42), stemPaint);
    canvas.drawLine(Offset(potX, potTopY + 10), Offset(potX - 25, size.height * 0.48), stemPaint);
    canvas.drawLine(Offset(potX, potTopY + 10), Offset(potX + 22, size.height * 0.50), stemPaint);

    // Oval leaves
    void drawLeaf(double x, double y, double width, double height, double angle, Paint paint) {
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(angle);
      canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: width, height: height), paint);
      canvas.restore();
    }

    drawLeaf(potX - 25, size.height * 0.46, 26, 14, -0.4, leafPaint);
    drawLeaf(potX + 22, size.height * 0.48, 26, 14, 0.4, leafLightPaint);
    drawLeaf(potX - 20, size.height * 0.54, 24, 12, -0.3, leafLightPaint);
    drawLeaf(potX + 18, size.height * 0.58, 24, 12, 0.3, leafPaint);
    drawLeaf(potX, size.height * 0.38, 22, 34, 0, leafLightPaint);
  }

  void _drawCatTree(Canvas canvas, Size size) {
    final woodPaint = Paint()..color = const Color(0xFFF3DCCE);
    final shadowPaint = Paint()..color = const Color(0xFFE4CBBD);
    final polePaint = Paint()..color = const Color(0xFFDFBDAB);

    final double rightX = size.width * 0.85;

    // Platform Base
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(rightX - 35, size.height * 0.75, rightX + 35, size.height * 0.78),
        const Radius.circular(4),
      ),
      woodPaint,
    );

    // Pole
    canvas.drawRect(
      Rect.fromLTRB(rightX - 6, size.height * 0.42, rightX + 6, size.height * 0.75),
      polePaint,
    );

    // Top Box/House
    final houseRect = RRect.fromRectAndRadius(
      Rect.fromLTRB(rightX - 32, size.height * 0.32, rightX + 32, size.height * 0.52),
      const Radius.circular(8),
    );
    canvas.drawRRect(houseRect, woodPaint);

    // House Opening Arch
    final archPath = Path()
      ..addArc(Rect.fromLTWH(rightX - 16, size.height * 0.38, 32, 32), 3.14, 3.14)
      ..lineTo(rightX + 16, size.height * 0.52)
      ..lineTo(rightX - 16, size.height * 0.52)
      ..close();
    canvas.drawPath(archPath, shadowPaint);

    // Hanging toy ball
    final stringPaint = Paint()
      ..color = const Color(0xFFC0A090)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawLine(Offset(rightX - 18, size.height * 0.44), Offset(rightX - 18, size.height * 0.54), stringPaint);
    canvas.drawCircle(Offset(rightX - 18, size.height * 0.56), 5, Paint()..color = const Color(0xFFEE8A78));
  }

  void _drawYarnBall(Canvas canvas, Size size) {
    final yarnPaint = Paint()..color = const Color(0xFFF29B8B);
    final linePaint = Paint()
      ..color = const Color(0xFFDF7B6B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    final Offset center = Offset(size.width * 0.84, size.height * 0.83);
    canvas.drawCircle(center, 15, yarnPaint);

    // Swirl lines on yarn
    canvas.drawArc(Rect.fromCircle(center: center, radius: 10), 0.2, 2.5, false, linePaint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: 12), 2.8, 2.2, false, linePaint);

    // Unraveling yarn line
    final threadPath = Path()
      ..moveTo(center.dx + 12, center.dy + 6)
      ..quadraticBezierTo(size.width * 0.90, size.height * 0.88, size.width * 0.95, size.height * 0.86);
    canvas.drawPath(threadPath, linePaint);
  }

  void _drawHeartBubble(Canvas canvas, Size size) {
    final bubbleX = size.width * 0.23;
    final bubbleY = size.height * 0.26;

    // Bubble shadow & body
    final bubblePaint = Paint()..color = Colors.white;
    final bubbleRRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(bubbleX, bubbleY), width: 50, height: 42),
      const Radius.circular(20),
    );
    canvas.drawRRect(bubbleRRect, bubblePaint);

    // Bubble pointer tail
    final tailPath = Path()
      ..moveTo(bubbleX - 10, bubbleY + 18)
      ..lineTo(bubbleX - 18, bubbleY + 28)
      ..lineTo(bubbleX - 2, bubbleY + 20)
      ..close();
    canvas.drawPath(tailPath, bubblePaint);

    // Red Heart
    final heartPaint = Paint()..color = const Color(0xFFEE5B49);
    final heartPath = Path();
    final double hx = bubbleX;
    final double hy = bubbleY - 2;

    heartPath.moveTo(hx, hy + 6);
    heartPath.cubicTo(hx - 12, hy - 6, hx - 12, hy - 14, hx, hy - 8);
    heartPath.cubicTo(hx + 12, hy - 14, hx + 12, hy - 6, hx, hy + 6);
    canvas.drawPath(heartPath, heartPaint);
  }

  void _drawCat(Canvas canvas, double cx, double cy) {
    // Paints
    final bodyWhite = Paint()..color = Colors.white;
    final bodyGrey = Paint()..color = const Color(0xFF8E8885);
    final lightGrey = Paint()..color = const Color(0xFFEBEAE8);
    final darkStripes = Paint()..color = const Color(0xFF5A524E);
    final innerEarPink = Paint()..color = const Color(0xFFFFAAA6);
    final collarRed = Paint()..color = const Color(0xFFEE5B49);
    final bellYellow = Paint()..color = const Color(0xFFFFD15C);
    final eyePaint = Paint()..color = const Color(0xFF2A221E);
    final eyeShine = Paint()..color = Colors.white;
    final nosePink = Paint()..color = const Color(0xFFEE8A78);
    final lineOutline = Paint()
      ..color = const Color(0xFF4A3E39)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    // --- 1. Tail ---
    final tailPath = Path()
      ..moveTo(cx + 40, cy + 80)
      ..cubicTo(cx + 110, cy + 70, cx + 110, cy - 20, cx + 80, cy - 10)
      ..cubicTo(cx + 95, cy + 10, cx + 85, cy + 50, cx + 45, cy + 90)
      ..close();
    canvas.drawPath(tailPath, bodyGrey);

    // Tail stripes
    final tailStripe1 = Path()
      ..moveTo(cx + 82, cy + 20)
      ..lineTo(cx + 95, cy + 25)
      ..lineTo(cx + 92, cy + 35)
      ..lineTo(cx + 78, cy + 30)
      ..close();
    canvas.drawPath(tailStripe1, darkStripes);

    final tailStripe2 = Path()
      ..moveTo(cx + 70, cy + 45)
      ..lineTo(cx + 85, cy + 50)
      ..lineTo(cx + 80, cy + 60)
      ..lineTo(cx + 66, cy + 55)
      ..close();
    canvas.drawPath(tailStripe2, darkStripes);

    // --- 2. Body ---
    final bodyRect = Rect.fromLTRB(cx - 55, cy + 30, cx + 55, cy + 115);
    canvas.drawRRect(RRect.fromRectAndRadius(bodyRect, const Radius.circular(45)), lightGrey);

    // Grey patches on back/sides
    final backPatchLeft = Path()
      ..addArc(Rect.fromLTWH(cx - 55, cy + 30, 45, 80), 1.5, 3.14);
    canvas.drawPath(backPatchLeft, bodyGrey);

    final backPatchRight = Path()
      ..addArc(Rect.fromLTWH(cx + 10, cy + 30, 45, 80), -0.5, 3.14);
    canvas.drawPath(backPatchRight, bodyGrey);

    // --- 3. Paws ---
    // Front Paws
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(cx - 32, cy + 90, 26, 30), const Radius.circular(13)),
      bodyWhite,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(cx + 6, cy + 90, 26, 30), const Radius.circular(13)),
      bodyWhite,
    );
    // Paw lines
    canvas.drawLine(Offset(cx - 24, cy + 110), Offset(cx - 24, cy + 118), lineOutline);
    canvas.drawLine(Offset(cx - 16, cy + 110), Offset(cx - 16, cy + 118), lineOutline);
    canvas.drawLine(Offset(cx + 14, cy + 110), Offset(cx + 14, cy + 118), lineOutline);
    canvas.drawLine(Offset(cx + 22, cy + 110), Offset(cx + 22, cy + 118), lineOutline);

    // --- 4. Head ---
    // Ears (Behind Head)
    // Left Ear
    final leftEar = Path()
      ..moveTo(cx - 55, cy - 10)
      ..lineTo(cx - 70, cy - 70)
      ..lineTo(cx - 20, cy - 40)
      ..close();
    canvas.drawPath(leftEar, bodyGrey);

    final leftInnerEar = Path()
      ..moveTo(cx - 50, cy - 15)
      ..lineTo(cx - 63, cy - 60)
      ..lineTo(cx - 25, cy - 38)
      ..close();
    canvas.drawPath(leftInnerEar, innerEarPink);

    // Right Ear
    final rightEar = Path()
      ..moveTo(cx + 55, cy - 10)
      ..lineTo(cx + 70, cy - 70)
      ..lineTo(cx + 20, cy - 40)
      ..close();
    canvas.drawPath(rightEar, bodyGrey);

    final rightInnerEar = Path()
      ..moveTo(cx + 50, cy - 15)
      ..lineTo(cx + 63, cy - 60)
      ..lineTo(cx + 25, cy - 38)
      ..close();
    canvas.drawPath(rightInnerEar, innerEarPink);

    // Head Base Oval
    final headRect = Rect.fromCenter(center: Offset(cx, cy - 10), width: 124, height: 104);
    canvas.drawOval(headRect, lightGrey);

    // Head Grey Cap & Tabby Stripes
    final headCap = Path()
      ..addArc(Rect.fromCenter(center: Offset(cx, cy - 25), width: 120, height: 75), 3.14, 3.14);
    canvas.drawPath(headCap, bodyGrey);

    // Center forehead stripes
    final stripe1 = Path()
      ..moveTo(cx - 8, cy - 56)
      ..lineTo(cx, cy - 36)
      ..lineTo(cx + 8, cy - 56)
      ..close();
    canvas.drawPath(stripe1, darkStripes);

    final stripeLeft = Path()
      ..moveTo(cx - 26, cy - 50)
      ..lineTo(cx - 18, cy - 35)
      ..lineTo(cx - 14, cy - 48)
      ..close();
    canvas.drawPath(stripeLeft, darkStripes);

    final stripeRight = Path()
      ..moveTo(cx + 26, cy - 50)
      ..lineTo(cx + 18, cy - 35)
      ..lineTo(cx + 14, cy - 48)
      ..close();
    canvas.drawPath(stripeRight, darkStripes);

    // --- 5. Facial Features ---
    // Cheeks / White Muzzle
    final muzzleRect = Rect.fromCenter(center: Offset(cx, cy + 8), width: 88, height: 50);
    canvas.drawOval(muzzleRect, bodyWhite);

    // Big Cute Eyes
    final double eyeY = cy - 8;
    canvas.drawCircle(Offset(cx - 28, eyeY), 14, eyePaint);
    canvas.drawCircle(Offset(cx + 28, eyeY), 14, eyePaint);

    // Eye Shine reflections
    canvas.drawCircle(Offset(cx - 31, eyeY - 4), 5, eyeShine);
    canvas.drawCircle(Offset(cx - 24, eyeY + 4), 2.5, eyeShine);
    canvas.drawCircle(Offset(cx + 25, eyeY - 4), 5, eyeShine);
    canvas.drawCircle(Offset(cx + 32, eyeY + 4), 2.5, eyeShine);

    // Pink Nose
    final nosePath = Path()
      ..moveTo(cx - 6, cy + 2)
      ..lineTo(cx + 6, cy + 2)
      ..lineTo(cx, cy + 8)
      ..close();
    canvas.drawPath(nosePath, nosePink);

    // Mouth (W shape)
    final mouthPath = Path()
      ..moveTo(cx - 10, cy + 12)
      ..quadraticBezierTo(cx - 5, cy + 17, cx, cy + 12)
      ..quadraticBezierTo(cx + 5, cy + 17, cx + 10, cy + 12);
    canvas.drawPath(mouthPath, lineOutline);

    // Whiskers
    // Left Whiskers
    canvas.drawLine(Offset(cx - 45, cy + 4), Offset(cx - 75, cy + 1), lineOutline);
    canvas.drawLine(Offset(cx - 45, cy + 10), Offset(cx - 72, cy + 12), lineOutline);
    // Right Whiskers
    canvas.drawLine(Offset(cx + 45, cy + 4), Offset(cx + 75, cy + 1), lineOutline);
    canvas.drawLine(Offset(cx + 45, cy + 10), Offset(cx + 72, cy + 12), lineOutline);

    // --- 6. Red Collar with Golden Bell ---
    final collarRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx, cy + 38), width: 80, height: 12),
      const Radius.circular(6),
    );
    canvas.drawRRect(collarRect, collarRed);

    // Golden Bell
    canvas.drawCircle(Offset(cx, cy + 44), 10, bellYellow);
    canvas.drawCircle(Offset(cx, cy + 44), 10, lineOutline..style = PaintingStyle.stroke..strokeWidth = 1.2);
    canvas.drawCircle(Offset(cx, cy + 45), 2.5, Paint()..color = const Color(0xFF382A25));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
