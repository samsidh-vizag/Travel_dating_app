import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_dating_app/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:travel_dating_app/features/authentication/domain/repository/auth_repository.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthRepository repository;

  @override
  void build(BuildContext contaxt) {
    repository = ref.read(authRepositoryProvider);
  }
}
