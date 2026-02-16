import 'package:dartz/dartz.dart';
import 'package:e_learning/core/networking/api_constant.dart';
import 'package:e_learning/core/networking/dio_helper.dart';
import 'package:e_learning/core/utils/typedef.dart';
import 'package:e_learning/feature/quiz/data/models/question_model.dart';

class QuestionsRepository {
  final DioHelper _dioHelper;

  QuestionsRepository(this._dioHelper);
  Result getQuestions() async {
    try {
      final response = await _dioHelper.getData(
        endPoint: ApiConstant.endPoint,
        queryParameters: ApiConstant.queryParameters,
      );
      final model = QuestionModel.fromJson(response.data);
      if (model.responseCode == 0) {
        return right(model);
      } else if (model.responseCode == 5) {
        return left('too many requests');
      } else {
        return left('Server Error : ${model.responseCode}');
      }
    } catch (e) {
      return left('Network Error : ${e.toString()}');
    }
  }
}
