import 'package:freezed_annotation/freezed_annotation.dart';
import 'address_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? id,
    required String firstName,
    required String lastName,
    required DateTime birthDate,
    @Default([]) List<Address> addresses,
    DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
