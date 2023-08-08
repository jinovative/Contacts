import 'package:url_launcher/url_launcher.dart';

class PhoneServices {
  static Future<void> makeCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('전화를 걸 수 없습니다: $url');
    }
  }

// 필요한 경우 추가 서비스
}
