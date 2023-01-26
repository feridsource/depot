# depot
Simple shared preferences with encryption option.

**Sample Code**
```dart
    EasyDepot depot = EasyDepot();
    depot.setString("testKey", "testValue"); // set
    String? value = await depot.getString("testKey"); // get
    depot.setSecString("testSecureKey", "testSecureValue"); // set encrypted
    String? secureValue = await depot.getString("testSecureKey"); // get decrypted
```
				
# Licence

Copyright (C) 2023 Ferid Cafer

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.