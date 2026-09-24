ss HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});
  import 'package:flutter/material.dart';

  cla
  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  int _selectedSubTab = 0; // 0: น้ำหนัก, 1: วัคซีน, 2: การรักษา
  int _bottomNavIndex = 3; // 3: สุขภาพ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F0),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Top Navigation Bar
            _buildAppBar(context),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2. Sub-Tab Segmented Bar
                    _buildSubTabBar(),
                    const SizedBox(height: 24),

                    // 3. Tab Content
                    if (_selectedSubTab == 0) _buildWeightTabContent(),
                    if (_selectedSubTab == 1) _buildVaccineTabContent(),
                    if (_selectedSubTab == 2) _buildTreatmentTabContent(),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 4. Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF382A25),
              size: 22,
            ),
          ),
          const Text(
            'สุขภาพ',
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

  Widget _buildSubTabBar() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEFE2DC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          _buildSubTabItem(0, 'น้ำหนัก'),
          _buildSubTabItem(1, 'วัคซีน'),
          _buildSubTabItem(2, 'การรักษา'),
        ],
      ),
    );
  }

  Widget _buildSubTabItem(int index, String label) {
    final isSelected = _selectedSubTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSubTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF06A55) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.white : const Color(0xFF6E5D57),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeightTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        const Text(
          'น้ำหนัก (กิโลกรัม)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF382A25),
          ),
        ),
        const SizedBox(height: 16),

        // Weight Line Chart Box
        Container(
          width: double.infinity,
          height: 220,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFEADBDB), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: CustomPaint(
            painter: WeightChartPainter(),
          ),
        ),
        const SizedBox(height: 24),

        // Latest Weight Record Section
        const Text(
          'บันทึกน้ำหนักล่าสุด',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF382A25),
          ),
        ),
        const SizedBox(height: 12),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFEADBDB), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'วันที่ 29 มิ.ย. 2568',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF7C6B63),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '3.6 กก.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF382A25),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'หมายเหตุ',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFFA2938C),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'สุขภาพแข็งแรงดี',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF382A25),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: Color(0xFF8E7E78),
                      size: 20,
                    ),
                    onPressed: () {
                      // Edit note action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Record Weight Button
        Container(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('เปิดหน้าบันทึกน้ำหนัก'),
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
              '+ บันทึกน้ำหนัก',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVaccineTabContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        children: [
          Icon(Icons.vaccines, size: 48, color: Color(0xFFF06A55)),
          SizedBox(height: 12),
          Text(
            'ประวัติวัคซีน',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF382A25),
            ),
          ),
          SizedBox(height: 6),
          Text(
            'เข็มล่าสุด: ฉีดวัคซีนพิษสุนัขบ้า (15 พ.ค. 2568)',
            style: TextStyle(color: Color(0xFF7C6B63)),
          ),
        ],
      ),
    );
  }

  Widget _buildTreatmentTabContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Column(
        children: [
          Icon(Icons.medical_services, size: 48, color: Color(0xFF8B62CC)),
          SizedBox(height: 12),
          Text(
            'ประวัติการรักษา',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF382A25),
            ),
          ),
          SizedBox(height: 6),
          Text(
            'ไม่พบประวัติการรักษารุนแรง',
            style: TextStyle(color: Color(0xFF7C6B63)),
          ),
        ],
      ),
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
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
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

/// Custom painter to draw line chart for cat weight over time
class WeightChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double paddingLeft = 30.0;
    const double paddingRight = 20.0;
    const double paddingTop = 30.0;
    const double paddingBottom = 35.0;

    final double chartWidth = size.width - paddingLeft - paddingRight;
    final double chartHeight = size.height - paddingTop - paddingBottom;

    // Y values: min 2.0 kg, max 4.0 kg
    const double minWeight = 2.0;
    const double maxWeight = 4.0;

    final List<Map<String, dynamic>> dataPoints = [
      {'date': '1 มิ.ย.', 'weight': 2.8},
      {'date': '8 มิ.ย.', 'weight': 3.0},
      {'date': '15 มิ.ย.', 'weight': 3.2},
      {'date': '22 มิ.ย.', 'weight': 3.4},
      {'date': '29 มิ.ย.', 'weight': 3.6},
    ];

    // Grid lines (Horizontal dotted lines)
    final gridPaint = Paint()
      ..color = const Color(0xFFEADBDB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    const List<double> yLabels = [2.5, 3.0, 3.5, 4.0];
    for (var label in yLabels) {
      final double normalizedY = (label - minWeight) / (maxWeight - minWeight);
      final double y = size.height - paddingBottom - (normalizedY * chartHeight);
      
      // Draw light horizontal grid line
      canvas.drawLine(
        Offset(paddingLeft, y),
        Offset(size.width - paddingRight, y),
        gridPaint,
      );

      // Y-axis label text
      final textSpan = TextSpan(
        text: label.toStringAsFixed(1),
        style: const TextStyle(
          color: Color(0xFFA2938C),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(paddingLeft - textPainter.width - 6, y - textPainter.height / 2),
      );
    }

    // Line Paint
    final linePaint = Paint()
      ..color = const Color(0xFFF06A55)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final pointDotPaint = Paint()..color = const Color(0xFFF06A55);
    final pointInnerPaint = Paint()..color = Colors.white;

    final path = Path();
    final List<Offset> points = [];

    for (int i = 0; i < dataPoints.length; i++) {
      final double x = paddingLeft + (i * (chartWidth / (dataPoints.length - 1)));
      final double weight = dataPoints[i]['weight'];
      final double normalizedY = (weight - minWeight) / (maxWeight - minWeight);
      final double y = size.height - paddingBottom - (normalizedY * chartHeight);

      final Offset pt = Offset(x, y);
      points.add(pt);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // X-axis Date label
      final dateSpan = TextSpan(
        text: dataPoints[i]['date'],
        style: const TextStyle(
          color: Color(0xFF7C6B63),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      );
      final datePainter = TextPainter(
        text: dateSpan,
        textDirection: TextDirection.ltr,
      )..layout();
      datePainter.paint(
        canvas,
        Offset(x - datePainter.width / 2, size.height - paddingBottom + 10),
      );
    }

    // Draw connecting line
    canvas.drawPath(path, linePaint);

    // Draw dots & value text above each point
    for (int i = 0; i < points.length; i++) {
      final Offset pt = points[i];
      final double val = dataPoints[i]['weight'];

      // Red Outer Circle
      canvas.drawCircle(pt, 5.5, pointDotPaint);
      // White Inner Circle
      canvas.drawCircle(pt, 2.5, pointInnerPaint);

      // Value text above dot
      final valSpan = TextSpan(
        text: val.toStringAsFixed(1),
        style: const TextStyle(
          color: Color(0xFF382A25),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      );
      final valPainter = TextPainter(
        text: valSpan,
        textDirection: TextDirection.ltr,
      )..layout();
      valPainter.paint(
        canvas,
        Offset(pt.dx - valPainter.width / 2, pt.dy - 18),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
