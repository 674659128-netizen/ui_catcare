import 'package:flutter/material.dart';

class FoodLogScreen extends StatefulWidget {
  const FoodLogScreen({super.key});

  @override
  State<FoodLogScreen> createState() => _FoodLogScreenState();
}

class _FoodLogScreenState extends State<FoodLogScreen> {
  int _selectedSubTab = 0; // 0: อาหารหลัก, 1: ขนม
  int _bottomNavIndex = 1; // 1: บันทึก

  final List<Map<String, dynamic>> _mainMeals = [
    {
      'title': 'อาหารเม็ด (เช้า)',
      'time': '08:00 น.',
      'isCompleted': true,
    },
    {
      'title': 'อาหารเปียก (กลางวัน)',
      'time': '12:00 น.',
      'isCompleted': true,
    },
    {
      'title': 'อาหารเม็ด (เย็น)',
      'time': '18:00 น.',
      'isCompleted': false,
    },
  ];

  final List<Map<String, dynamic>> _treats = [
    {
      'title': 'ขนมแมวเลีย (รสทูน่า)',
      'time': '15:30 น.',
      'isCompleted': true,
    },
    {
      'title': 'ฟรีซดรายไก่กรอบ',
      'time': '20:00 น.',
      'isCompleted': false,
    },
  ];

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
                    // 2. Sub-Tab Segmented Bar (อาหารหลัก / ขนม)
                    _buildSubTabBar(),
                    const SizedBox(height: 24),

                    // 3. Section Title
                    Text(
                      _selectedSubTab == 0 ? 'มื้ออาหารวันนี้' : 'ขนมวันนี้',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF382A25),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 4. Meals or Treats List
                    _buildMealList(),
                    const SizedBox(height: 24),

                    // 5. Additional Note Card
                    _buildAdditionalNotesCard(),
                    const SizedBox(height: 28),

                    // 6. Add Food Log Button
                    _buildAddFoodLogButton(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 7. Bottom Navigation Bar
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
            'บันทึกอาหาร & ขนม',
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
          _buildSubTabItem(0, 'อาหารหลัก'),
          _buildSubTabItem(1, 'ขนม'),
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

  Widget _buildMealList() {
    final list = _selectedSubTab == 0 ? _mainMeals : _treats;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = list[index];
        final bool isCompleted = item['isCompleted'];

        return Container(
          padding: const EdgeInsets.all(16),
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
          child: Row(
            children: [
              // Food Bowl Icon Container
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.set_meal,
                  color: Color(0xFF4CAF50),
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),

              // Title & Time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF382A25),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['time'],
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8E7E78),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Status Text & Check Toggle
              GestureDetector(
                onTap: () {
                  setState(() {
                    list[index]['isCompleted'] = !isCompleted;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      isCompleted ? 'ครบแล้ว' : 'ยังไม่ครบ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: isCompleted ? const Color(0xFF06C755) : const Color(0xFFEE8A78),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: isCompleted ? const Color(0xFF06C755) : const Color(0xFFC2B6B0),
                      size: 22,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAdditionalNotesCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'หมายเหตุเพิ่มเติม',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF382A25),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
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
          child: const Text(
            'น้องเหมียวกินอาหารได้ดี ไม่มีอาการผิดปกติ',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF6E5D57),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddFoodLogButton() {
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('เปิดหน้าเพิ่มบันทึกอาหาร'),
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
          '+ เพิ่มบันทึกอาหาร',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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
