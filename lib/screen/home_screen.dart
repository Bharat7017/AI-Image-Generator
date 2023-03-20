// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:image_generator/service/ai_handler.dart';
import 'package:image_generator/widget/description_field.dart';
import 'package:image_generator/widget/image_downlod_button.dart';
import 'package:image_generator/widget/image_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final aiHandler = AIHandler();
  String? _imageUrl;
  bool _isGenerating = false;

  @override
  void dispose() {
    aiHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Generator"),
        actions: [
          ImageDownload(
            imageUrl: _imageUrl,
            isGenerating: _isGenerating,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageContainer(
                imageUrl: _imageUrl,
                isGenerating: _isGenerating,
              ),
              SizedBox(
                height: 20,
              ),
              DescriptionField(onSubmitted: generateImage),
            ],
          ),
        ),
      ),
    );
  }

  void generateImage(String prompt) async {
    setState(() {
      _isGenerating = true;
    });
    final result = await aiHandler.generateImage(prompt);
    setState(() {
      _isGenerating = false;
      _imageUrl = result;
    });
    print(result);
  }
}
