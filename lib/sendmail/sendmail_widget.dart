import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../homepage/homepage_widget.dart';
import '../mailsentlottie/mailsentlottie_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SendmailWidget extends StatefulWidget {
  const SendmailWidget({Key key}) : super(key: key);

  @override
  _SendmailWidgetState createState() => _SendmailWidgetState();
}

class _SendmailWidgetState extends State<SendmailWidget> {
  ApiCallResponse stats;
  TextEditingController bodyController;
  TextEditingController recipientController;
  TextEditingController subjectController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bodyController = TextEditingController();
    recipientController = TextEditingController();
    subjectController = TextEditingController();
  }

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
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: TextFormField(
                  controller: recipientController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'recipientController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Recipient\'s Email address ',
                    hintText: 'Recipient\'s Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4C4C4C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4C4C4C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    suffixIcon: recipientController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => recipientController.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 20,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: TextFormField(
                  controller: subjectController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'subjectController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    hintText: 'Enter subject',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4C4C4C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4C4C4C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    suffixIcon: subjectController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => subjectController.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 20,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: TextFormField(
                  controller: bodyController,
                  onChanged: (_) => EasyDebounce.debounce(
                    'bodyController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    hintText: 'Enter Body',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4C4C4C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4C4C4C),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    suffixIcon: bodyController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => bodyController.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              size: 20,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    stats = await GetCSVCall.call(
                      mail: recipientController.text,
                      subj: subjectController.text,
                      body: bodyController.text,
                      authToken: FFAppState().newAuthorization,
                    );
                    if ((stats?.succeeded ?? true)) {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                          reverseDuration: Duration(milliseconds: 0),
                          child: MailsentlottieWidget(),
                        ),
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Failed'),
                            content: Text('mail not sent, enter a recipient'),
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

                    setState(() {});
                  },
                  text: 'Generate CSV and Send',
                  options: FFButtonOptions(
                    width: 260,
                    height: 40,
                    color: Color(0xFF36383C),
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Rubik',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
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
