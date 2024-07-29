class PromptRepo {
  static generateImage(String prompt) async {

    String url = 'https://api.vyro.ai/v1/imagine/api/generations';

    

  }
}



headers = {
  'Authorization': 'Bearer vk-***************'
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