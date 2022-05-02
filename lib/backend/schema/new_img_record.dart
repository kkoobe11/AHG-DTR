import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'new_img_record.g.dart';

abstract class NewImgRecord
    implements Built<NewImgRecord, NewImgRecordBuilder> {
  static Serializer<NewImgRecord> get serializer => _$newImgRecordSerializer;

  @nullable
  String get images;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NewImgRecordBuilder builder) =>
      builder..images = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('newImg');

  static Stream<NewImgRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NewImgRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NewImgRecord._();
  factory NewImgRecord([void Function(NewImgRecordBuilder) updates]) =
      _$NewImgRecord;

  static NewImgRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNewImgRecordData({
  String images,
}) =>
    serializers.toFirestore(
        NewImgRecord.serializer, NewImgRecord((n) => n..images = images));
