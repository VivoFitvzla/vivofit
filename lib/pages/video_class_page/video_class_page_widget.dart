import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'video_class_page_model.dart';
export 'video_class_page_model.dart';

class VideoClassPageWidget extends StatefulWidget {
  const VideoClassPageWidget({
    super.key,
    required this.detallesVideoClases,
  });

  final VideoClasesRecord? detallesVideoClases;

  @override
  State<VideoClassPageWidget> createState() => _VideoClassPageWidgetState();
}

class _VideoClassPageWidgetState extends State<VideoClassPageWidget> {
  late VideoClassPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoClassPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'videoClassPage'});
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
            logFirebaseEvent('VIDEO_CLASS_chevron_left_rounded_ICN_ON_');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Dia: ${valueOrDefault<String>(
            widget.detallesVideoClases?.diaVideo,
            'Día Video',
          )}',
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
            path: widget.detallesVideoClases!.videoPath,
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
                        widget.detallesVideoClases?.nombreVideo,
                        'Nombre Video',
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
                        widget.detallesVideoClases?.descripcionVideo,
                        'Descripción Video',
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
                                  widget.detallesVideoClases?.duracionVideo,
                                  'Duración Video',
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
                                  widget.detallesVideoClases?.kcalVideo,
                                  'Kcal Video',
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
