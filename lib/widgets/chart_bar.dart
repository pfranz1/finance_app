import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _label;
  final double _totalSpent;
  final double _pctOfTotal;

  ChartBar(this._label, this._totalSpent, this._pctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constaints) {
      return Column(
        children: [
          Container(
              height: constaints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text('\$${_totalSpent.toStringAsFixed(0)}'))),
          SizedBox(
            height: constaints.maxHeight * 0.05,
          ),
          Container(
            height: constaints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: _pctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constaints.maxHeight * 0.05,
          ),
          Container(
              height: constaints.maxHeight * 0.15, child: Text('$_label')),
        ],
      );
    });
  }
}
