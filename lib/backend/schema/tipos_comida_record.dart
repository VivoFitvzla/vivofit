import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TiposComidaRecord extends FirestoreRecord {
  TiposComidaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tiposComida" field.
  List<String>? _tiposComida;
  List<String> get tiposComida => _tiposComida ?? const [];
  bool hasTiposComida() => _tiposComida != null;

  void _initializeFields() {
    _tiposComida = getDataList(snapshotData['tiposComida']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TiposComida');

  static Stream<TiposComidaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TiposComidaRecord.fromSnapshot(s));

  static Future<TiposComidaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TiposComidaRecord.fromSnapshot(s));

  static TiposComidaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TiposComidaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TiposComidaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TiposComidaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TiposComidaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TiposComidaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTiposComidaRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TiposComidaRecordDocumentEquality implements Equality<TiposComidaRecord> {
  const TiposComidaRecordDocumentEquality();

  @override
  bool equals(TiposComidaRecord? e1, TiposComidaRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tiposComida, e2?.tiposComida);
  }

  @override
  int hash(TiposComidaRecord? e) => const ListEquality().hash([e?.tiposComida]);

  @override
  bool isValidKey(Object? o) => o is TiposComidaRecord;
}
