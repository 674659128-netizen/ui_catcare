import 'package:flutter/material.dart';
import 'package:ui_catcare/screens/food_log.dart';
import 'package:ui_catcare/screens/health.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of activity status toggles
  final List<Map<String, dynamic>> _activities = [
    {
      'time': '08:00',
      'title': 'ให้อาหารเช้า',
      'isCompleted': true,
    },
    {
      'time': '12:00',
      'title': 'เปลี่ยนน้ำ/ทำความสะอาด',
      'isCompleted': true,
    },
    {
      'time': '18:00',
      'title': 'ให้อาหารเย็น',
      'isCompleted': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top Header (Greeting & Notification)
              _buildTopHeader(),
              const SizedBox(height: 16),

              // 2. Cat Banner / Avatar Card
              _buildCatBanner(),
              const SizedBox(height: 24),

              // 3. Quick Action Buttons (Feed, Health, Appointment)
              _buildQuickActions(),
              const SizedBox(height: 28),

              // 4. Today's Activities Section
              _buildTodayActivitiesSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // 5. Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'สวัสดีค่ะ',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF7C6B63),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'น้องเหมียว',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF382A25),
              ),
            ),
          ],
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFEADBDB), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF382A25),
              size: 24,
            ),
            onPressed: () {
              // Notification action
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCatBanner() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF2E6), Color(0xFFFFE3D3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF7D5C8), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background paw print 1
          Positioned(
            left: 20,
            top: 20,
            child: Icon(
              Icons.pets,
              color: const Color(0xFFF7D5C8).withOpacity(0.5),
              size: 32,
            ),
          ),

          // Background paw print 2
          Positioned(
            right: 20,
            bottom: 20,
            child: Icon(
              Icons.pets,
              color: const Color(0xFFF7D5C8).withOpacity(0.5),
              size: 28,
            ),
          ),

          // Cat Avatar with Heart Badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF06A55), width: 2.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: CustomPaint(
                    painter: OrangeTabbyCatPainter(),
                  ),
                ),
              ),

              // Floating Heart Badge
              Positioned(
                top: 2,
                right: -2,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEE5F4B),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionItem(
          icon: Icons.set_meal,
          label: 'ให้อาหาร',
          bgColor: const Color(0xFFF06A55),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FoodLogScreen()),
            );
          },
        ),
        _buildActionItem(
          icon: Icons.medical_services,
          label: 'บันทึกสุขภาพ',
          bgColor: const Color(0xFF8B62CC),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HealthScreen()),
            );
          },
        ),
        _buildActionItem(
          icon: Icons.calendar_month,
          label: 'นัดหมาย',
          bgColor: const Color(0xFF4CAF50),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: bgColor.withOpacity(0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF382A25),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayActivitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'กิจกรรมวันนี้',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF382A25),
          ),
        ),
        const SizedBox(height: 14),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _activities.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = _activities[index];
            final bool isCompleted = item['isCompleted'];

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEADBDB), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Time
                  Text(
                    item['time'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF7C6B63),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Title
                  Expanded(
                    child: Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF382A25),
                      ),
                    ),
                  ),
                  // Status Check Toggle
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _activities[index]['isCompleted'] = !isCompleted;
                      });
                    },
                    child: Icon(
                      isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: isCompleted ? const Color(0xFF06C755) : const Color(0xFFC2B6B0),
                      size: 24,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FoodLogScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HealthScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: const Color(0xFFF06A55),
        unselectedItemColor: const Color(0xFF8E7E78),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'บันทึก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'นัดหมาย',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'สุขภาพ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}

/// Custom painter to draw cute orange tabby cat for Home Screen Banner
class OrangeTabbyCatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final orangeFur = Paint()..color = const Color(0xFFF79C42);
    final whiteFur = Paint()..color = Colors.white;
    final darkOrangeStripe = Paint()..color = const Color(0xFFD67B22);
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
      ..moveTo(cx - 32, cy - 10)
      ..lineTo(cx - 42, cy - 44)
      ..lineTo(cx - 12, cy - 28)
      ..close();
    canvas.drawPath(leftEar, orangeFur);

    final leftInner = Path()
      ..moveTo(cx - 30, cy - 12)
      ..lineTo(cx - 38, cy - 38)
      ..lineTo(cx - 16, cy - 26)
      ..close();
    canvas.drawPath(leftInner, innerEarPink);

    final rightEar = Path()
      ..moveTo(cx + 32, cy - 10)
      ..lineTo(cx + 42, cy - 44)
      ..lineTo(cx + 12, cy - 28)
      ..close();
    canvas.drawPath(rightEar, orangeFur);

    final rightInner = Path()
      ..moveTo(cx + 30, cy - 12)
      ..lineTo(cx + 38, cy - 38)
      ..lineTo(cx + 16, cy - 26)
      ..close();
    canvas.drawPath(rightInner, innerEarPink);

    // Head Oval
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, cy), width: 76, height: 64),
      orangeFur,
    );

    // Tabby Stripes on forehead
    final stripe = Path()
      ..moveTo(cx - 4, cy - 28)
      ..lineTo(cx, cy - 18)
      ..lineTo(cx + 4, cy - 28)
      ..close();
    canvas.drawPath(stripe, darkOrangeStripe);

    // White Muzzle / Cheeks
    canvas.drawOval(
      Rect.fromCenter(center: Offset(cx, cy + 8), width: 54, height: 34),
      whiteFur,
    );

    // Eyes
    canvas.drawCircle(Offset(cx - 18, cy - 2), 9, eyePaint);
    canvas.drawCircle(Offset(cx + 18, cy - 2), 9, eyePaint);
    canvas.drawCircle(Offset(cx - 20, cy - 5), 3.5, eyeShine);
    canvas.drawCircle(Offset(cx + 16, cy - 5), 3.5, eyeShine);

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
