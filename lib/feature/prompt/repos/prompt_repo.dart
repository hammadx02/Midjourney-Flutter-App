class PromptRepo {
  static generateImage(String prompt) async {

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

  }
}





# Using None here allows us to treat the parameters as string
payload = {
  
}

response = requests.post(url, headers=headers, files=payload)

if response.status_code == 200:  # if request is successful
  with open('image.jpg', 'wb') as f:
    f.write(response.content)
else:
  print("Error:", response.status_code)