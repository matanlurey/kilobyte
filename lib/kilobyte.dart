import 'package:meta/meta.dart';

/// A measurment of payload or footprint, such as `3.12mb` or `312 kilobytes`.
///
/// A [Size] represents an amount of data. The size may be "negative" to
/// represent size being reduced, such as when data is compressed or removed.
///
/// Sizes are based on the IEC standard; 1 kilobyte is 1024 bytes and so on.
@immutable
final class Size implements Comparable<Size> {
  /// Creates a new [Size] object whose value is the sum of all its arguments.
  ///
  /// The individual argmuments can be larger than the number in the argument
  /// in the next larger unit. For example, `Size(kilobytes: 2048)` is the same
  /// as `Size(megabytes: 1, kilobytes: 1024)`. Likewise, arguments can be
  /// negative, in which case they underflow and subtract from the total.
  ///
  /// If the total number of bytes cannot be represented an [int], the number
  /// of bytes might overflow and be truncated to a small number of bits, or
  /// it might lose precision.
  ///
  /// ```dart
  /// const size = Size(
  ///   terabytes: 1,
  ///   gigabytes: 2,
  /// );
  /// print(size); // 1.002tb
  /// ```
  const Size({
    int petabytes = 0,
    int terabytes = 0,
    int gigabytes = 0,
    int megabytes = 0,
    int kilobytes = 0,
    int bytes = 0,
  }) : this._(
          0 +
              petabytes * 1024 * 1024 * 1024 * 1024 * 1024 +
              terabytes * 1024 * 1024 * 1024 * 1024 +
              gigabytes * 1024 * 1024 * 1024 +
              megabytes * 1024 * 1024 +
              kilobytes * 1024 +
              bytes,
        );

  const Size._(this.inBytes);

  /// The number of total bytes in this size.
  ///
  /// For example, a size of one kilobyte has 1024 bytes:
  /// ```dart
  /// const size = Size(kilobytes: 1);
  /// print(size.inBytes); // 1024
  /// ```
  final int inBytes;

  /// The number of full kilobytes in this size.
  ///
  /// For example, a size of 1536 bytes has 1.5 kilobytes:
  /// ```dart
  /// const size = Size(bytes: 1536);
  /// print(size.inKilobytes); // 1
  /// ```
  int get inKilobytes => inBytes ~/ 1024;

  /// The number of full megabytes in this size.
  ///
  /// For example, a size of 1.5 megabytes has 1536 kilobytes:
  /// ```dart
  /// const size = Size(kilobytes: 1536);
  /// print(size.inMegabytes); // 1
  /// ```
  int get inMegabytes => inKilobytes ~/ 1024;

  /// The number of full gigabytes in this size.
  ///
  /// For example, a size of 1.5 gigabytes has 1536 megabytes:
  /// ```dart
  /// const size = Size(megabytes: 1536);
  /// print(size.inGigabytes); // 1
  /// ```
  int get inGigabytes => inMegabytes ~/ 1024;

  /// The number of full terabytes in this size.
  ///
  /// For example, a size of 1.5 terabytes has 1536 gigabytes:
  /// ```dart
  /// const size = Size(gigabytes: 1536);
  /// print(size.inTerabytes); // 1
  /// ```
  int get inTerabytes => inGigabytes ~/ 1024;

  /// The number of full petabytes in this size.
  ///
  /// For example, a size of 1.5 petabytes has 1536 terabytes:
  /// ```dart
  /// const size = Size(terabytes: 1536);
  /// print(size.inPetabytes); // 1
  /// ```
  int get inPetabytes => inTerabytes ~/ 1024;

  /// Adds this size and [other] and returns the sum.
  Size operator +(Size other) => Size._(inBytes + other.inBytes);

  /// Subtracts [other] from this size and returns the difference.
  Size operator -(Size other) => Size._(inBytes - other.inBytes);

  /// Multiplies this size by [factor] and returns the product.
  ///
  /// When [factor] is a double, the resulting size is rounded up:
  /// ```dart
  /// const size = Size(kilobytes: 1) * 1.15;
  /// print(size.inBytes); // 1178, even though 1.15 * 1024 is 1177.6
  Size operator *(num factor) => Size._((inBytes * factor).ceil());

  /// Divides this size by [divisor] and returns the quotient.
  ///
  /// When the result is not an integer, the quotient is rounded down:
  /// ```dart
  /// const size = Size(kilobytes: 1) / 3;
  /// print(size.inBytes); // 341, even though 1024 / 3 is 341.333...
  /// ```
  ///
  /// The [quotient] must not be `0`.
  Size operator ~/(int quotient) {
    if (quotient == 0) {
      throw ArgumentError.value(quotient, 'quotient', 'Cannot divide by zero');
    }
    return Size._(inBytes ~/ quotient);
  }

  /// Returns the absolute length of this size.
  Size abs() => Size._(inBytes.abs());

  /// Whether this size is negative.
  bool get isNegative => inBytes.isNegative;

  /// Returns a new size with the opposite sign of this size.
  Size operator -() => Size._(-inBytes);

  /// Whether this size is less than [other].
  bool operator <(Size other) => inBytes < other.inBytes;

  /// Whether this size is less than or equal to [other].
  bool operator <=(Size other) => inBytes <= other.inBytes;

  /// Whether this size is greater than [other].
  bool operator >(Size other) => inBytes > other.inBytes;

  /// Whether this size is greater than or equal to [other].
  bool operator >=(Size other) => inBytes >= other.inBytes;

  @override
  bool operator ==(Object other) => other is Size && inBytes == other.inBytes;

  @override
  int get hashCode => inBytes.hashCode;

  @override
  int compareTo(Size other) => inBytes.compareTo(other.inBytes);

  /// Returns a string representation of this size suitable as a default.
  ///
  /// The largest unit that is not zero is used, and the number is rounded to
  /// two decimal places by default. For example, `'${Size(kilobytes: 1536)}'`
  /// is `'1.5mb'`. The smallest unit displayed is kilobytes.
  ///
  /// The [fractionDigits] argument can be used to specify the number of digits
  /// after the decimal point. For example, `'${Size(kilobytes: 1536)}'` with
  /// `fractionDigits: 0` is `'1mb'`. [fractionDigits] must be non-negative.
  ///
  /// The [seperator] argument can be used to specify a string to insert between
  /// the number and the unit. For example, `'${Size(kilobytes: 1536)}'` with
  /// `seperator: ' '` is `'1 mb'`.
  @override
  String toString({
    int fractionDigits = 2,
    String seperator = '',
  }) {
    RangeError.checkNotNegative(fractionDigits, 'fractionDigits');
    final (value, suffix) = switch (abs()) {
      >= const Size(petabytes: 1) => (inTerabytes / 1024, 'pb'),
      >= const Size(terabytes: 1) => (inGigabytes / 1024, 'tb'),
      >= const Size(gigabytes: 1) => (inMegabytes / 1024, 'gb'),
      >= const Size(megabytes: 1) => (inKilobytes / 1024, 'mb'),
      _ => (inBytes / 1024, 'kb'),
    };
    return '${value.toStringAsFixed(fractionDigits)}$seperator$suffix';
  }
}
