import 'package:easy_depot/easy_depot.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('checks key value map', () async {
    EasyDepot depot = EasyDepot();
    depot.setString("testKey", "testValue");
    String? value = await depot.getString("testKey");
    expect(find.text('testValue'), value);
  });
}