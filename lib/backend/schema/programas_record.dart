import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramasRecord extends FirestoreRecord {
  ProgramasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombrePrograma" field.
  String? _nombrePrograma;
  String get nombrePrograma => _nombrePrograma ?? '';
  bool hasNombrePrograma() => _nombrePrograma != null;

  // "descripcionPrograma" field.
  String? _descripcionPrograma;
  String get descripcionPrograma => _descripcionPrograma ?? '';
  bool hasDescripcionPrograma() => _descripcionPrograma != null;

  // "imagenPrograma" field.
  String? _imagenPrograma;
  String get imagenPrograma => _imagenPrograma ?? '';
  bool hasImagenPrograma() => _imagenPrograma != null;

  // "duracinPrograma" field.
  String? _duracinPrograma;
  String get duracinPrograma => _duracinPrograma ?? '';
  bool hasDuracinPrograma() => _duracinPrograma != null;

  // "nombreEntrenador" field.
  String? _nombreEntrenador;
  String get nombreEntrenador => _nombreEntrenador ?? '';
  bool hasNombreEntrenador() => _nombreEntrenador != null;

  // "fotoEntrenador" field.
  String? _fotoEntrenador;
  String get fotoEntrenador => _fotoEntrenador ?? '';
  bool hasFotoEntrenador() => _fotoEntrenador != null;

  // "precioPrograma" field.
  double? _precioPrograma;
  double get precioPrograma => _precioPrograma ?? 0.0;
  bool hasPrecioPrograma() => _precioPrograma != null;

  // "calificacionPrograma" field.
  String? _calificacionPrograma;
  String get calificacionPrograma => _calificacionPrograma ?? '';
  bool hasCalificacionPrograma() => _calificacionPrograma != null;

  void _initializeFields() {
    _nombrePrograma = snapshotData['nombrePrograma'] as String?;
    _descripcionPrograma = snapshotData['descripcionPrograma'] as String?;
    _imagenPrograma = snapshotData['imagenPrograma'] as String?;
    _duracinPrograma = snapshotData['duracinPrograma'] as String?;
    _nombreEntrenador = snapshotData['nombreEntrenador'] as String?;
    _fotoEntrenador = snapshotData['fotoEntrenador'] as String?;
    _precioPrograma = castToType<double>(snapshotData['precioPrograma']);
    _calificacionPrograma = snapshotData['calificacionPrograma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Programas');

  static Stream<ProgramasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgramasRecord.fromSnapshot(s));

  static Future<ProgramasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgramasRecord.fromSnapshot(s));

  static ProgramasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgramasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgramasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgramasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgramasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgramasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgramasRecordData({
  String? nombrePrograma,
  String? descripcionPrograma,
  String? imagenPrograma,
  String? duracinPrograma,
  String? nombreEntrenador,
  String? fotoEntrenador,
  double? precioPrograma,
  String? calificacionPrograma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombrePrograma': nombrePrograma,
      'descripcionPrograma': descripcionPrograma,
      'imagenPrograma': imagenPrograma,
      'duracinPrograma': duracinPrograma,
      'nombreEntrenador': nombreEntrenador,
      'fotoEntrenador': fotoEntrenador,
      'precioPrograma': precioPrograma,
      'calificacionPrograma': calificacionPrograma,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgramasRecordDocumentEquality implements Equality<ProgramasRecord> {
  const ProgramasRecordDocumentEquality();

  @override
  bool equals(ProgramasRecord? e1, ProgramasRecord? e2) {
    return e1?.nombrePrograma == e2?.nombrePrograma &&
        e1?.descripcionPrograma == e2?.descripcionPrograma &&
        e1?.imagenPrograma == e2?.imagenPrograma &&
        e1?.duracinPrograma == e2?.duracinPrograma &&
        e1?.nombreEntrenador == e2?.nombreEntrenador &&
        e1?.fotoEntrenador == e2?.fotoEntrenador &&
        e1?.precioPrograma == e2?.precioPrograma &&
        e1?.calificacionPrograma == e2?.calificacionPrograma;
  }

  @override
  int hash(ProgramasRecord? e) => const ListEquality().hash([
        e?.nombrePrograma,
        e?.descripcionPrograma,
        e?.imagenPrograma,
        e?.duracinPrograma,
        e?.nombreEntrenador,
        e?.fotoEntrenador,
        e?.precioPrograma,
        e?.calificacionPrograma
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgramasRecord;
}
