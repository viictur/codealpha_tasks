import 'package:flutter/material.dart';
import '/models/quote.dart';
import 'package:share_plus/share_plus.dart';
import '../quote_data.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Quote currentQuote;
  double _opacity = 0.0;
  int _textIndex = 0;

  @override
  void initState() {
    super.initState();
    currentQuote = QuoteData().randomQuote();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  void getNewQuote() async {
    setState(() {
      _opacity = 0.0;
    });

    // Wait for the fade-out to complete
    await Future.delayed(Duration(milliseconds: 500));

    // Change the text
    setState(() {
      List<String> texts = [
        currentQuote.text,
        currentQuote.author,
      ];
      _textIndex = (_textIndex + 1) % texts.length;
      currentQuote = QuoteData().randomQuote();
    });

    // Fade in
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      _opacity = 1.0;
    });
  }

  void shareQuote() {
    // ignore: deprecated_member_use
    Share.share(
      '"${currentQuote.text}" - ${currentQuote.author}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quote Generator'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: shareQuote,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Text(
                '"${currentQuote.text}"',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                //overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '- ${currentQuote.author}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getNewQuote,
              child: Text('Get New Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
