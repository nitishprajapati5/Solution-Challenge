// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [mental_health_assessment_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MentalHealthAssessmentTwoModel extends Equatable {
  MentalHealthAssessmentTwoModel({this.userprofileItemList = const []}) {}

  List<UserprofileItemModel> userprofileItemList;

  MentalHealthAssessmentTwoModel copyWith(
      {List<UserprofileItemModel>? userprofileItemList}) {
    return MentalHealthAssessmentTwoModel(
      userprofileItemList: userprofileItemList ?? this.userprofileItemList,
    );
  }

  @override
  List<Object?> get props => [userprofileItemList];
}
