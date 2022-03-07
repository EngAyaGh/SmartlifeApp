


import 'package:crm_smart/api/api.dart';

import '../constants.dart';

class  AuthServices{

  Future<bool> send_otp(String email) async {
    String result = await Api()
        .post( url:"Auth/send_otp.php",body: {
          'email':email
    } );
    return result=="done"? true:false;
  }
  Future<bool> verfiy_otp(String email,String otp) async {
    String result = await Api()
        .post( url:"Auth/send_otp.php",body: {
      'email':email,
      'otp':otp
    } );
    return result=="done"? true:false;
  }

}