import 'dart:io';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilis/color.dart';

class MessageContainer extends StatefulWidget {
  final String message;
  final File? image;
  final File? audio;
  final bool isSender;
  final String type;
  final String time;

  const MessageContainer({
    super.key,
    required this.message,
    this.image,
    this.audio,
    required this.isSender,
    required this.type,
    required this.time,
  });

  @override
  _MessageContainerState createState() => _MessageContainerState();
}


class _MessageContainerState extends State<MessageContainer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero; // Duration of the audio
  Duration _position = Duration.zero; // Current position of the audio

  @override
  void initState() {
    super.initState();

    // Listen to the player state changes
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        setState(() {
          _isPlaying = false;
          _audioPlayer.seek(Duration.zero);
        });
        // Rewind the audio to the start when it's completed
      }
    });
    _audioPlayer.onPositionChanged.listen((Duration duration) {
      setState(() {
        _position = duration;
      });
    });
    // Listen to the duration of the audio once it's loaded
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _duration = duration;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  // Toggle between play and pause
  void _toggleAudio() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
    } else {
      await _audioPlayer.play(DeviceFileSource(widget.audio!.path));
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  List<InlineSpan> _formatText(String text) {
    final List<InlineSpan> spans = [];

    final RegExp pattern = RegExp(
      r'(###\s?.+|\*\*[^*]+\*\*|---|\*\*\*|___|\n|[^\*#_\n]+)',
      multiLine: true,
    );

    final matches = pattern.allMatches(text);

    for (final match in matches) {
      final String matchText = match.group(0)!;

      if (matchText.startsWith('###')) {
        // عنوان
        spans.add(TextSpan(
          text: matchText.replaceFirst('###', '').trim() + '\n',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: widget.isSender ? Colors.grey.shade700 : Colors.white,
          ),
        ));
      } else if (matchText.startsWith('**') && matchText.endsWith('**')) {
        // نص بولد
        spans.add(TextSpan(
          text: matchText.replaceAll('**', ' '),
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: widget.isSender ? Colors.grey.shade700 : Colors.white,
          ),
        ));
      } else if (matchText.trim() == '---' ||
          matchText.trim() == '***' ||
          matchText.trim() == '___') {
        // خط فاصل
        spans.add(WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              thickness: 1.5,
              color: Colors.white,
            ),
          ),
        ));
      } else if (matchText == '\n') {
        spans.add(const TextSpan(text: '\n'));
      } else {
        // نص عادي
        spans.add(TextSpan(
          text: matchText,
          style: GoogleFonts.roboto(
            fontSize: 14.5,
            fontWeight: FontWeight.normal,
            color: widget.isSender ? Colors.grey.shade700 : Colors.white,
          ),
        ));
      }
    }
    return spans;
  }

  // Seek the audio to a specific position
  void _changeSeek(double value) {
    setState(() {
      _audioPlayer.seek(new Duration(seconds: value.toInt()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.type == 'audio' ? null : const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: widget.type == "audio" ? null : const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: widget.type == 'audio' ? null : BoxDecoration(
        color: widget.isSender
            ? secondaryColor
            : primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30),
          bottomLeft: widget.isSender ? const Radius.circular(30) : Radius.zero,
          bottomRight: widget.isSender ? Radius.zero : const Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.type == "text"
              ? RichText(
            text: TextSpan(
              children: _formatText(widget.message),
            ),
          )
              : widget.type == "audio"
              ? BubbleNormalAudio(
            sent: true,
            color: Color(0xFFE8E8EE),
            isLoading: false,
            isPlaying: _isPlaying,
            onPlayPauseButtonClick: _toggleAudio,
            onSeekChanged: _changeSeek,
            duration: _duration.inSeconds.toDouble(),
            position: _position.inSeconds.toDouble(),

          )
              : ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              widget.image!,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
