import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticuloBlogRecord extends FirestoreRecord {
  ArticuloBlogRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombreArticulo" field.
  String? _nombreArticulo;
  String get nombreArticulo => _nombreArticulo ?? '';
  bool hasNombreArticulo() => _nombreArticulo != null;

  // "autorArticulo" field.
  String? _autorArticulo;
  String get autorArticulo => _autorArticulo ?? '';
  bool hasAutorArticulo() => _autorArticulo != null;

  // "tiempoLecturaArticulo" field.
  String? _tiempoLecturaArticulo;
  String get tiempoLecturaArticulo => _tiempoLecturaArticulo ?? '';
  bool hasTiempoLecturaArticulo() => _tiempoLecturaArticulo != null;

  // "temaArticulo" field.
  String? _temaArticulo;
  String get temaArticulo => _temaArticulo ?? '';
  bool hasTemaArticulo() => _temaArticulo != null;

  // "imagenArticulo" field.
  String? _imagenArticulo;
  String get imagenArticulo => _imagenArticulo ?? '';
  bool hasImagenArticulo() => _imagenArticulo != null;

  // "fotoAutor" field.
  String? _fotoAutor;
  String get fotoAutor => _fotoAutor ?? '';
  bool hasFotoAutor() => _fotoAutor != null;

  void _initializeFields() {
    _nombreArticulo = snapshotData['nombreArticulo'] as String?;
    _autorArticulo = snapshotData['autorArticulo'] as String?;
    _tiempoLecturaArticulo = snapshotData['tiempoLecturaArticulo'] as String?;
    _temaArticulo = snapshotData['temaArticulo'] as String?;
    _imagenArticulo = snapshotData['imagenArticulo'] as String?;
    _fotoAutor = snapshotData['fotoAutor'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ArticuloBlog');

  static Stream<ArticuloBlogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticuloBlogRecord.fromSnapshot(s));

  static Future<ArticuloBlogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticuloBlogRecord.fromSnapshot(s));

  static ArticuloBlogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticuloBlogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticuloBlogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticuloBlogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticuloBlogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticuloBlogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticuloBlogRecordData({
  String? nombreArticulo,
  String? autorArticulo,
  String? tiempoLecturaArticulo,
  String? temaArticulo,
  String? imagenArticulo,
  String? fotoAutor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreArticulo': nombreArticulo,
      'autorArticulo': autorArticulo,
      'tiempoLecturaArticulo': tiempoLecturaArticulo,
      'temaArticulo': temaArticulo,
      'imagenArticulo': imagenArticulo,
      'fotoAutor': fotoAutor,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticuloBlogRecordDocumentEquality
    implements Equality<ArticuloBlogRecord> {
  const ArticuloBlogRecordDocumentEquality();

  @override
  bool equals(ArticuloBlogRecord? e1, ArticuloBlogRecord? e2) {
    return e1?.nombreArticulo == e2?.nombreArticulo &&
        e1?.autorArticulo == e2?.autorArticulo &&
        e1?.tiempoLecturaArticulo == e2?.tiempoLecturaArticulo &&
        e1?.temaArticulo == e2?.temaArticulo &&
        e1?.imagenArticulo == e2?.imagenArticulo &&
        e1?.fotoAutor == e2?.fotoAutor;
  }

  @override
  int hash(ArticuloBlogRecord? e) => const ListEquality().hash([
        e?.nombreArticulo,
        e?.autorArticulo,
        e?.tiempoLecturaArticulo,
        e?.temaArticulo,
        e?.imagenArticulo,
        e?.fotoAutor
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticuloBlogRecord;
}
