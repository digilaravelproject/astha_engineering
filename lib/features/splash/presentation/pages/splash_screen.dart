import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/constants/app_constants.dart';
import 'package:safecheck_techno/core/services/storage/shared_prefs.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0.0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();
    
    _navigateToNext();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToNext() async {
    // Simulate loading time
    await Future.delayed(const Duration(seconds: 3));
    
    // Check if user is logged in
    final token = SharedPrefs.getString(AppConstants.tokenKey);
    final isLoggedIn = token != null && token.isNotEmpty;

    if (mounted) {
      if (isLoggedIn) {
        context.go(Routes.roleSelection); // Dashboard feature
      } else {
        context.go(Routes.login); // Auth feature
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
          children: [
            // Custom Background Pattern
            Positioned.fill(
              child: CustomPaint(
                painter: _MazePatternPainter(),
              ),
            ),
            
            // Animated Centered Text
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end, // Align 'Techno' to the right of 'SafeCheck'
                    children: [
                      Text(AppStrings.safecheck,
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1.5,
                          height: 1.0,
                        ),
                      ),
                      Text(AppStrings.techno,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withAlpha(230),
                          letterSpacing: 0.5,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

// Background Pattern to mimic the provided image
class _MazePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withAlpha(15) // Very subtle opacity
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final path = Path();
    
    // Draw some diagonal maze-like lines
    final double spacing = 60.0;
    
    // We create a diagonal grid and draw segmented lines to look like a maze
    for (double i = -size.height; i < size.width + size.height; i += spacing) {
      // Draw 45 degree lines
      path.moveTo(i, 0);
      path.lineTo(i + size.height, size.height);
      
      // Draw -45 degree lines
      path.moveTo(i, size.height);
      path.lineTo(i + size.height, 0);
    }

    // Add some random labyrinth breaks by drawing over with background color or drawing selectively.
    // To keep it performant and simple, a continuous diagonal grid with thick strokes creates a great tech-vibe.
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

