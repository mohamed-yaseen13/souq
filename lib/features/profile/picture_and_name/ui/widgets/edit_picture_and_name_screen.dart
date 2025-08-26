import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/helpers/extensions.dart';
import 'package:souq/core/helpers/shared_pref.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/core/widgets/email_text_form_field.dart';
import 'package:souq/core/widgets/name_text_form_field.dart';
import 'package:souq/features/profile/picture_and_name/data/picture_and_name_request_model.dart';
import 'package:souq/features/profile/picture_and_name/logic/cubit/picture_and_name_cubit.dart';
import 'package:souq/features/profile/picture_and_name/logic/cubit/picture_and_name_state.dart';
import 'package:souq/features/profile/picture_and_name/ui/widgets/picture_avatar.dart';

class EditPictureAndNameScreen extends StatefulWidget {
  const EditPictureAndNameScreen({super.key});

  @override
  State<EditPictureAndNameScreen> createState() =>
      _EditPictureAndNameScreenState();
}

class _EditPictureAndNameScreenState extends State<EditPictureAndNameScreen> {
  late TextEditingController nameController;
  late String originalName;
  File? originalImage;
  File? currentImage;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    originalName = SharedPref.getUserName();
    nameController = TextEditingController(text: originalName);
    final String email = SharedPref.getUserEmail();
    emailController = TextEditingController(text: email);
    nameController.addListener(() {
      setState(() {});
    });
  }

  bool isSaved = false;

  bool get _isNameChanged => nameController.text != originalName;

  bool get _isImageChanged => originalImage?.path != currentImage?.path;

  bool get _hasChanges => (_isNameChanged || _isImageChanged) && !isSaved;

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      title: 'Edit Your Info',
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.h),
        child: PopScope(
          canPop: !_hasChanges,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
            if (_hasChanges) {
              await showDialog<bool>(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text('Unsaved Changes'),
                    content: const Text(
                      'You have unsaved changes. Do you want to save before leaving?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                          context.pop();
                        },
                        child: const Text('Discard'),
                      ),
                      TextButton(
                        onPressed: () {
                          context.pop();
                          _onSave();
                        },
                        child: const Text('Save'),
                      ),
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: BlocBuilder<PictureAndNameCubit, PictureAndNameState>(
            builder: (context, state) {
              return Column(
                children: [
                  PictureAvatar(
                    initialImage: originalImage,
                    onImageChanged: (newImage) {
                      setState(() {
                        currentImage = newImage;
                      });
                    },
                  ),
                  verticalSpace(64),
                  NameTextFormField(nameController: nameController),
                  verticalSpace(12),
                  EmailTextFormField(
                    emailController: emailController,
                    readOnly: true,
                  ),
                  Spacer(),
                  state is PictureAndNameLoading
                      ? CircularProgressIndicator()
                      : AppButton(
                          onPressed: () {
                            _onSave();
                          },
                          desc: 'Save Changes',
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onSave() {
    final String? name = _isNameChanged ? nameController.text : null;
    final request = PictureAndNameRequestModel(
      imageFile: currentImage,
      name: name,
    );
    context.read<PictureAndNameCubit>().editPictureOrName(request);
    setState(() {
      isSaved = true;
    });
  }
}
