import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class TruthTableWidget extends StatefulWidget {
  final List<Map<String, bool>> truthTable;
  final bool inputA;
  final bool inputB;

  const TruthTableWidget({
    super.key,
    required this.truthTable,
    required this.inputA,
    required this.inputB,
  });

  @override
  State<TruthTableWidget> createState() => _TruthTableWidgetState();
}

class _TruthTableWidgetState extends State<TruthTableWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Header with expand/collapse button
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Truth Table',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                ],
              ),
            ),
          ),

          // Table content
          if (_isExpanded) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Table header
                  Row(
                    children: [
                      Expanded(child: _buildHeaderCell(context, 'A')),
                      Expanded(child: _buildHeaderCell(context, 'B')),
                      Expanded(child: _buildHeaderCell(context, 'OUT')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(height: 1),
                  const SizedBox(height: 8),

                  // Table rows
                  ...widget.truthTable.asMap().entries.map((entry) {
                    final row = entry.value;
                    final isCurrentCombination =
                        row['A'] == widget.inputA && row['B'] == widget.inputB;
                    final isOutputOne = row['OUT'] == true;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: isCurrentCombination
                              ? AppTheme.primaryColor.withValues(alpha: 0.12)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: isCurrentCombination
                              ? Border.all(
                                  color: AppTheme.primaryColor.withValues(
                                    alpha: 0.4,
                                  ),
                                  width: 1.5,
                                )
                              : null,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildDataCell(
                                context,
                                row['A']! ? '1' : '0',
                                isCurrentCombination,
                                row['A']!,
                              ),
                            ),
                            Expanded(
                              child: _buildDataCell(
                                context,
                                row['B']! ? '1' : '0',
                                isCurrentCombination,
                                row['B']!,
                              ),
                            ),
                            Expanded(
                              child: _buildDataCell(
                                context,
                                row['OUT']! ? '1' : '0',
                                isCurrentCombination,
                                isOutputOne,
                                isOutput: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHeaderCell(BuildContext context, String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppTheme.primaryColor,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDataCell(
    BuildContext context,
    String text,
    bool isHighlighted,
    bool isValueOne, {
    bool isOutput = false,
  }) {
    Color getTextColor() {
      if (isOutput && isValueOne) {
        return AppTheme.neonCyan;
      }
      if (isValueOne) {
        return AppTheme.primaryColor;
      }
      return AppTheme.textSecondary;
    }

    return Center(
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w500,
          color: getTextColor(),
          letterSpacing: 0.3,
        ),
        child: Text(text),
      ),
    );
  }
}
