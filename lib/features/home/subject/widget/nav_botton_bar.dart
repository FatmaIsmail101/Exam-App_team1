import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNav({required this.selectedIndex, required this.onTap});

  static const _items = [
    ('Explore', 'assets/icons/home.svg'),
    ('Result',  'assets/icons/result.svg'),
    ('Profile', 'assets/icons/profile.svg'),
  ];

  static const _blue = Color(0xFF02369C);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: List.generate(_items.length, (i) {
          final selected = i == selectedIndex;
          final (label, icon) = _items[i];
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ✅ pill خلف الأيقونة لما يكون selected
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: selected
                          ? _blue.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      icon,
                      width: 22,
                      height: 22,
                      colorFilter: ColorFilter.mode(
                        selected ? _blue : Colors.grey.shade400,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: selected
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: selected ? _blue : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}