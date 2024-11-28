import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'description_programe_page_model.dart';
export 'description_programe_page_model.dart';

class DescriptionProgramePageWidget extends StatefulWidget {
  const DescriptionProgramePageWidget({
    super.key,
    required this.detallesPrograma,
  });

  final ProgramasRecord? detallesPrograma;

  @override
  State<DescriptionProgramePageWidget> createState() =>
      _DescriptionProgramePageWidgetState();
}

class _DescriptionProgramePageWidgetState
    extends State<DescriptionProgramePageWidget> {
  late DescriptionProgramePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescriptionProgramePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DescriptionProgramePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DESCRIPTION_PROGRAME_DescriptionPrograme');
      if (dateTimeFormat(
            "d/M/y",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ) ==
          dateTimeFormat(
            "d/M/y",
            currentUserDocument?.fechaVencimiento,
            locale: FFLocalizations.of(context).languageCode,
          )) {
        logFirebaseEvent('DescriptionProgramePage_backend_call');

        await currentUserReference!.update({
          ...mapToFirestore(
            {
              'fechaVencimiento': FieldValue.delete(),
              'tagPrograma': FieldValue.delete(),
            },
          ),
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).colorMarca3,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      widget.detallesPrograma!.imagenPrograma,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x001F1E1C),
                          FlutterFlowTheme.of(context).colorMarca3
                        ],
                        stops: const [0.0, 1.0],
                        begin: const AlignmentDirectional(0.0, -1.0),
                        end: const AlignmentDirectional(0, 1.0),
                      ),
                    ),
                  ),
                  if ((valueOrDefault(
                                  currentUserDocument?.tagPrograma, '') ==
                              '') ||
                      (valueOrDefault(currentUserDocument?.tagPrograma, '') !=
                          valueOrDefault<String>(
                            widget.detallesPrograma?.nombrePrograma,
                            'Nombre Programa',
                          )))
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Costo programa: ${valueOrDefault<String>(
                                      formatNumber(
                                        widget
                                            .detallesPrograma?.precioPrograma,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                        currency: '\$',
                                      ),
                                      '0',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'DESCRIPTION_PROGRAME_ADQUIRIR_BTN_ON_TAP');
                                    logFirebaseEvent(
                                        'Button_biometric_verification');
                                    final localAuth = LocalAuthentication();
                                    bool isBiometricSupported =
                                        await localAuth.isDeviceSupported();

                                    if (isBiometricSupported) {
                                      try {
                                        _model.biometricPay =
                                            await localAuth.authenticate(
                                                localizedReason:
                                                    'Verifique su huella para continuar con la compra');
                                      } on PlatformException {
                                        _model.biometricPay = false;
                                      }
                                      safeSetState(() {});
                                    }

                                    if (_model.biometricPay) {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'PayPage',
                                        queryParameters: {
                                          'detallesProgramaPago':
                                              serializeParam(
                                            widget.detallesPrograma,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'detallesProgramaPago':
                                              widget.detallesPrograma,
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Verificación fallida',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Adquirir',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .colorMarca1,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .colorMarca3,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 10.0,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 64.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 10.0,
                          buttonSize: 40.0,
                          fillColor: const Color(0xFF6D6E72),
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            color: FlutterFlowTheme.of(context).colorMarca3,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'DESCRIPTION_PROGRAME_chevron_left_rounde');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.safePop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.detallesPrograma?.nombrePrograma,
                            'Nombre Programa',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Akira Expanded',
                                color: FlutterFlowTheme.of(context).colorMarca1,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.detallesPrograma?.descripcionPrograma,
                            'Descripción Programa',
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 10,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).colorMarca2,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).colorMarca2,
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'clases',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Akira Expanded',
                                color: FlutterFlowTheme.of(context).colorMarca1,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                      StreamBuilder<List<VideoClasesRecord>>(
                        stream: queryVideoClasesRecord(
                          queryBuilder: (videoClasesRecord) => videoClasesRecord
                              .where(
                                'tagPrograma',
                                isEqualTo: valueOrDefault<String>(
                                  widget.detallesPrograma?.nombrePrograma,
                                  'Nombre Programa',
                                ),
                              )
                              .orderBy('diaVideo'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<VideoClasesRecord>
                              containerVideoClasesRecordList = snapshot.data!;

                          return Container(
                            decoration: const BoxDecoration(),
                            child: Stack(
                              children: [
                                if (widget.detallesPrograma?.nombrePrograma ==
                                    valueOrDefault(
                                        currentUserDocument?.tagPrograma, ''))
                                  AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final listaVideos =
                                            containerVideoClasesRecordList
                                                .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listaVideos.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 16.0),
                                          itemBuilder:
                                              (context, listaVideosIndex) {
                                            final listaVideosItem =
                                                listaVideos[listaVideosIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'DESCRIPTION_PROGRAME_Container_gw30patn_');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'videoClassPage',
                                                  queryParameters: {
                                                    'detallesVideoClases':
                                                        serializeParam(
                                                      listaVideosItem,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'detallesVideoClases':
                                                        listaVideosItem,
                                                  },
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 5.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Container(
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0x806D6E72),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderRadius: 50.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .colorMarca1,
                                                          icon: Icon(
                                                            Icons
                                                                .play_arrow_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .colorMarca3,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listaVideosItem
                                                                    .nombreVideo,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .colorMarca3,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Dia: ${listaVideosItem.diaVideo}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).colorMarca3,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .calendar_month,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .colorMarca1,
                                                                    size: 14.0,
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(const SizedBox(
                                                              width: 16.0))
                                                          .addToStart(const SizedBox(
                                                              width: 8.0))
                                                          .addToEnd(const SizedBox(
                                                              width: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if ((valueOrDefault(
                                                currentUserDocument
                                                    ?.tagPrograma,
                                                '') ==
                                            '') ||
                                    (valueOrDefault(
                                            currentUserDocument?.tagPrograma,
                                            '') !=
                                        valueOrDefault<String>(
                                          widget
                                              .detallesPrograma?.nombrePrograma,
                                          'Nombre Programa',
                                        )))
                                  AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final listaVideos =
                                            containerVideoClasesRecordList
                                                .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listaVideos.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 16.0),
                                          itemBuilder:
                                              (context, listaVideosIndex) {
                                            final listaVideosItem =
                                                listaVideos[listaVideosIndex];
                                            return Material(
                                              color: Colors.transparent,
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x7F6D6E72),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 50.0,
                                                        buttonSize: 40.0,
                                                        fillColor:
                                                            const Color(0x4DFF8E01),
                                                        icon: const Icon(
                                                          Icons
                                                              .play_arrow_rounded,
                                                          color:
                                                              Color(0x4D1F1E1C),
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listaVideosItem
                                                                  .nombreVideo,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: const Color(
                                                                        0x4D1F1E1C),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Dia: ${listaVideosItem.diaVideo}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: const Color(
                                                                            0x4D1F1E1C),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                const Icon(
                                                                  Icons
                                                                      .calendar_month,
                                                                  color: Color(
                                                                      0x4DFF8E01),
                                                                  size: 14.0,
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(const SizedBox(
                                                            width: 16.0))
                                                        .addToStart(const SizedBox(
                                                            width: 8.0))
                                                        .addToEnd(const SizedBox(
                                                            width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ]
                        .divide(const SizedBox(height: 16.0))
                        .around(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
