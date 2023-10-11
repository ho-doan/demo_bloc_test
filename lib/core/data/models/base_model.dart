import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

class BaseException implements Exception {
  final String error;

  BaseException(this.error);

  factory BaseException.onException(Exception e) => BaseException(
        e.toString().replaceFirst('Exception: ', ''),
      );
  factory BaseException.onObject(Object e) => BaseException(
        (e as Exception).toString().replaceFirst('Exception: ', ''),
      );
}

@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> extends Equatable {
  final T data;

  factory BaseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseModelFromJson(json, fromJsonT);

  const BaseModel({required this.data});

  Map<String, dynamic> toJson(T Function(Object? json) toJsonT) =>
      _$BaseModelToJson(this, toJsonT);

  @override
  List<Object?> get props => [data];
}
