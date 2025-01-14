import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:ziggle/app/modules/auth/domain/entities/user_entity.dart';
import 'package:ziggle/app/modules/notices/domain/enums/notice_type.dart';

import '../../domain/repositories/analytics_repository.dart';

@Singleton(as: AnalyticsRepository)
@prod
class ThirdAnalyticsRepository implements AnalyticsRepository {
  static final _analytics = FirebaseAnalytics.instance;

  @override
  logChangeUser(UserEntity? user) {
    _analytics
      ..setUserId(id: user?.uuid)
      ..setUserProperty(name: 'studentId', value: user?.studentId)
      ..setUserProperty(name: 'email', value: user?.email);
  }

  @override
  logScreen(String screenName) {
    _analytics.logScreenView(screenName: screenName);
  }

  _log(String name, [Map<String, Object>? parameters]) {
    _analytics.logEvent(name: name, parameters: parameters);
  }

  @override
  logTryLogin() => _log('try_login');
  @override
  logLoginCancel(String reason) => _log('login_cancel', {'reason': reason});
  @override
  logLogin() => _log('login', {'method': 'IdP'});
  @override
  logLogout() => _log('logout');

  @override
  logTryReminder() => _log('try_reminder');
  @override
  logToggleReminder(bool set) => _log('toggle_reminder', {'set': set ? 1 : 0});

  @override
  logSearch(String query, NoticeType type) => _log('search', {
        'query': query,
        'type': type.name,
      });

  @override
  logOpenFeedback() => _log('open_feedback');
  @override
  logOpenPrivacyPolicy() => _log('open_privacy_policy');
  @override
  logOpenTermsOfService() => _log('open_terms_of_service');
  @override
  logOpenWithdrawal() => _log('open_withdrawal');

  @override
  logTrySelectImage() => _log('try_select_image');
  @override
  logSelectImage() => _log('select_image');
  @override
  logTrySubmitArticle() => _log('try_submit_article');
  @override
  logSubmitArticle() => _log('submit_article');
  @override
  logSubmitArticleCancel(String reason) =>
      _log('submit_article_cancel', {'reason': reason});
  @override
  logTryReport() => _log('try_report');
  @override
  logReport() => _log('report');
}
