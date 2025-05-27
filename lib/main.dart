import 'package:flutter/material.dart';
import 'package:image_circular_progress/image_circular_progress.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProgressDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProgressDemo extends StatefulWidget {
  const ProgressDemo({super.key});

  @override
  State<ProgressDemo> createState() => _ProgressDemoState();
}

class _ProgressDemoState extends State<ProgressDemo> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _simulateApiCall();
  }

  Future<void> _simulateApiCall() async {
    // simulate API call
    await Future.delayed(const Duration(seconds: 3));
    // avoid error if the screen has already been discarded
    if (!mounted) return;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Image Circular Progress',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child:
              _loading
                  ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ImageCircularProgress(
                        value: null,
                        centerImage: Image.asset('logo.png'),
                        size: 100,
                        color: Colors.orangeAccent,
                        backgroundColor: Colors.grey.shade300,
                        strokeWidth: 6.0,
                        semanticsLabel: 'Progress indicator',
                        pulseOpacity: true,
                      ),
                    ],
                  )
                  : const Text(
                    'Content loaded successfully!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
        ),
      ),
    );
  }
}
