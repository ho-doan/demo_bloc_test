// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryModel _$EntryModelFromJson(Map<String, dynamic> json) => EntryModel(
      aPI: json['API'] as String?,
      description: json['Description'] as String?,
      auth: json['Auth'] as String?,
      hTTPS: json['HTTPS'] as bool?,
      cors: json['Cors'] as String?,
      link: json['Link'] as String?,
      category: json['Category'] as String?,
    );

Map<String, dynamic> _$EntryModelToJson(EntryModel instance) =>
    <String, dynamic>{
      'API': instance.aPI,
      'Description': instance.description,
      'Auth': instance.auth,
      'HTTPS': instance.hTTPS,
      'Cors': instance.cors,
      'Link': instance.link,
      'Category': instance.category,
    };
