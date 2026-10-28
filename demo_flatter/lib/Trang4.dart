import 'package:flutter/material.dart';

class Trang4 extends StatefulWidget {
  const Trang4({super.key});

  @override
  State<Trang4> createState() => _Trang4State();
}

class _Trang4State extends State<Trang4> {
  int _selectedNavIndex = 0;

  static const _backgroundColor = Color(0xFFF5F5FA);
  static const _redColor = Color(0xFFB32D37);
  static const _textColor = Color(0xFF1F2937);
  static const _blueColor = Color(0xFF1687E8);

  static const _features = [
    _Feature('Thông báo', Icons.notifications_active, Color(0xFFE63345)),
    _Feature('Hộp thư', Icons.mark_email_unread, Color(0xFF1687E8)),
    _Feature('Lịch công tác', Icons.calendar_month, Color(0xFFFF9867)),
    _Feature(
      'Lịch giảng dạy/\ncoi thi',
      Icons.event_available,
      Color(0xFFD6384B),
    ),
    _Feature(
      'Đề xuất tạm\nngưng',
      Icons.pause_circle_filled,
      Color(0xFFFFC42E),
    ),
    _Feature('Đề xuất dạy bù', Icons.co_present, Color(0xFF08A982)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 190,
            child: ColoredBox(color: _redColor),
          ),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildGreeting(),
                  const SizedBox(height: 38),
                  _buildTodayCard(),
                  const SizedBox(height: 30),
                  _buildSectionHeader(),
                  const SizedBox(height: 20),
                  _buildFeatureGrid(),
                  const SizedBox(height: 22),
                  _buildPageIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildGreeting() {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFFFD52A),
            border: Border.all(color: Colors.white, width: 3),
          ),
          alignment: Alignment.center,
          child: const Text(
            'G',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'Xin chào, Đinh Hoàng Gia',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.16),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24),
          ),
          child: const Icon(Icons.notifications, color: Colors.white, size: 27),
        ),
      ],
    );
  }

  Widget _buildTodayCard() {
    return Container(
      constraints: const BoxConstraints(minHeight: 96),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.menu_book_rounded, size: 52, color: _blueColor),
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: Icon(
                    Icons.task_alt_rounded,
                    size: 23,
                    color: Color(0xFF26A5F5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(width: 1, height: 58, color: const Color(0xFFE4E7EC)),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lịch hôm nay:',
                  style: TextStyle(color: Color(0xFF526071), fontSize: 17),
                ),
                SizedBox(height: 5),
                Text(
                  'Không tìm thấy lịch cá nhân',
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      children: [
        Container(
          width: 5,
          height: 28,
          decoration: BoxDecoration(
            color: _blueColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 11),
        const Expanded(
          child: Text(
            'Chức năng',
            style: TextStyle(
              color: _textColor,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.tune, size: 18),
          label: const Text('Tùy chỉnh'),
          style: OutlinedButton.styleFrom(
            foregroundColor: _textColor,
            backgroundColor: Colors.white,
            side: const BorderSide(color: Color(0xFFE4EAF0)),
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _features.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 8,
        mainAxisExtent: 118,
      ),
      itemBuilder: (context, index) {
        final feature = _features[index];
        return Column(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(feature.icon, size: 40, color: feature.color),
            ),
            const SizedBox(height: 8),
            Text(
              feature.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: _textColor,
                fontSize: 14,
                height: 1.25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 6,
          decoration: BoxDecoration(
            color: _blueColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: Color(0xFF9BCBF1),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    const items = [
      (label: 'Trang chủ', icon: Icons.home_rounded),
      (label: 'Lịch công tác', icon: Icons.calendar_month_outlined),
      (label: 'Thông báo', icon: Icons.ballot_outlined),
      (label: 'Cá nhân', icon: Icons.person_outline),
    ];

    return SafeArea(
      top: false,
      child: Container(
        height: 66,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.black.withValues(alpha: 0.06)),
          ),
        ),
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = _selectedNavIndex == index;
            final color = isSelected ? _redColor : const Color(0xFF526071);
            return Expanded(
              child: InkWell(
                onTap: () => setState(() => _selectedNavIndex = index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 25, color: color),
                    const SizedBox(height: 3),
                    Text(
                      item.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _Feature {
  const _Feature(this.label, this.icon, this.color);

  final String label;
  final IconData icon;
  final Color color;
}
