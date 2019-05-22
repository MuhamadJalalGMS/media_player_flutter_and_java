////import 'package:audioplayer/audioplayer.dart';
////
////AudioPlayer audioPlugin = new AudioPlayer();
////
////Future<void> play() async {
////  await audioPlayer.play(kUrl);
////  setState(() => playerState = PlayerState.playing);
////}
////
////Future<void> pause() async {
////  await audioPlayer.pause();
////  setState(() => playerState = PlayerState.paused);
////}
////
////Future<void> stop() async {
////  await audioPlayer.stop();
////  setState(() {
////    playerState = PlayerState.stopped;
////    position = new Duration();
////  });
////}
//
//
//
//import 'package:audio_service/audio_service.dart';
//
//AudioService.connect();   // When UI becomes visible
//AudioService.start(       // When user clicks button to start playback
//backgroundTask: myBackgroundTask,
//androidNotificationChannelName: 'Music Player',
//androidNotificationIcon: "mipmap/ic_launcher",
//);
//AudioService.disconnect(); // When UI is gone
//
//
//
//void myBackgroundTask() {
//  AudioServiceBackground.run(
//      onStart: () async {
//        // Your custom dart code to start audio playback.
//        // NOTE: The background audio task will shut down
//        // as soon as this async function completes.
//      },
//      onPlay: () {
//        // Your custom dart code to resume audio playback.
//      },
//      onPause: () {
//    // Your custom dart code to pause audio playback.
//  },
//  onStop: () {
//  // Your custom dart code to stop audio playback.
//  },
//  onClick: (MediaButton button) {
//  // Your custom dart code to handle a media button click.
//  },
//  );
//}