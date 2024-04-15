# Kilobyte

A measurement of payload or footprint, such as `3.12mb`, based on the IEC
standard.

[![Pub Package](https://img.shields.io/pub/v/kilobyte.svg)](https://pub.dev/packages/kilobyte)

[![Github Actions](https://github.com/matanlurey/kilobyte/actions/workflows/check.yaml/badge.svg)](https://github.com/matanlurey/kilobyte/actions/workflows/check.yaml)

[![Coverage Status](https://coveralls.io/repos/github/matanlurey/kilobyte/badge.svg)](https://coveralls.io/github/matanlurey/kilobyte)

## Usage

```dart
import 'package:kilobyte/kilobyte.dart';

void main() {
  final size = Size(bytes: 1536);
  print(size); // 1.50kb
}
```

## Contributing

Kilobyte is a tiny, focused package. Within that scope, we're happy to accept
contributions. If you have a feature you'd like to see, feel free to
[file an issue](https://github.com/matanlurey/kilobyte/issues/new) or
[fork and open a pull request](https://github.com/matanlurey/kilobyte/fork).

### CI

This package is:

- Formatted with `dart format`.
- Checked with `dart analyze`.
- Tested with `dart test`, including with code coverage.

See [`github/workflows/check.yaml`](./.github/workflows/check.yaml) for details.

### Coverage

To view the coverage report locally (MacOS):

```shell
brew install lcov
dart run coverage:test_with_coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```
