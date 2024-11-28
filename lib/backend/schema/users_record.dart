import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edad" field.
  String? _edad;
  String get edad => _edad ?? '';
  bool hasEdad() => _edad != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "tagPrograma" field.
  String? _tagPrograma;
  String get tagPrograma => _tagPrograma ?? '';
  bool hasTagPrograma() => _tagPrograma != null;

  // "fechaVencimiento" field.
  DateTime? _fechaVencimiento;
  DateTime? get fechaVencimiento => _fechaVencimiento;
  bool hasFechaVencimiento() => _fechaVencimiento != null;

  // "rol" field.
  String? _rol;
  String get rol => _rol ?? '';
  bool hasRol() => _rol != null;

  // "altura" field.
  double? _altura;
  double get altura => _altura ?? 0.0;
  bool hasAltura() => _altura != null;

  // "pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  bool hasPais() => _pais != null;

  // "imagenPais" field.
  String? _imagenPais;
  String get imagenPais => _imagenPais ?? '';
  bool hasImagenPais() => _imagenPais != null;

  // "hombre" field.
  bool? _hombre;
  bool get hombre => _hombre ?? false;
  bool hasHombre() => _hombre != null;

  // "mujer" field.
  bool? _mujer;
  bool get mujer => _mujer ?? false;
  bool hasMujer() => _mujer != null;

  // "nivelBasico" field.
  bool? _nivelBasico;
  bool get nivelBasico => _nivelBasico ?? false;
  bool hasNivelBasico() => _nivelBasico != null;

  // "nivelIntermedio" field.
  bool? _nivelIntermedio;
  bool get nivelIntermedio => _nivelIntermedio ?? false;
  bool hasNivelIntermedio() => _nivelIntermedio != null;

  // "nivelAvanzado" field.
  bool? _nivelAvanzado;
  bool get nivelAvanzado => _nivelAvanzado ?? false;
  bool hasNivelAvanzado() => _nivelAvanzado != null;

  // "porcentajeNivelBasico" field.
  double? _porcentajeNivelBasico;
  double get porcentajeNivelBasico => _porcentajeNivelBasico ?? 0.0;
  bool hasPorcentajeNivelBasico() => _porcentajeNivelBasico != null;

  // "porcentajeNivelIntermedio" field.
  double? _porcentajeNivelIntermedio;
  double get porcentajeNivelIntermedio => _porcentajeNivelIntermedio ?? 0.0;
  bool hasPorcentajeNivelIntermedio() => _porcentajeNivelIntermedio != null;

  // "porcentajeNivelAvanzado" field.
  double? _porcentajeNivelAvanzado;
  double get porcentajeNivelAvanzado => _porcentajeNivelAvanzado ?? 0.0;
  bool hasPorcentajeNivelAvanzado() => _porcentajeNivelAvanzado != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _edad = snapshotData['edad'] as String?;
    _peso = castToType<double>(snapshotData['peso']);
    _tagPrograma = snapshotData['tagPrograma'] as String?;
    _fechaVencimiento = snapshotData['fechaVencimiento'] as DateTime?;
    _rol = snapshotData['rol'] as String?;
    _altura = castToType<double>(snapshotData['altura']);
    _pais = snapshotData['pais'] as String?;
    _imagenPais = snapshotData['imagenPais'] as String?;
    _hombre = snapshotData['hombre'] as bool?;
    _mujer = snapshotData['mujer'] as bool?;
    _nivelBasico = snapshotData['nivelBasico'] as bool?;
    _nivelIntermedio = snapshotData['nivelIntermedio'] as bool?;
    _nivelAvanzado = snapshotData['nivelAvanzado'] as bool?;
    _porcentajeNivelBasico =
        castToType<double>(snapshotData['porcentajeNivelBasico']);
    _porcentajeNivelIntermedio =
        castToType<double>(snapshotData['porcentajeNivelIntermedio']);
    _porcentajeNivelAvanzado =
        castToType<double>(snapshotData['porcentajeNivelAvanzado']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? edad,
  double? peso,
  String? tagPrograma,
  DateTime? fechaVencimiento,
  String? rol,
  double? altura,
  String? pais,
  String? imagenPais,
  bool? hombre,
  bool? mujer,
  bool? nivelBasico,
  bool? nivelIntermedio,
  bool? nivelAvanzado,
  double? porcentajeNivelBasico,
  double? porcentajeNivelIntermedio,
  double? porcentajeNivelAvanzado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edad': edad,
      'peso': peso,
      'tagPrograma': tagPrograma,
      'fechaVencimiento': fechaVencimiento,
      'rol': rol,
      'altura': altura,
      'pais': pais,
      'imagenPais': imagenPais,
      'hombre': hombre,
      'mujer': mujer,
      'nivelBasico': nivelBasico,
      'nivelIntermedio': nivelIntermedio,
      'nivelAvanzado': nivelAvanzado,
      'porcentajeNivelBasico': porcentajeNivelBasico,
      'porcentajeNivelIntermedio': porcentajeNivelIntermedio,
      'porcentajeNivelAvanzado': porcentajeNivelAvanzado,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.edad == e2?.edad &&
        e1?.peso == e2?.peso &&
        e1?.tagPrograma == e2?.tagPrograma &&
        e1?.fechaVencimiento == e2?.fechaVencimiento &&
        e1?.rol == e2?.rol &&
        e1?.altura == e2?.altura &&
        e1?.pais == e2?.pais &&
        e1?.imagenPais == e2?.imagenPais &&
        e1?.hombre == e2?.hombre &&
        e1?.mujer == e2?.mujer &&
        e1?.nivelBasico == e2?.nivelBasico &&
        e1?.nivelIntermedio == e2?.nivelIntermedio &&
        e1?.nivelAvanzado == e2?.nivelAvanzado &&
        e1?.porcentajeNivelBasico == e2?.porcentajeNivelBasico &&
        e1?.porcentajeNivelIntermedio == e2?.porcentajeNivelIntermedio &&
        e1?.porcentajeNivelAvanzado == e2?.porcentajeNivelAvanzado;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.edad,
        e?.peso,
        e?.tagPrograma,
        e?.fechaVencimiento,
        e?.rol,
        e?.altura,
        e?.pais,
        e?.imagenPais,
        e?.hombre,
        e?.mujer,
        e?.nivelBasico,
        e?.nivelIntermedio,
        e?.nivelAvanzado,
        e?.porcentajeNivelBasico,
        e?.porcentajeNivelIntermedio,
        e?.porcentajeNivelAvanzado
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
