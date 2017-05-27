// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:kilobyte/kilobyte.dart';
import 'package:test/test.dart';

void main() {
  test('should convert bytes to human readable strings', () {
    const {
      '0 B': const Size(bytes: 0),
      '10.0 B': const Size(bytes: 10),
      '1.00 kB': const Size(kilobytes: 1),
      '1.50 GB': const Size(gigabytes: 1, megabytes: 500),
    }.forEach((string, size) {
      expect(size.toString(), string);
    });
  });

  test('should implement the `Comparable` interface', () {
    expect(new Size(bytes: 10).compareTo(new Size(bytes: 10)), 0);
    expect(new Size(bytes: 10).compareTo(new Size(bytes: 20)), lessThan(0));
    expect(new Size(bytes: 20).compareTo(new Size(bytes: 10)), greaterThan(0));
  });
}
