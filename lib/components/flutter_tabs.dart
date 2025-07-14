import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum FlutterTabStyle {
  underlined,
  filled,
  outlined,
  pills,
}

class FlutterTabs extends StatefulWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final FlutterTabStyle style;
  final bool isScrollable;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? indicatorColor;

  const FlutterTabs({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    this.style = FlutterTabStyle.underlined,
    this.isScrollable = false,
    this.selectedColor,
    this.unselectedColor,
    this.indicatorColor,
  });

  @override
  State<FlutterTabs> createState() => _FlutterTabsState();
}

class _FlutterTabsState extends State<FlutterTabs>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _indicatorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _indicatorAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FlutterTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.style) {
      case FlutterTabStyle.underlined:
        return _buildUnderlinedTabs();
      case FlutterTabStyle.filled:
        return _buildFilledTabs();
      case FlutterTabStyle.outlined:
        return _buildOutlinedTabs();
      case FlutterTabStyle.pills:
        return _buildPillTabs();
    }
  }

  Widget _buildUnderlinedTabs() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: widget.isScrollable
            ? _buildScrollableTabs()
            : _buildFixedTabs(),
      ),
    );
  }

  Widget _buildFilledTabs() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: _buildFixedTabs(),
      ),
    );
  }

  Widget _buildOutlinedTabs() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: _buildFixedTabs(),
      ),
    );
  }

  Widget _buildPillTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = index == widget.selectedIndex;

          return Padding(
            padding: EdgeInsets.only(
              right: index < widget.tabs.length - 1 ? 8 : 0,
            ),
            child: _buildPillTab(tab, index, isSelected),
          );
        }).toList(),
      ),
    );
  }

  List<Widget> _buildFixedTabs() {
    return widget.tabs.asMap().entries.map((entry) {
      final index = entry.key;
      final tab = entry.value;
      final isSelected = index == widget.selectedIndex;

      return Expanded(
        child: _buildTab(tab, index, isSelected),
      );
    }).toList();
  }

  List<Widget> _buildScrollableTabs() {
    return widget.tabs.asMap().entries.map((entry) {
      final index = entry.key;
      final tab = entry.value;
      final isSelected = index == widget.selectedIndex;

      return _buildTab(tab, index, isSelected);
    }).toList();
  }

  Widget _buildTab(String tab, int index, bool isSelected) {
    final selectedColor = widget.selectedColor ?? AppTheme.primaryColor;
    final unselectedColor = widget.unselectedColor ?? Colors.grey[600]!;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: _getTabDecoration(isSelected),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onTabSelected(index),
          borderRadius: BorderRadius.circular(
            widget.style == FlutterTabStyle.filled ||
                    widget.style == FlutterTabStyle.outlined
                ? 6
                : 0,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: _getTabTextColor(isSelected),
                ),
                child: Text(tab),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPillTab(String tab, int index, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppTheme.primaryColor : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onTabSelected(index),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : Colors.grey[700],
              ),
              child: Text(tab),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration? _getTabDecoration(bool isSelected) {
    switch (widget.style) {
      case FlutterTabStyle.underlined:
        return BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                    color: widget.indicatorColor ?? AppTheme.primaryColor,
                    width: 2,
                  ),
                )
              : null,
        );
      
      case FlutterTabStyle.filled:
        return BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        );
      
      case FlutterTabStyle.outlined:
        return BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        );
      
      case FlutterTabStyle.pills:
        return null;
    }
  }

  Color _getTabTextColor(bool isSelected) {
    final selectedColor = widget.selectedColor ?? AppTheme.primaryColor;
    final unselectedColor = widget.unselectedColor ?? Colors.grey[600]!;

    switch (widget.style) {
      case FlutterTabStyle.underlined:
      case FlutterTabStyle.filled:
      case FlutterTabStyle.pills:
        return isSelected ? selectedColor : unselectedColor;
      
      case FlutterTabStyle.outlined:
        return isSelected ? Colors.white : unselectedColor;
    }
  }
}

// Custom Tab Bar with Content
class FlutterTabView extends StatefulWidget {
  final List<FlutterTab> tabs;
  final int initialIndex;
  final FlutterTabStyle style;
  final ValueChanged<int>? onTabChanged;

  const FlutterTabView({
    super.key,
    required this.tabs,
    this.initialIndex = 0,
    this.style = FlutterTabStyle.underlined,
    this.onTabChanged,
  });

  @override
  State<FlutterTabView> createState() => _FlutterTabViewState();
}

class _FlutterTabViewState extends State<FlutterTabView> {
  late int _selectedIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterTabs(
          tabs: widget.tabs.map((tab) => tab.title).toList(),
          selectedIndex: _selectedIndex,
          style: widget.style,
          onTabSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            widget.onTabChanged?.call(index);
          },
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.tabs.length,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTabChanged?.call(index);
            },
            itemBuilder: (context, index) {
              return widget.tabs[index].content;
            },
          ),
        ),
      ],
    );
  }
}

class FlutterTab {
  final String title;
  final Widget content;
  final IconData? icon;

  const FlutterTab({
    required this.title,
    required this.content,
    this.icon,
  });
}