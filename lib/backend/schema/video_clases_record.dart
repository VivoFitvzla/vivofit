import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoClasesRecord extends FirestoreRecord {
  VideoClasesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombreVideo" field.
  String? _nombreVideo;
  String get nombreVideo => _nombreVideo ?? '';
  bool hasNombreVideo() => _nombreVideo != null;

  // "descripcionVideo" field.
  String? _descripcionVideo;
  String get descripcionVideo => _descripcionVideo ?? '';
  bool hasDescripcionVideo() => _descripcionVideo != null;

  // "videoPath" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  bool hasVideoPath() => _videoPath != null;

  // "duracionVideo" field.
  String? _duracionVideo;
  String get duracionVideo => _duracionVideo ?? '';
  bool hasDuracionVideo() => _duracionVideo != null;

  // "kcalVideo" field.
  String? _kcalVideo;
  String get kcalVideo => _kcalVideo ?? '';
  bool hasKcalVideo() => _kcalVideo != null;

  // "diaVideo" field.
  String? _diaVideo;
  String get diaVideo => _diaVideo ?? '';
  bool hasDiaVideo() => _diaVideo != null;

  // "tagPrograma" field.
  String? _tagPrograma;
  String get tagPrograma => _tagPrograma ?? '';
  bool hasTagPrograma() => _tagPrograma != null;

  void _initializeFields() {
    _nombreVideo = snapshotData['nombreVideo'] as String?;
    _descripcionVideo = snapshotData['descripcionVideo'] as String?;
    _videoPath = snapshotData['videoPath'] as String?;
    _duracionVideo = snapshotData['duracionVideo'] as String?;
    _kcalVideo = snapshotData['kcalVideo'] as String?;
    _diaVideo = snapshotData['diaVideo'] as String?;
    _tagPrograma = snapshotData['tagPrograma'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VideoClases');

  static Stream<VideoClasesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoClasesRecord.fromSnapshot(s));

  static Future<VideoClasesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoClasesRecord.fromSnapshot(s));

  static VideoClasesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoClasesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoClasesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoClasesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoClasesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoClasesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoClasesRecordData({
  String? nombreVideo,
  String? descripcionVideo,
  String? videoPath,
  String? duracionVideo,
  String? kcalVideo,
  String? diaVideo,
  String? tagPrograma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreVideo': nombreVideo,
      'descripcionVideo': descripcionVideo,
      'videoPath': videoPath,
      'duracionVideo': duracionVideo,
      'kcalVideo': kcalVideo,
      'diaVideo': diaVideo,
      'tagPrograma': tagPrograma,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoClasesRecordDocumentEquality implements Equality<VideoClasesRecord> {
  const VideoClasesRecordDocumentEquality();

  @override
  bool equals(VideoClasesRecord? e1, VideoClasesRecord? e2) {
    return e1?.nombreVideo == e2?.nombreVideo &&
        e1?.descripcionVideo == e2?.descripcionVideo &&
        e1?.videoPath == e2?.videoPath &&
        e1?.duracionVideo == e2?.duracionVideo &&
        e1?.kcalVideo == e2?.kcalVideo &&
        e1?.diaVideo == e2?.diaVideo &&
        e1?.tagPrograma == e2?.tagPrograma;
  }

  @override
  int hash(VideoClasesRecord? e) => const ListEquality().hash([
        e?.nombreVideo,
        e?.descripcionVideo,
        e?.videoPath,
        e?.duracionVideo,
        e?.kcalVideo,
        e?.diaVideo,
        e?.tagPrograma
      ]);

  @override
  bool isValidKey(Object? o) => o is VideoClasesRecord;
}
