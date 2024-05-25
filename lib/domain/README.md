# Domain layer

## 📁 entities

- contains entity classes such as User, AuthInfo, ...
- class naming convention: [object] + 'Entity'.\
  E.g. UserEntity
- File naming convention: [object] + '_entity';\
  E.g. user_entity
- Example:

```dart
/// File name: user_entity.dart
/// 
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    @Default(UserEntity.defaultId) int id,
    @Default(UserEntity.defaultEmail) String email,
    @Default(UserEntity.defaultFirstName) String firstName,
    @Default(UserEntity.defaultLastName) String lastName,
    @Default(UserEntity.defaultAvatar) String avatar,
  }) = _UserEntity;

  static const defaultId = 0;
  static const defaultEmail = '';
  static const defaultFirstName = '';
  static const defaultLastName = '';
  static const defaultAvatar = '';
}
```

## 📁 repositories

- Abstract Repository classes are declared in the project.
- Example:

```dart
abstract class AuthRepository {
  Future<bool> register(String email, String password);

  Future<bool> login(String email, String password);

  Future<bool> logOut();
}
```