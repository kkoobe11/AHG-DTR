import '../backend/api_requests/api_calls.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../homepage/homepage_widget.dart';
import '../time_out_lottie/time_out_lottie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PictureTimeoutWidget extends StatefulWidget {
  const PictureTimeoutWidget({Key key}) : super(key: key);

  @override
  _PictureTimeoutWidgetState createState() => _PictureTimeoutWidgetState();
}

class _PictureTimeoutWidgetState extends State<PictureTimeoutWidget> {
  ApiCallResponse timeOut;
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A1A),
        iconTheme: IconThemeData(color: Color(0xFF161616)),
        automaticallyImplyLeading: true,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFFFF8974),
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
                reverseDuration: Duration(milliseconds: 0),
                child: HomepageWidget(),
              ),
            );
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF1A1A1A),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/images/editedasset.png',
              ).image,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF0C0C0C),
              )
            ],
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 20, 50, 50),
                child: Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1A1A),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset(
                        'assets/images/ahg_icon.png',
                      ).image,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Text(
                  'Time - Out',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Rubik',
                        color: Color(0xFFE6E6E6),
                        fontSize: 21,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.3,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: Image.asset(
                              'assets/images/upload-solid.png',
                            ).image,
                          ),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                uploadedFileUrl,
                              ).image,
                            ),
                          ),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  FFAppState().returnOutImg,
                                ).image,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                child: FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      showUploadMessage(
                        context,
                        'Uploading file...',
                        showLoading: true,
                      );
                      final downloadUrls = await Future.wait(selectedMedia.map(
                          (m) async =>
                              await uploadData(m.storagePath, m.bytes)));
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      if (downloadUrls != null) {
                        setState(() => uploadedFileUrl = downloadUrls.first);
                        showUploadMessage(
                          context,
                          'Success!',
                        );
                      } else {
                        showUploadMessage(
                          context,
                          'Failed to upload media',
                        );
                        return;
                      }
                    }

                    setState(() => FFAppState().returnOutImg = uploadedFileUrl);
                  },
                  text: 'upload image',
                  options: FFButtonOptions(
                    width: 200,
                    height: 40,
                    color: Color(0xFF36383C),
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Rubik',
                          color: Color(0xFFE6E6E6),
                          fontWeight: FontWeight.w500,
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFF36383C),
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: FFButtonWidget(
                  onPressed: () async {
                    var _shouldSetState = false;
                    if (!((uploadedFileUrl != null) &&
                        (uploadedFileUrl != ''))) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Error'),
                            content:
                                Text('Upload an image before adding time Out'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    timeOut = await TimeOUTCall.call(
                      authToken: FFAppState().newAuthorization,
                      timeoutimage: FFAppState().returnOutImg,
                    );
                    _shouldSetState = true;
                    if ((timeOut?.succeeded ?? true)) {
                      setState(() => FFAppState().boolOut = false);
                      setState(() => FFAppState().elapsedbool = false);
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: TimeOutLottieWidget(),
                        ),
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('you havent added time in today'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: 'Submit Image',
                  options: FFButtonOptions(
                    width: 200,
                    height: 40,
                    color: Color(0xFF36383C),
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Rubik',
                          color: Color(0xFFE6E6E6),
                          fontWeight: FontWeight.w500,
                        ),
                    borderSide: BorderSide(
                      color: Color(0xFF36383C),
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
