import 'package:flutter/material.dart';

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

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isCurrentCombination
                              ? Theme.of(context).colorScheme.primaryContainer
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: _buildDataCell(
                                context,
                                row['A']! ? '1' : '0',
                                isCurrentCombination,
                              ),
                            ),
                            Expanded(
                              child: _buildDataCell(
                                context,
                                row['B']! ? '1' : '0',
                                isCurrentCombination,
                              ),
                            ),
                            Expanded(
                              child: _buildDataCell(
                                context,
                                row['OUT']! ? '1' : '0',
                                isCurrentCombination,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
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
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDataCell(BuildContext context, String text, bool isHighlighted) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          color: isHighlighted
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : null,
        ),
      ),
    );
  }
}
