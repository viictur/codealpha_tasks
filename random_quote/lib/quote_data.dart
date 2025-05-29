import 'dart:math';

import 'package:random_quote/models/quote.dart';

class QuoteData {
  final List<Quote> quotes = [
    Quote(
      text:
          "The only limit to our realization of tomorrow is our doubts of today.",
      author: "Franklin D. Roosevelt",
    ),
    Quote(
      text: "In the middle of difficulty lies opportunity.",
      author: "Albert Einstein",
    ),
    Quote(
      text: "Stay hungry, stay foolish.",
      author: "Steve Jobs",
    ),
    Quote(
      text:
          "The best way to get started is to quit talking and begin doing.",
      author: "Walt Disney",
    ),
    Quote(
      text: "It always seems impossible until it's done.",
      author: "Nelson Mandela",
    ),
    Quote(
      text:
          "If people like you they will listen to you, but if they trust you, they'll do business with you.",
      author: "Zig Ziglar",
    ),
    Quote(
      text:
          "If we did all the things we are capable of doing, we would literally astound ourselves.",
      author: "Thomas Edison",
    ),
    Quote(
      text:
          "No one gets more out of life than he puts in it.",
      author: "David Oyedepo",
    ),
    Quote(
      text: "Leadership develops daily, not in a day",
      author: "John C. Maxwell",
    ),
    Quote(
      text:
          "By failing to prepare, you're preparing to fail.",
      author: "Benjamin Franklin",
    ),
    Quote(
      text: "A leader is a need meeter.",
      author: "David Oyedepo",
    ),
  ];

  Quote randomQuote() {
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }
}
