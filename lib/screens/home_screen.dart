import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   var text = "Click on Mic to Record !";
  SpeechToText speechToText = SpeechToText();

  var isListening = false;
 

  void checkMic() async {
    bool micAvailable = await speechToText.initialize();

    if (micAvailable) {
      print("MicroPhone Available");
    } else {
      print("User denied the use of speech microphone");
    }
  }

  @override
  void initState() {
    super.initState();
    checkMic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Speech To Text"),
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(text),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (!isListening) {
                    bool micAvailable = await speechToText.initialize();
                    if (micAvailable) {
                      setState(() {
                        isListening = true;
                      });

                      speechToText.listen(
                          listenFor: const Duration(seconds: 30),
                          onResult: (result) {
                            setState(() {
                              text = result.recognizedWords;
                              isListening = false;
                            });
                          });
                    } else {
                      setState(() {
                        isListening = false;

                        speechToText.stop();
                      });
                    }
                  }
                },
                child: CircleAvatar(
                  child: isListening
                      ? const Icon(Icons.record_voice_over)
                      : const Icon(Icons.mic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
