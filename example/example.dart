import 'package:kilobyte/kilobyte.dart';

void main() {
  const size = Size(kilobytes: 1536);

  print(size); // 1.50mb
  print(size.inMegabytes); // 1
  print(size.inKilobytes); // 1536
  print(size.inBytes); // 1572864

  // Also various operations:
  print(size + Size(megabytes: 1)); // 2.50mb
  print(size - Size(kilobytes: 512)); // 1.00mb
  print(size * 2); // 3.00mb
  print(size ~/ 2); // 0.75mb

  // And comparisons:
  print(size > Size(megabytes: 1)); // false
  print(size < Size(megabytes: 1)); // true

  // [512kb, 1.00mb, 1.50mb]
  print(
    [
      Size(megabytes: 1),
      Size(kilobytes: 512),
      Size(kilobytes: 1536),
    ]..sort(),
  );

  // And more!
}
