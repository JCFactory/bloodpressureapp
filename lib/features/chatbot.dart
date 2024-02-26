import 'package:flutter/material.dart';
import 'package:watson_assistant/watson_assistant.dart';

class ChatbotView extends StatefulWidget {
  @override
  ChatbotViewState createState() {
    return ChatbotViewState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class ChatbotViewState extends State<ChatbotView> {
  final _formKey = GlobalKey<FormState>();
  String _text;

  //ASSISTANT_ID='8815a6fe-fa28-4db6-9e43-980038ec3f95''
  //ASSISTANT_IAM_APIKEY='7x_8h_kMA0-AbLcTW5gLTiMtbtcGPZZVbbqsBcVQNvCM'
  //ASSISTANT_IAM_URL='https://gateway-lon.watsonplatform.net/assistant/api'

  WatsonAssistantCredential credential = WatsonAssistantCredential(
      username: "YOUR USERNAME",
      password: "YOUR PASSWORD",
      workspaceId: "YOUR WORKSPACE ID");

  WatsonAssistantApiV1 watsonAssistant;
  WatsonAssistantResult watsonAssistantResponse;
  WatsonAssistantContext watsonAssistantContext =
      WatsonAssistantContext(context: {});

  final myController = TextEditingController();

  void _callWatsonAssistant() async {
    watsonAssistantResponse = await watsonAssistant.sendMessage(
        myController.text, watsonAssistantContext);
    setState(() {
      _text = watsonAssistantResponse.resultText;
    });
    watsonAssistantContext = watsonAssistantResponse.context;
    myController.clear();
  }

  @override
  void initState() {
    super.initState();
    watsonAssistant =
        WatsonAssistantApiV1(watsonAssistantCredential: credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jack dein Chatbot'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.restore,
            ),
            onPressed: () {
              watsonAssistantContext.resetContext();
              setState(() {
                _text = null;
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: myController,
            ),
            Text(
              _text != null ? '$_text' : 'Watson Response Here',
              // style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callWatsonAssistant,
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
