// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FaveNewsAdapter extends TypeAdapter<FavoriteNews> {
  @override
  final int typeId = 1;

  @override
  FavoriteNews read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteNews(
      url: fields[0] as String,
      urlToImage: fields[1] as String,
      title: fields[2] as String,
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteNews obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.urlToImage)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaveNewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
