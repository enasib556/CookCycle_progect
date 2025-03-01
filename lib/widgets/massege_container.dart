import 'dart:io';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
            ? const Color(0xFFDDE5E5)
            : const Color(0xFFA8BBB3),
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
              ? Text(
            widget.message,
            style: TextStyle(
              color: widget.isSender ? Colors.grey.shade700 : Colors.white,
              fontSize: 16,
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
