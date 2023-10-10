import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'entry.dart';

part 'entries.g.dart';

@JsonSerializable()
class EntriesModel extends Equatable {
  final int count;
  final List<EntryModel> entries;

  const EntriesModel({
    this.count = 0,
    this.entries = const [],
  });

  factory EntriesModel.fromJson(Map<String, dynamic> json) =>
      _$EntriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$EntriesModelToJson(this);

  @override
  List<Object?> get props => [count, entries];
}
