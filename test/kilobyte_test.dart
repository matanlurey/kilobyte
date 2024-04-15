import 'package:kilobyte/kilobyte.dart';
import 'package:test/test.dart';

void main() {
  group('petabytes: 1', () {
    test('in terabytes', () {
      const size = Size(petabytes: 1);

      expect(size.inPetabytes, 1);
      expect(size.inTerabytes, 1024);
      expect(size, Size(terabytes: 1024));
    });

    test('in terabytes (negative)', () {
      const size = Size(petabytes: -1);

      expect(size.inTerabytes, -1024);
      expect(size, Size(terabytes: -1024));
    });

    test('toString()', () {
      const size = Size(petabytes: 1);

      expect(size.toString(), '1.00pb');
    });

    test('toString() (negative)', () {
      const size = Size(petabytes: -1);

      expect(size.toString(), '-1.00pb');
    });

    test('toString() (fractional)', () {
      const size = Size(petabytes: 1, terabytes: 512);

      expect(size.toString(), '1.50pb');
    });
  });

  group('terabytes: 1', () {
    test('in gigabytes', () {
      const size = Size(terabytes: 1);

      expect(size.inGigabytes, 1024);
      expect(size, Size(gigabytes: 1024));
    });

    test('in gigabytes (negative)', () {
      const size = Size(terabytes: -1);

      expect(size.inGigabytes, -1024);
      expect(size, Size(gigabytes: -1024));
    });

    test('toString()', () {
      const size = Size(terabytes: 1);

      expect(size.toString(), '1.00tb');
    });

    test('toString() (negative)', () {
      const size = Size(terabytes: -1);

      expect(size.toString(), '-1.00tb');
    });

    test('toString() (fractional)', () {
      const size = Size(terabytes: 1, gigabytes: 512);

      expect(size.toString(), '1.50tb');
    });
  });

  group('gigabytes: 1', () {
    test('in megabytes', () {
      const size = Size(gigabytes: 1);

      expect(size.inMegabytes, 1024);
      expect(size, Size(megabytes: 1024));
    });

    test('in megabytes (negative)', () {
      const size = Size(gigabytes: -1);

      expect(size.inMegabytes, -1024);
      expect(size, Size(megabytes: -1024));
    });

    test('toString()', () {
      const size = Size(gigabytes: 1);

      expect(size.toString(), '1.00gb');
    });

    test('toString() (negative)', () {
      const size = Size(gigabytes: -1);

      expect(size.toString(), '-1.00gb');
    });

    test('toString() (fractional)', () {
      const size = Size(gigabytes: 1, megabytes: 512);

      expect(size.toString(), '1.50gb');
    });
  });

  group('megabytes: 1', () {
    test('in kilobytes', () {
      const size = Size(megabytes: 1);

      expect(size.inKilobytes, 1024);
      expect(size, Size(kilobytes: 1024));
    });

    test('in kilobytes (negative)', () {
      const size = Size(megabytes: -1);

      expect(size.inKilobytes, -1024);
      expect(size, Size(kilobytes: -1024));
    });

    test('toString()', () {
      const size = Size(megabytes: 1);

      expect(size.toString(), '1.00mb');
    });

    test('toString() (negative)', () {
      const size = Size(megabytes: -1);

      expect(size.toString(), '-1.00mb');
    });

    test('toString() (fractional)', () {
      const size = Size(megabytes: 1, kilobytes: 512);

      expect(size.toString(), '1.50mb');
    });
  });

  group('kilobytes: 1', () {
    test('in bytes', () {
      const size = Size(kilobytes: 1);

      expect(size.inBytes, 1024);
      expect(size, Size(bytes: 1024));
    });

    test('in bytes (negative)', () {
      const size = Size(kilobytes: -1);

      expect(size.inBytes, -1024);
      expect(size, Size(bytes: -1024));
    });

    test('toString()', () {
      const size = Size(kilobytes: 1);

      expect(size.toString(), '1.00kb');
    });

    test('toString() (negative)', () {
      const size = Size(kilobytes: -1);

      expect(size.toString(), '-1.00kb');
    });

    test('toString() (fractional)', () {
      const size = Size(kilobytes: 1, bytes: 512);

      expect(size.toString(), '1.50kb');
    });

    test('toString() (fractional < 1)', () {
      const size = Size(bytes: 512);

      expect(size.toString(), '0.50kb');
    });
  });

  test('operator+', () {
    const size1 = Size(bytes: 1);
    const size2 = Size(bytes: 2);

    expect(size1 + size2, Size(bytes: 3));
  });

  test('operator-', () {
    const size1 = Size(bytes: 1);
    const size2 = Size(bytes: 2);

    expect(size1 - size2, Size(bytes: -1));
  });

  test('operator*', () {
    const size = Size(bytes: 2);

    expect(size * 3, Size(bytes: 6));
  });

  test('operator* with double', () {
    const size = Size(bytes: 2);

    expect(size * 2.8, Size(bytes: 6));
  });

  test('operator~/', () {
    const size = Size(bytes: 6);

    expect(size ~/ 3, Size(bytes: 2));
  });

  test('operator ~/ cannot be by 0', () {
    const size = Size(bytes: 6);

    expect(() => size ~/ 0, throwsArgumentError);
  });

  test('abs', () {
    const size = Size(bytes: -1);

    expect(size.abs(), Size(bytes: 1));
  });

  test('isNegative', () {
    const size = Size(bytes: -1);

    expect(size.isNegative, true);
  });

  test('opearator -', () {
    const size = Size(bytes: 1);

    expect(-size, Size(bytes: -1));
  });

  test('operator <', () {
    const size1 = Size(bytes: 1);
    const size2 = Size(bytes: 2);

    expect(size1 < size2, true);
  });

  test('operator <=', () {
    const size1 = Size(bytes: 1);
    const size2 = Size(bytes: 2);

    expect(size1 <= size2, true);
  });

  test('operator >', () {
    const size1 = Size(bytes: 1);
    const size2 = Size(bytes: 2);

    expect(size2 > size1, true);
  });

  test('operator >=', () {
    const size1 = Size(bytes: 1);
    const size2 = Size(bytes: 2);

    expect(size2 >= size1, true);
  });

  test('operator ==', () {
    const size1 = Size(bytes: 1);
    const size2 = Size(bytes: 1);

    expect(size1 == size2, true);
  });

  test('hashCode', () {
    const size = Size(bytes: 1);

    expect(size.hashCode, 1.hashCode);
  });

  test('sort with compareTo', () {
    const size1 = Size(bytes: 1);
    const size2 = Size(bytes: 2);

    expect([size2, size1]..sort(), [size1, size2]);
  });

  test('toString() with fractionDigits=1', () {
    const size = Size(bytes: 1536);

    expect(size.toString(fractionDigits: 1), '1.5kb');
  });

  test('toString() with seperator=" "', () {
    const size = Size(kilobytes: 2);

    expect(size.toString(seperator: ' '), '2.00 kb');
  });
}
