import 'package:flutter/material.dart';
import 'package:ielts/constants/colors.dart';
import 'package:ielts/gen/fonts.gen.dart';
import 'package:shamsi_date/shamsi_date.dart';

class DatePickerOverlay extends StatefulWidget {
  final Jalali initialDate;
  final ValueChanged<Jalali> onDateSelected;

  const DatePickerOverlay({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<DatePickerOverlay> createState() => _DatePickerOverlayState();
}

class _DatePickerOverlayState extends State<DatePickerOverlay> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;
  late Jalali _selectedDate;
  late Jalali _viewingDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _viewingDate = widget.initialDate;
  }

  @override
  void didUpdateWidget(covariant DatePickerOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialDate != widget.initialDate) {
      _selectedDate = widget.initialDate;
      _viewingDate = widget.initialDate;
    }
  }

  void _toggleCalendar() {
    if (_isOpen) {
      _closeCalendar();
    } else {
      _openCalendar();
    }
  }

  void _openCalendar() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  void _closeCalendar() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => StatefulBuilder(
        builder: (context, setOverlayState) {
          int offset =
              (Jalali(_viewingDate.year, _viewingDate.month, 1).weekDay - 1) %
              7;
          int totalDays = _viewingDate.monthLength;

          String formattedDate =
              '${_selectedDate.year}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.day.toString().padLeft(2, '0')}';

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: _closeCalendar,
                  behavior: HitTestBehavior.opaque,
                  child: Container(color: AppColors.datePickerOverlayBg),
                ),
                CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset.zero,
                  child: Material(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: _closeCalendar,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'تاریخ :$formattedDate',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: FontFamily.iranSansXRegular,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.keyboard_arrow_up,
                            size: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0.0, size.height + 6.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 280,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.datePickerOverlayCardBg,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.datePickerOverlayShadowBox,
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${_viewingDate.formatter.mN} ${_viewingDate.year}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.datePickerOverlayTextPrimary,
                                  fontFamily: FontFamily.iranSansXMedium,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setOverlayState(() {
                                        _viewingDate = _viewingDate.addDays(
                                          -30,
                                        );
                                      });
                                    },
                                    child: const Icon(
                                      Icons.chevron_left,
                                      size: 20,
                                      color: AppColors
                                          .datePickerOverlayTextPrimary,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setOverlayState(() {
                                        _viewingDate = _viewingDate.addDays(30);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.chevron_right,
                                      size: 20,
                                      color: AppColors
                                          .datePickerOverlayTextPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: ['ش', 'ی', 'د', 'س', 'چ', 'پ', 'ج'].map((
                              day,
                            ) {
                              return SizedBox(
                                width: 32,
                                child: Text(
                                  day,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors
                                        .datePickerOverlayTextSecondary,
                                    fontFamily: FontFamily.iranSansXRegular,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 9.0),
                            child: Divider(
                              height: 5,
                              thickness: 1,
                              color: AppColors.datePickerOverlayDividerColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              ...List.generate(
                                offset,
                                (_) => const SizedBox(width: 35, height: 35),
                              ),
                              ...List.generate(totalDays, (index) {
                                int dayNumber = index + 1;
                                Jalali currentDay = Jalali(
                                  _viewingDate.year,
                                  _viewingDate.month,
                                  dayNumber,
                                );
                                bool isSelected =
                                    currentDay.year == _selectedDate.year &&
                                    currentDay.month == _selectedDate.month &&
                                    currentDay.day == _selectedDate.day;
                                bool isFriday = currentDay.weekDay == 7;

                                Color dayTextColor;
                                if (isSelected) {
                                  dayTextColor =
                                      AppColors.datePickerOverlayTextPrimary;
                                } else if (isFriday) {
                                  dayTextColor =
                                      AppColors.datePickerOverlayFridayColor;
                                } else if (dayNumber <= 15) {
                                  dayTextColor = AppColors
                                      .datePickerOverlayDayTextFirstHalf;
                                } else {
                                  dayTextColor = AppColors
                                      .datePickerOverlayDayTextSecondHalf;
                                }

                                return SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: GestureDetector(
                                    onTap: () {
                                      setOverlayState(() {
                                        _selectedDate = currentDay;
                                      });
                                    },
                                    child: Center(
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected
                                              ? AppColors
                                                    .datePickerOverlaySelectedDayBg
                                              : AppColors
                                                    .datePickerOverlayUnselectedDayBg,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$dayNumber',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: dayTextColor,
                                              fontFamily:
                                                  FontFamily.iranSansXMedium,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 24,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      final now = Jalali.now();
                                      setOverlayState(() {
                                        _selectedDate = now;
                                        _viewingDate = now;
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                        AppColors.datePickerOverlayTodayBtnBg,
                                      ),
                                      overlayColor: WidgetStateProperty.all(
                                        Colors.transparent,
                                      ),
                                      elevation: WidgetStateProperty.all(0),
                                      padding: WidgetStateProperty.all(
                                        EdgeInsets.zero,
                                      ),
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'امروز',
                                      style: TextStyle(
                                        color: AppColors
                                            .datePickerOverlayTodayBtnText,
                                        fontSize: 10,
                                        fontFamily: FontFamily.iranSansXMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 21),
                              Expanded(
                                child: SizedBox(
                                  height: 24,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedDate = _selectedDate;
                                      });
                                      widget.onDateSelected(_selectedDate);
                                      _closeCalendar();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                        AppColors
                                            .datePickerOverlayChoiceBtnContainer,
                                      ),
                                      overlayColor: WidgetStateProperty.all(
                                        Colors.transparent,
                                      ),
                                      elevation: WidgetStateProperty.all(0),
                                      padding: WidgetStateProperty.all(
                                        EdgeInsets.zero,
                                      ),
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'انتخاب',
                                      style: TextStyle(
                                        color: AppColors
                                            .datePickerOverlayChoiceBtnText,
                                        fontSize: 10,
                                        fontFamily: FontFamily.iranSansXMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        '${_selectedDate.year}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.day.toString().padLeft(2, '0')}';

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleCalendar,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'تاریخ :$formattedDate',
              style: TextStyle(
                color: _isOpen ? Colors.transparent : Colors.black,
                fontSize: 14,
                fontFamily: FontFamily.iranSansXRegular,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              _isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 18,
              color: _isOpen ? Colors.transparent : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
