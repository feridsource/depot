import 'package:flutter_test/flutter_test.dart';

import 'package:depot/depot.dart';

void main() {
  test('checks key value map', () async {
    Depot depot = Depot();
    depot.setString("testKey", "testValue");
    String? value = await depot.getString("testKey");
    expect(find.text('testValue'), value);
  });
}