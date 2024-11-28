import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PedidosRecord extends FirestoreRecord {
  PedidosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombrePrograma" field.
  String? _nombrePrograma;
  String get nombrePrograma => _nombrePrograma ?? '';
  bool hasNombrePrograma() => _nombrePrograma != null;

  // "precioPrograma" field.
  double? _precioPrograma;
  double get precioPrograma => _precioPrograma ?? 0.0;
  bool hasPrecioPrograma() => _precioPrograma != null;

  // "fotoComprobante" field.
  String? _fotoComprobante;
  String get fotoComprobante => _fotoComprobante ?? '';
  bool hasFotoComprobante() => _fotoComprobante != null;

  // "numeroOperacion" field.
  String? _numeroOperacion;
  String get numeroOperacion => _numeroOperacion ?? '';
  bool hasNumeroOperacion() => _numeroOperacion != null;

  // "montoOperacion" field.
  String? _montoOperacion;
  String get montoOperacion => _montoOperacion ?? '';
  bool hasMontoOperacion() => _montoOperacion != null;

  // "fechaOperacion" field.
  DateTime? _fechaOperacion;
  DateTime? get fechaOperacion => _fechaOperacion;
  bool hasFechaOperacion() => _fechaOperacion != null;

  // "nombreUsuario2" field.
  String? _nombreUsuario2;
  String get nombreUsuario2 => _nombreUsuario2 ?? '';
  bool hasNombreUsuario2() => _nombreUsuario2 != null;

  // "emailUsuario2" field.
  String? _emailUsuario2;
  String get emailUsuario2 => _emailUsuario2 ?? '';
  bool hasEmailUsuario2() => _emailUsuario2 != null;

  void _initializeFields() {
    _nombrePrograma = snapshotData['nombrePrograma'] as String?;
    _precioPrograma = castToType<double>(snapshotData['precioPrograma']);
    _fotoComprobante = snapshotData['fotoComprobante'] as String?;
    _numeroOperacion = snapshotData['numeroOperacion'] as String?;
    _montoOperacion = snapshotData['montoOperacion'] as String?;
    _fechaOperacion = snapshotData['fechaOperacion'] as DateTime?;
    _nombreUsuario2 = snapshotData['nombreUsuario2'] as String?;
    _emailUsuario2 = snapshotData['emailUsuario2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pedidos');

  static Stream<PedidosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PedidosRecord.fromSnapshot(s));

  static Future<PedidosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PedidosRecord.fromSnapshot(s));

  static PedidosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PedidosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PedidosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PedidosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PedidosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PedidosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPedidosRecordData({
  String? nombrePrograma,
  double? precioPrograma,
  String? fotoComprobante,
  String? numeroOperacion,
  String? montoOperacion,
  DateTime? fechaOperacion,
  String? nombreUsuario2,
  String? emailUsuario2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombrePrograma': nombrePrograma,
      'precioPrograma': precioPrograma,
      'fotoComprobante': fotoComprobante,
      'numeroOperacion': numeroOperacion,
      'montoOperacion': montoOperacion,
      'fechaOperacion': fechaOperacion,
      'nombreUsuario2': nombreUsuario2,
      'emailUsuario2': emailUsuario2,
    }.withoutNulls,
  );

  return firestoreData;
}

class PedidosRecordDocumentEquality implements Equality<PedidosRecord> {
  const PedidosRecordDocumentEquality();

  @override
  bool equals(PedidosRecord? e1, PedidosRecord? e2) {
    return e1?.nombrePrograma == e2?.nombrePrograma &&
        e1?.precioPrograma == e2?.precioPrograma &&
        e1?.fotoComprobante == e2?.fotoComprobante &&
        e1?.numeroOperacion == e2?.numeroOperacion &&
        e1?.montoOperacion == e2?.montoOperacion &&
        e1?.fechaOperacion == e2?.fechaOperacion &&
        e1?.nombreUsuario2 == e2?.nombreUsuario2 &&
        e1?.emailUsuario2 == e2?.emailUsuario2;
  }

  @override
  int hash(PedidosRecord? e) => const ListEquality().hash([
        e?.nombrePrograma,
        e?.precioPrograma,
        e?.fotoComprobante,
        e?.numeroOperacion,
        e?.montoOperacion,
        e?.fechaOperacion,
        e?.nombreUsuario2,
        e?.emailUsuario2
      ]);

  @override
  bool isValidKey(Object? o) => o is PedidosRecord;
}
