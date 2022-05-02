import '../animation_out/animation_out_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimationInWidget extends StatefulWidget {
  const AnimationInWidget({Key key}) : super(key: key);

  @override
  _AnimationInWidgetState createState() => _AnimationInWidgetState();
}

class _AnimationInWidgetState extends State<AnimationInWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 1100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, -100),
        scale: 0,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      await Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 0),
          reverseDuration: Duration(milliseconds: 0),
          child: AnimationOutWidget(),
        ),
        (r) => false,
      );
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
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
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 100),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: Image.asset(
                'assets/images/image_(2).png',
              ).image,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF1A1A1A),
              )
            ],
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Color(0xFF1A1A1A),
            ),
          ),
        ).animated([animationsMap['containerOnPageLoadAnimation']]),
      ),
    );
  }
}
