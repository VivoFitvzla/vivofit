import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ComidaRecord extends FirestoreRecord {
  ComidaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombreComida" field.
  String? _nombreComida;
  String get nombreComida => _nombreComida ?? '';
  bool hasNombreComida() => _nombreComida != null;

  // "descripcionComida" field.
  String? _descripcionComida;
  String get descripcionComida => _descripcionComida ?? '';
  bool hasDescripcionComida() => _descripcionComida != null;

  // "ingredientesComida" field.
  String? _ingredientesComida;
  String get ingredientesComida => _ingredientesComida ?? '';
  bool hasIngredientesComida() => _ingredientesComida != null;

  // "preparacionComida" field.
  String? _preparacionComida;
  String get preparacionComida => _preparacionComida ?? '';
  bool hasPreparacionComida() => _preparacionComida != null;

  // "tiempoPreparacionComida" field.
  String? _tiempoPreparacionComida;
  String get tiempoPreparacionComida => _tiempoPreparacionComida ?? '';
  bool hasTiempoPreparacionComida() => _tiempoPreparacionComida != null;

  // "kcalComida" field.
  String? _kcalComida;
  String get kcalComida => _kcalComida ?? '';
  bool hasKcalComida() => _kcalComida != null;

  // "fotoComida" field.
  String? _fotoComida;
  String get fotoComida => _fotoComida ?? '';
  bool hasFotoComida() => _fotoComida != null;

  // "tiposComida" field.
  List<String>? _tiposComida;
  List<String> get tiposComida => _tiposComida ?? const [];
  bool hasTiposComida() => _tiposComida != null;

  // "tiposComida2" field.
  String? _tiposComida2;
  String get tiposComida2 => _tiposComida2 ?? '';
  bool hasTiposComida2() => _tiposComida2 != null;

  void _initializeFields() {
    _nombreComida = snapshotData['nombreComida'] as String?;
    _descripcionComida = snapshotData['descripcionComida'] as String?;
    _ingredientesComida = snapshotData['ingredientesComida'] as String?;
    _preparacionComida = snapshotData['preparacionComida'] as String?;
    _tiempoPreparacionComida =
        snapshotData['tiempoPreparacionComida'] as String?;
    _kcalComida = snapshotData['kcalComida'] as String?;
    _fotoComida = snapshotData['fotoComida'] as String?;
    _tiposComida = getDataList(snapshotData['tiposComida']);
    _tiposComida2 = snapshotData['tiposComida2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Comida');

  static Stream<ComidaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ComidaRecord.fromSnapshot(s));

  static Future<ComidaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ComidaRecord.fromSnapshot(s));

  static ComidaRecord fromSnapshot(DocumentSnapshot snapshot) => ComidaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ComidaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ComidaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ComidaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ComidaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createComidaRecordData({
  String? nombreComida,
  String? descripcionComida,
  String? ingredientesComida,
  String? preparacionComida,
  String? tiempoPreparacionComida,
  String? kcalComida,
  String? fotoComida,
  String? tiposComida2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreComida': nombreComida,
      'descripcionComida': descripcionComida,
      'ingredientesComida': ingredientesComida,
      'preparacionComida': preparacionComida,
      'tiempoPreparacionComida': tiempoPreparacionComida,
      'kcalComida': kcalComida,
      'fotoComida': fotoComida,
      'tiposComida2': tiposComida2,
    }.withoutNulls,
  );

  return firestoreData;
}

class ComidaRecordDocumentEquality implements Equality<ComidaRecord> {
  const ComidaRecordDocumentEquality();

  @override
  bool equals(ComidaRecord? e1, ComidaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreComida == e2?.nombreComida &&
        e1?.descripcionComida == e2?.descripcionComida &&
        e1?.ingredientesComida == e2?.ingredientesComida &&
        e1?.preparacionComida == e2?.preparacionComida &&
        e1?.tiempoPreparacionComida == e2?.tiempoPreparacionComida &&
        e1?.kcalComida == e2?.kcalComida &&
        e1?.fotoComida == e2?.fotoComida &&
        listEquality.equals(e1?.tiposComida, e2?.tiposComida) &&
        e1?.tiposComida2 == e2?.tiposComida2;
  }

  @override
  int hash(ComidaRecord? e) => const ListEquality().hash([
        e?.nombreComida,
        e?.descripcionComida,
        e?.ingredientesComida,
        e?.preparacionComida,
        e?.tiempoPreparacionComida,
        e?.kcalComida,
        e?.fotoComida,
        e?.tiposComida,
        e?.tiposComida2
      ]);

  @override
  bool isValidKey(Object? o) => o is ComidaRecord;
}
