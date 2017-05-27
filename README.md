# kilobyte

[![pub package](https://img.shields.io/pub/v/kilobyte.svg)](https://pub.dartlang.org/packages/kilobyte)
[![Build Status](https://travis-ci.org/dart-lang/kilobyte.svg)](https://travis-ci.org/dart-lang/kilobyte)
[![Coverage Status](https://coveralls.io/repos/github/dart-lang/kilobyte/badge.svg?branch=master)](https://coveralls.io/github/dart-lang/kilobyte?branch=master)

Cross-platform human-readable file size.

**Warning**: This is not an official Google or Dart project.

## Installation

```yaml
dependencies:
  kilobyte: ^0.1.0
```

## Usage

Use the [`Size`](https://www.dartdocs.org/documentation/kilobyte/latest/kilobyte/Size-class.html)
class similar to how you would the `Duration` class from the core libraries:

```dart
final size = new Size(gigabyte: 1, megabytes: 500);
print(size); // 1.50 Gb
```