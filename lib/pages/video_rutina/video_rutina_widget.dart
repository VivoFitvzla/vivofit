import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'video_rutina_model.dart';
export 'video_rutina_model.dart';

class VideoRutinaWidget extends StatefulWidget {
  const VideoRutinaWidget({
    super.key,
    required this.detallesVideoRutinas,
  });

  final RutinasRecord? detallesVideoRutinas;

  @override
  State<VideoRutinaWidget> createState() => _VideoRutinaWidgetState();
}

class _VideoRutinaWidgetState extends State<VideoRutinaWidget> {
  late VideoRutinaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoRutinaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'videoRutina'});
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
            logFirebaseEvent('VIDEO_RUTINA_chevron_left_rounded_ICN_ON');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Video Rutina',
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
          FlutterFlowVideoPlayer(
            path: widget.detallesVideoRutinas!.videoPathRutina,
            videoType: VideoType.network,
            autoPlay: false,
            looping: true,
            showControls: true,
            allowFullScreen: true,
            allowPlaybackSpeedMenu: false,
          ),
          Expanded(
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
                        widget.detallesVideoRutinas?.nombreRutina,
                        'Nombre Rutina',
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Akira Expanded',
                            color: FlutterFlowTheme.of(context).colorMarca1,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.detallesVideoRutinas?.descripcionRutina,
                        'Descripción rutina',
                      ),
                      maxLines: 10,
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
                                'Duración: ${valueOrDefault<String>(
                                  widget.detallesVideoRutinas?.duracionRutina,
                                  'Duración rutina',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .colorMarca2,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 16.0)),
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
                                'Kcal: ${valueOrDefault<String>(
                                  widget.detallesVideoRutinas?.kcalRutina,
                                  'Kcal rutina',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .colorMarca2,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 16.0)),
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
