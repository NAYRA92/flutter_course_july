import 'package:flutter/material.dart';
import 'package:flutter_course_july/constant.dart';
import 'package:google_generative_ai/google_generative_ai.dart';


class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

var ai_model = GenerativeModel(
  model: "gemini-2.5-flash", 
  apiKey: "",
  systemInstruction: Content.text("Only answer the question if it is related to gerocery products. If not, say 'I am sorry, I can only answer questions related to gerocery products'."));

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _inputController = TextEditingController();

  final _modelChat = ai_model.startChat();
  String? _outputResponse;
  final List<String> _outputResponseList = [];

  Future<void> _generateChatResponse(
    String msg
  ) async {
    final content = Content.text(msg);
    final response = await _modelChat.sendMessage(content);
    _outputResponse = response.text;
    setState(() {
      _outputResponseList.add(_outputResponse!);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TextFormField(
              controller: _inputController,
              decoration: InputDecoration(
                hintText: "Only Ask About Gerocery",
                hintStyle: app_text_style().copyWith(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.amber.shade500
              ),
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _outputResponseList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(_outputResponseList[index],
                style: app_text_style().copyWith(
                  color: Colors.black87
                ),),
              );
            },
          ),
        ),
      ],
    ),
    
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        _generateChatResponse(_inputController.text);
        _inputController.clear();
      },
      child: const Icon(Icons.send),
    ),
    
    );
  }
}








