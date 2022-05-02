import '../animation_in/animation_in_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  ApiCallResponse call;
  ApiCallResponse login;
  ApiCallResponse userdetail;
  TextEditingController emailSigninController;
  TextEditingController passwordSigninController;
  bool passwordSigninVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      curve: Curves.elasticOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 2000,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, -100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    emailSigninController = TextEditingController();
    passwordSigninController = TextEditingController();
    passwordSigninVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A1A),
        iconTheme: IconThemeData(color: Color(0xFF1A1A1A)),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF1A1A1A),
      body: Container(
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
              color: Colors.black,
            )
          ],
          shape: BoxShape.rectangle,
        ),
        alignment: AlignmentDirectional(0, 0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 10, 50, 60),
                child: Container(
                  width: 230,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/image_(6).png',
                      ).image,
                    ),
                  ),
                ).animated([animationsMap['containerOnPageLoadAnimation']]),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                  child: DefaultTabController(
                    length: 1,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Color(0xFFE6E6E6),
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Rubik',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                          indicatorColor: Color(0xFFFD8972),
                          indicatorWeight: 3,
                          tabs: [
                            Tab(
                              text: 'Sign In',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 0),
                                      child: TextFormField(
                                        controller: emailSigninController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'emailSigninController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'email',
                                          hintText: 'Enter you email.',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4C4C4C),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4C4C4C),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          suffixIcon: emailSigninController
                                                  .text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () => setState(
                                                    () => emailSigninController
                                                        .clear(),
                                                  ),
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: Color(0xFF757575),
                                                    size: 20,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: Color(0xC8FFFFFF),
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 15, 10, 0),
                                      child: TextFormField(
                                        controller: passwordSigninController,
                                        obscureText: !passwordSigninVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'password',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4C4C4C),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF4C4C4C),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordSigninVisibility =
                                                  !passwordSigninVisibility,
                                            ),
                                            child: Icon(
                                              passwordSigninVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: Color(0xFF757575),
                                              size: 19,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Rubik',
                                              color: Color(0xC7FFFFFF),
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 35, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          login = await LoginCall.call(
                                            email: emailSigninController.text,
                                            password:
                                                passwordSigninController.text,
                                          );
                                          setState(() =>
                                              FFAppState().newAuthorization =
                                                  getJsonField(
                                                (login?.jsonBody ?? ''),
                                                r'''$.authToken''',
                                              ).toString());
                                          userdetail = await MeCall.call(
                                            newauthtoken: getJsonField(
                                              (login?.jsonBody ?? ''),
                                              r'''$.authToken''',
                                            ).toString(),
                                          );
                                          setState(() =>
                                              FFAppState().name = getJsonField(
                                                (userdetail?.jsonBody ?? ''),
                                                r'''$.name''',
                                              ).toString());
                                          call = await ChecktimeinCall.call(
                                            authToken:
                                                FFAppState().newAuthorization,
                                          );
                                          if ((login?.succeeded ?? true)) {
                                            if ((getJsonField(
                                                  (call?.jsonBody ?? ''),
                                                  r'''$.timeIn''',
                                                ) !=
                                                null)) {
                                              setState(() =>
                                                  FFAppState().boolIn = false);
                                              setState(() =>
                                                  FFAppState().boolOut = true);
                                              setState(() => FFAppState()
                                                  .elapsedbool = true);
                                            } else {
                                              setState(() =>
                                                  FFAppState().boolIn = true);
                                              setState(() =>
                                                  FFAppState().boolOut = false);
                                              setState(() => FFAppState()
                                                  .elapsedbool = false);
                                            }

                                            if ((getJsonField(
                                                  (call?.jsonBody ?? ''),
                                                  r'''$.timeOut''',
                                                ) !=
                                                null)) {
                                              setState(() => FFAppState()
                                                  .elapsedbool = false);
                                              setState(() =>
                                                  FFAppState().boolOut = false);
                                            }
                                            setState(() =>
                                                FFAppState().currentTotal =
                                                    getJsonField(
                                                  (call?.jsonBody ?? ''),
                                                  r'''$.total''',
                                                ).toString());
                                            await Navigator.pushAndRemoveUntil(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                reverseDuration:
                                                    Duration(milliseconds: 500),
                                                child: AnimationInWidget(),
                                              ),
                                              (r) => false,
                                            );
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Warning'),
                                                  content: Text(
                                                      'You have entered an incorrect username/password'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Back'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          setState(() {});
                                        },
                                        text: 'Login',
                                        options: FFButtonOptions(
                                          width: 110,
                                          height: 35,
                                          color: Color(0xFF36383C),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .title3
                                                  .override(
                                                    fontFamily: 'Rubik',
                                                    color: Color(0xFFE6E6E6),
                                                    fontSize: 18,
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
                            ],
                          ),
                        ),
                      ],
                    ),
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
