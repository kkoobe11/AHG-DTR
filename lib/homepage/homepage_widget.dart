import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../logout/logout_widget.dart';
import '../picture_timein/picture_timein_widget.dart';
import '../picture_timeout/picture_timeout_widget.dart';
import '../sendmail/sendmail_widget.dart';
import '../viewallentries/viewallentries_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({Key key}) : super(key: key);

  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A1A),
        iconTheme: IconThemeData(color: Color(0xFFFF8974)),
        automaticallyImplyLeading: false,
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
                'assets/images/asaaaa.png',
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
                padding: EdgeInsetsDirectional.fromSTEB(50, 25, 50, 50),
                child: Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.asset(
                        'assets/images/image.png',
                      ).image,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, ',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Rubik',
                          color: Color(0xFFE6E6E6),
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFAppState().name,
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Rubik',
                            color: Color(0xFFFF8974),
                          ),
                    ),
                    Text(
                      ' !',
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Rubik',
                            color: Color(0xFFE6E6E6),
                          ),
                    ),
                  ],
                ),
              ),
              if ((FFAppState().elapsedbool) == true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Elapsed time since time In: ',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Rubik',
                              color: Color(0xFFE6E6E6),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        FFAppState().currentTotal,
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Rubik',
                              color: Color(0xFFE6E6E6),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                ),
              if ((FFAppState().boolIn) == true)
                FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                        reverseDuration: Duration(milliseconds: 0),
                        child: PictureTimeinWidget(),
                      ),
                    );
                  },
                  text: 'Time  In',
                  options: FFButtonOptions(
                    width: 235,
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
              if ((FFAppState().boolOut) == true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: PictureTimeoutWidget(),
                        ),
                      );
                    },
                    text: 'Time  Out',
                    options: FFButtonOptions(
                      width: 235,
                      height: 40,
                      color: Color(0xFF36383C),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                        reverseDuration: Duration(milliseconds: 0),
                        child: SendmailWidget(),
                      ),
                    );
                  },
                  text: 'Send email with CSV',
                  options: FFButtonOptions(
                    width: 235,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                        reverseDuration: Duration(milliseconds: 0),
                        child: ViewallentriesWidget(),
                      ),
                    );
                  },
                  text: 'View all entries',
                  options: FFButtonOptions(
                    width: 235,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(() => FFAppState().newAuthorization = '');
                    setState(() => FFAppState().name = '');
                    setState(() => FFAppState().viewimg = null);
                    setState(() => FFAppState().returnimg = ' ');
                    setState(() => FFAppState().returnOutImg = ' ');
                    setState(() => FFAppState().boolIn = false);
                    setState(() => FFAppState().boolOut = false);
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                        reverseDuration: Duration(milliseconds: 0),
                        child: LogoutWidget(),
                      ),
                    );
                  },
                  text: 'Log-out',
                  options: FFButtonOptions(
                    width: 235,
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
