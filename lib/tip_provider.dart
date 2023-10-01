import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TipTimeProvider with ChangeNotifier {
  double? _service = 0.0;
  double? _tip = 0.0;
  double _total = 0.00;
  double _final = 0.00;
  double get getTip => _final;

  void addService(String ammount) {
    if (_service != null) {
      _service = double.tryParse(ammount);
      notifyListeners();
    }
  }

  double? calcTip(num? percent) {
    if (_service == null || percent == null) {
      return null;
    }
    String x = percent.toString();
    _tip = double.tryParse(x);
    _total = _service! * _tip!;
    notifyListeners();
    return _total;
  }

  void roundUp(y) {
    if (y == true) {
      _total = _total.ceilToDouble();
      notifyListeners();
    } else {
      _total = _total;
      notifyListeners();
    }
  }

  void showTip() {
    _final = _total;
    notifyListeners();
  }
}
