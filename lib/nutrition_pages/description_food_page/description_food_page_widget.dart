import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'description_food_page_model.dart';
export 'description_food_page_model.dart';

class DescriptionFoodPageWidget extends StatefulWidget {
  const DescriptionFoodPageWidget({
    super.key,
    required this.detallesComida,
  });

  final ComidaRecord? detallesComida;

  @override
  State<DescriptionFoodPageWidget> createState() =>
      _DescriptionFoodPageWidgetState();
}

class _DescriptionFoodPageWidgetState extends State<DescriptionFoodPageWidget> {
  late DescriptionFoodPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescriptionFoodPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DescriptionFoodPage'});
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
        backgroundColor: Colors.transparent,
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
            logFirebaseEvent('DESCRIPTION_FOOD_chevron_left_rounded_IC');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          valueOrDefault<String>(
            widget.detallesComida?.nombreComida,
            'Nombre Comida',
          ),
          maxLines: 2,
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                child: Image.network(
                  widget.detallesComida!.fotoComida,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.detallesComida?.descripcionComida,
                        'Descripción Comida',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).colorMarca2,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).colorMarca2,
                    ),
                    Text(
                      'Preparación:',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.detallesComida?.preparacionComida,
                        'Preparación Comida',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).colorMarca2,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tiempo de preparación:',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.clock,
                                color: FlutterFlowTheme.of(context).colorMarca1,
                                size: 14.0,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget
                                      .detallesComida?.tiempoPreparacionComida,
                                  'Tiempo Preparación',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .colorMarca2,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kcal:',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.fire,
                                color: FlutterFlowTheme.of(context).colorMarca1,
                                size: 14.0,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.detallesComida?.kcalComida,
                                  'Kcal Comida',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                      ],
                    ),
                  ]
                      .divide(const SizedBox(height: 16.0))
                      .around(const SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
