import 'package:just_audio/just_audio.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key, required this.location});
  final String location;

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  void initState() {
    setup();

    super.initState();
  }

  final player = AudioPlayer();

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  void setup() async {
    AudioSource source = AudioSource.uri(Uri.parse(widget.location));
    await player.setAudioSource(source);
    player.bufferedPositionStream.listen((event) {});
    player.playerStateStream.listen((state) {
      if (!state.playing) setState(() => isPlaying = false);

      if (state.playing) {
        setState(() => isPlaying = true);
      } else {}
      switch (state.processingState) {
        case ProcessingState.idle:
          {
            player.seek(Duration.zero);
          }
        case ProcessingState.loading:
          {}
        case ProcessingState.buffering:
          {}
        case ProcessingState.ready:
          {}
        case ProcessingState.completed:
          {
            player.stop();
            player.seek(Duration.zero);
          }
      }
    });
  }

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PlayPauseButton(
          isPlaying: isPlaying,
          onTap: () {
            player.play();
          },
        )
      ],
    );
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({super.key, this.onTap, required this.isPlaying});
  final bool isPlaying;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: AppColors.primary900, size: 30),
        ),
      ),
    );
  }
}
