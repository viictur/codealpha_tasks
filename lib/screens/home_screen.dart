import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class FlashcardHomePage extends StatefulWidget {
  const FlashcardHomePage({super.key});
  @override
  State<FlashcardHomePage> createState() =>
      _FlashcardHomePageState();
}

class _FlashcardHomePageState
    extends State<FlashcardHomePage> {
  List<Flashcard> _flashcards = [];
  int _currentIndex = 0;
  bool _showAnswer = false;
  int _score = 0;
  bool _quizStarted = false;

  final TextEditingController _questionController =
      TextEditingController();
  final TextEditingController _answerController =
      TextEditingController();

  void _addFlashcard() {
    final question = _questionController.text.trim();
    final answer = _answerController.text.trim();
    if (question.isNotEmpty && answer.isNotEmpty) {
      setState(() {
        _flashcards.add(
          Flashcard(question: question, answer: answer),
        );
        _questionController.clear();
        _answerController.clear();
      });
    }
  }

  void _startQuiz() {
    if (_flashcards.isNotEmpty) {
      setState(() {
        _quizStarted = true;
        _currentIndex = 0;
        _score = 0;
        _showAnswer = false;
      });
    }
  }

  void _markCorrect() {
    setState(() {
      _score++;
      _nextFlashcard();
    });
  }

  void _markIncorrect() {
    _nextFlashcard();
  }

  void _nextFlashcard() {
    if (_currentIndex + 1 < _flashcards.length) {
      setState(() {
        _currentIndex++;
        _showAnswer = false;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Quiz Complete'),
            backgroundColor: Colors.blueGrey[200],
            content: Text(
              'Your score: $_score / ${_flashcards.length}',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _quizStarted = false;
                  });
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: Text('Flashcard Quiz'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:
            !_quizStarted
                ? _buildCreateFlashcards()
                : _buildQuiz(),
      ),
    );
  }

  Widget _buildCreateFlashcards() {
    return Column(
      children: [
        TextField(
          controller: _questionController,
          decoration: InputDecoration(
            labelText: 'Enter Question',
          ),
        ),
        TextField(
          controller: _answerController,
          decoration: InputDecoration(
            labelText: 'Enter Answer',
          ),
        ),
        SizedBox(height: 20),
        OutlinedButton(
          onPressed: _addFlashcard,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.grey[200],
          ),
          child: Text('Add Flashcard'),
        ),
        SizedBox(height: 10),
        OutlinedButton(
          onPressed: _startQuiz,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.grey[200],
          ),
          child: Text(
            'Start Quiz (${_flashcards.length} flashcards)',
          ),
        ),
      ],
    );
  }

  Widget _buildQuiz() {
    final card = _flashcards[_currentIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          _showAnswer ? card.answer : card.question,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {
            setState(() {
              _showAnswer = !_showAnswer;
            });
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.grey[200],
          ),
          child: Text(
            _showAnswer ? 'Hide Answer' : 'Show Answer',
          ),
        ),
        SizedBox(height: 20),
        if (_showAnswer)
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: _markCorrect,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.grey[200],
                ),
                child: Text('Correct'),
              ),
              OutlinedButton(
                onPressed: _markIncorrect,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.grey[200],
                ),
                child: Text('Incorrect'),
              ),
            ],
          ),
      ],
    );
  }
}
