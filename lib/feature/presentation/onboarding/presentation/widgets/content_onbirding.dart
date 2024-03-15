import 'package:flutter/material.dart';
import 'package:zahra/feature/presentation/onboarding/presentation/widgets/onboarding_video.dart';
 
class OnbordingContent {
  Widget video;
  String title;
  String discription;

  OnbordingContent(
      {required this.video, required this.title, required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      title: 'Vision of the school',
      video: OnboardingVideo(video: 'assets/videos/video2.mp4'),
      discription:
          "Book an appointment with secritury. Attend via appointment letter. Get consultent."),
  OnbordingContent(
      title: 'Vision of the school',
      video: OnboardingVideo(video: 'assets/videos/video3.mp4'),
      discription:
          "Book an appointment with secritury. Attend via appointment letter. Get consultent."),
  OnbordingContent(
      title: 'Vision of the school',
      video: OnboardingVideo(video: 'assets/videos/video4.mp4'),
      discription:
          "Book an appointment with secritury. Attend via appointment letter. Get consultent."),
];
