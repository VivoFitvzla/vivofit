import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RutinasRecord extends FirestoreRecord {
  RutinasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombreRutina" field.
  String? _nombreRutina;
  String get nombreRutina => _nombreRutina ?? '';
  bool hasNombreRutina() => _nombreRutina != null;

  // "descripcionRutina" field.
  String? _descripcionRutina;
  String get descripcionRutina => _descripcionRutina ?? '';
  bool hasDescripcionRutina() => _descripcionRutina != null;

  // "videoPathRutina" field.
  String? _videoPathRutina;
  String get videoPathRutina => _videoPathRutina ?? '';
  bool hasVideoPathRutina() => _videoPathRutina != null;

  // "duracionRutina" field.
  String? _duracionRutina;
  String get duracionRutina => _duracionRutina ?? '';
  bool hasDuracionRutina() => _duracionRutina != null;

  // "kcalRutina" field.
  String? _kcalRutina;
  String get kcalRutina => _kcalRutina ?? '';
  bool hasKcalRutina() => _kcalRutina != null;

  // "nivelRutina" field.
  String? _nivelRutina;
  String get nivelRutina => _nivelRutina ?? '';
  bool hasNivelRutina() => _nivelRutina != null;

  // "imagenRutina" field.
  String? _imagenRutina;
  String get imagenRutina => _imagenRutina ?? '';
  bool hasImagenRutina() => _imagenRutina != null;

  void _initializeFields() {
    _nombreRutina = snapshotData['nombreRutina'] as String?;
    _descripcionRutina = snapshotData['descripcionRutina'] as String?;
    _videoPathRutina = snapshotData['videoPathRutina'] as String?;
    _duracionRutina = snapshotData['duracionRutina'] as String?;
    _kcalRutina = snapshotData['kcalRutina'] as String?;
    _nivelRutina = snapshotData['nivelRutina'] as String?;
    _imagenRutina = snapshotData['imagenRutina'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rutinas');

  static Stream<RutinasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RutinasRecord.fromSnapshot(s));

  static Future<RutinasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RutinasRecord.fromSnapshot(s));

  static RutinasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RutinasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RutinasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RutinasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RutinasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RutinasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRutinasRecordData({
  String? nombreRutina,
  String? descripcionRutina,
  String? videoPathRutina,
  String? duracionRutina,
  String? kcalRutina,
  String? nivelRutina,
  String? imagenRutina,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreRutina': nombreRutina,
      'descripcionRutina': descripcionRutina,
      'videoPathRutina': videoPathRutina,
      'duracionRutina': duracionRutina,
      'kcalRutina': kcalRutina,
      'nivelRutina': nivelRutina,
      'imagenRutina': imagenRutina,
    }.withoutNulls,
  );

  return firestoreData;
}

class RutinasRecordDocumentEquality implements Equality<RutinasRecord> {
  const RutinasRecordDocumentEquality();

  @override
  bool equals(RutinasRecord? e1, RutinasRecord? e2) {
    return e1?.nombreRutina == e2?.nombreRutina &&
        e1?.descripcionRutina == e2?.descripcionRutina &&
        e1?.videoPathRutina == e2?.videoPathRutina &&
        e1?.duracionRutina == e2?.duracionRutina &&
        e1?.kcalRutina == e2?.kcalRutina &&
        e1?.nivelRutina == e2?.nivelRutina &&
        e1?.imagenRutina == e2?.imagenRutina;
  }

  @override
  int hash(RutinasRecord? e) => const ListEquality().hash([
        e?.nombreRutina,
        e?.descripcionRutina,
        e?.videoPathRutina,
        e?.duracionRutina,
        e?.kcalRutina,
        e?.nivelRutina,
        e?.imagenRutina
      ]);

  @override
  bool isValidKey(Object? o) => o is RutinasRecord;
}
