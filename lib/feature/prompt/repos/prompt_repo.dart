import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PromptRepo {
  static generateImage(String prompt) async {
    try {
      String url = 'https://api.vyro.ai/v1/imagine/api/generations';

      Map<String, dynamic> headers = {
        'Authorization': 'Bearer vk-***************'
      };

      Map<String, dynamic> payload = {
        'prompt': prompt,
        'style_id': '122',
        'aspect_ratio': '1:1',
        'cfg': '5',
        'seed': '1',
        'high_res_results': '1'
      };

      FormData formData = FormData.fromMap(payload);

      Dio dio = Dio();
      dio.options = BaseOptions(headers: headers);

      final response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        List<int> bytes = response.data.bytes;
        File file = File('image.jpg');
        file.writeAsBytes(bytes);
        return file;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
