import 'package:flutter/cupertino.dart';

/// Lerps between two strings.
class StringLerp {
  StringLerp._(this.from, this.to, this.quotient, this._endMode);

  factory StringLerp(String from, String to) {
    if (from.characters.length > to.characters.length) {
      return StringLerp._(
        from.characters.take(to.length),
        to.characters,
        from.characters.skip(to.length),
        -1,
      );
    } else {
      return StringLerp._(
        from.characters,
        to.characters.take(from.length),
        to.characters.skip(to.length),
        from.characters.length < to.characters.length ? 1 : 0,
      );
    }
  }

  final Characters from;
  final Characters to;
  final Characters quotient;

  /// 0 = keep ending empty
  /// -1 = remove characters from the end by the [t]
  /// 1 = add characters to the end by the [t]
  final int _endMode;

  String lerp(double t) {
    var ending = Characters.empty;

    switch (_endMode) {
      case 1:
        final quotientCurrentLength = (t * quotient.length).round();
        ending = quotient.take(quotientCurrentLength);
      case -1:
        final quotientCurrentLength = (t * quotient.length).round();
        ending = quotient.take(quotient.length - quotientCurrentLength);
    }

    final current = StringBuffer();

    /// from length is equals to to length
    final fromIterator = from.iterator;
    final toIterator = to.iterator;

    while (fromIterator.moveNext() && toIterator.moveNext()) {
      final fromCodeUnits = fromIterator.utf16CodeUnits;
      final toCodeUnits = toIterator.utf16CodeUnits;

      if (fromCodeUnits.length >= 2 || toCodeUnits.length >= 2) {
        if (t < 0.5) {
          current.write(fromIterator.current);
        } else {
          current.write(toIterator.current);
        }
      } else {
        final fromCode = fromCodeUnits.first;
        final toCode = toCodeUnits.first;
        final distance = toCode - fromCode;
        final shift = (t * distance.abs()).round();
        final currentCode = distance >= 0 ? fromCode + shift : toCode - shift;
        current.writeCharCode(currentCode);
      }
    }

    return '$current$ending';
  }
}
