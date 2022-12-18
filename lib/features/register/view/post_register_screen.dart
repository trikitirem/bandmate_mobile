import 'package:flutter/material.dart';
import 'package:mobile/core/components/input/multi_select/multi_select.dart';
import 'package:mobile/core/components/text/error_message.dart';
import 'package:mobile/features/home/view/home_screen.dart';
import 'package:mobile/features/register/model/post_register.dart';
import 'package:mobile/features/register/view/lists.dart';
import 'package:provider/provider.dart';
import '../../../core/components/input/button.dart';
import '../provider/post_register_provider.dart';

class PostRegisterScreen extends StatefulWidget {
  const PostRegisterScreen({super.key});
  static String path = '/postregister';

  @override
  State<PostRegisterScreen> createState() => _PostRegisterScreenState();
}

class _PostRegisterScreenState extends State<PostRegisterScreen> {
  final PostRegister _data = PostRegister();

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<PostRegisterProvider>().loading;
    final errorMessage = context.watch<PostRegisterProvider>().errorMessage;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Select instruments you play",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  MultiSelect(
                    items: instrumentList,
                    selectedItems: _data.instruments,
                    onClick: (selected) {
                      setState(() {
                        _data.instruments = selected;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const Text(
                    "...and genres you prefer",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  MultiSelect(
                    items: genreList,
                    selectedItems: _data.genres,
                    onClick: (selected) {
                      setState(() {
                        _data.genres = selected;
                      });
                    },
                  ),
                  ErrorMessage(
                    errorMessage: errorMessage,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Button(
                  label: loading == true ? "Loading..." : "Done",
                  onClick: () =>
                      context.read<PostRegisterProvider>().postRegister(
                    context,
                    _data,
                    () {
                      if (!mounted) {
                        return;
                      }
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          HomeScreen.path, (route) => false);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
