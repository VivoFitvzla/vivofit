import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'activation_page_model.dart';
export 'activation_page_model.dart';

class ActivationPageWidget extends StatefulWidget {
  const ActivationPageWidget({
    super.key,
    required this.detallesActivacion,
  });

  final UsersRecord? detallesActivacion;

  @override
  State<ActivationPageWidget> createState() => _ActivationPageWidgetState();
}

class _ActivationPageWidgetState extends State<ActivationPageWidget> {
  late ActivationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivationPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ActivationPage'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).colorMarca3,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).colorMarca2,
            size: 30.0,
          ),
          onPressed: () async {
            logFirebaseEvent('ACTIVATION_chevron_left_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'activacion membresia',
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: 'Akira Expanded',
                color: FlutterFlowTheme.of(context).colorMarca1,
                fontSize: 14.0,
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Nombre usuario:',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.detallesActivacion?.displayName,
                      'Nombre Usuario',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).colorMarca2,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Email usuario:',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.detallesActivacion?.email,
                      'Email Usuario',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).colorMarca2,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Activación:',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Montserrat',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '${widget.detallesActivacion?.tagPrograma}, ${dateTimeFormat(
                      "d/M/y",
                      widget.detallesActivacion?.fechaVencimiento,
                      locale: FFLocalizations.of(context).languageCode,
                    )}',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).colorMarca2,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).colorMarca2,
              ),
              Text(
                'Datos de Activación',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Nombre programa activación:',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).colorMarca2,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 1.0,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).colorMarca3,
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Programa',
                    hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).colorMarca3,
                          letterSpacing: 0.0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        letterSpacing: 0.0,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  'Fecha de vencimiento:',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Montserrat',
                        color: FlutterFlowTheme.of(context).colorMarca2,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              FlutterFlowCalendar(
                color: FlutterFlowTheme.of(context).colorMarca1,
                iconColor: FlutterFlowTheme.of(context).colorMarca1,
                weekFormat: false,
                weekStartsMonday: false,
                rowHeight: 48.0,
                onChange: (DateTimeRange? newSelectedDate) {
                  safeSetState(
                      () => _model.calendarSelectedDay = newSelectedDate);
                },
                titleStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Akira Expanded',
                      color: FlutterFlowTheme.of(context).colorMarca1,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                dayOfWeekStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                    ),
                dateStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).colorMarca1,
                      letterSpacing: 0.0,
                    ),
                selectedDateStyle:
                    FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Akira Expanded',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                inactiveDateStyle:
                    FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).colorMarca2,
                          letterSpacing: 0.0,
                        ),
                locale: FFLocalizations.of(context).languageCode,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('ACTIVATION_ACTIVACIN_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');

                        await widget.detallesActivacion!.reference
                            .update(createUsersRecordData(
                          tagPrograma: _model.textController.text,
                          fechaVencimiento: _model.calendarSelectedDay?.end,
                        ));
                        logFirebaseEvent('Button_navigate_back');
                        context.safePop();
                      },
                      text: 'Activación',
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).colorMarca1,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).colorMarca3,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ].divide(const SizedBox(height: 16.0)).around(const SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
