// Copyright 2017, Google Inc.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

/// If `COVERALLS_TOKEN` is present in the environment, collect coverage.
void main() {
  final coverallsToken = Platform.environment['COVERALLS_TOKEN'];
  if (coverallsToken == null) {
    print('No environment variable COVERALLS_TOKEN found.');
    return;
  }
  print('Installing dart_coveralls...');
  var result = Process.runSync('pub', ['global', 'activate', 'dart_coveralls']);
  print(result.stdout ?? result.stderr);
  if (result.exitCode != 0) {
    exitCode = 1;
    return;
  }
  print('Running dart_coveralls...');
  result = Process.runSync('pub', [
    'global',
    'run',
    'dart_coveralls',
    'report',
    '--token=$coverallsToken',
    '--retry=2',
    '--exclude-test-files',
    'test/kilobyte_test.dart',
  ]);
  print(result.stdout);
  print(result.stderr);
  if (result.exitCode != 0) {
    exitCode = 1;
  } else {
    print('Done!');
  }
}
