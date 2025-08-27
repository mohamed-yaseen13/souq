// ignore_for_file: prefer_final_fields, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:souq/core/constants/app_constants.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/widgets/app_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:souq/core/widgets/app_screen_template.dart';
import 'package:souq/features/profile/seller_shop/ui/widgets/additional_details_section.dart';
import 'package:souq/features/profile/seller_shop/ui/widgets/basic_info_section.dart';
import 'dart:io';
import 'package:souq/features/profile/seller_shop/ui/widgets/image_section.dart';
import 'package:souq/features/profile/seller_shop/ui/widgets/pricing_section.dart';
import 'package:souq/features/profile/seller_shop/ui/widgets/shipping_section.dart';
import 'package:souq/features/profile/seller_shop/ui/widgets/variants_section.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final ImagePicker _picker = ImagePicker();

  // Form controllers
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _brandController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _originalPriceController = TextEditingController();
  final _colorsController = TextEditingController();
  final _sizesController = TextEditingController();
  final _weightController = TextEditingController();
  final _shippingCostController = TextEditingController();
  final _warrantyController = TextEditingController();
  final _returnPolicyController = TextEditingController();

  // Form variables
  List<File> _selectedImages = [];
  String? _selectedCategory;
  String? _selectedCondition;
  bool _freeShipping = false;
  List<String> _selectedColors = ['Red'];
  List<String> _selectedSizes = ['M'];

  @override
  Widget build(BuildContext context) {
    return AppScreenTemplate(
      title: 'Add Product',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(
              desc: 'Product',
              selectedImages: _selectedImages,
              onTap: _pickImages,
            ),
            verticalSpace(25),
            BasicInfoSection(
              nameController: _nameController,
              descriptionController: _descriptionController,
              brandController: _brandController,
              selectedCategory: _selectedCategory,
              categories: AppConstants.categories,
              selectedCondition: _selectedCondition,
              conditions: AppConstants.conditions,
              onCategoryChanged: (value) =>
                  setState(() => _selectedCategory = value),
              onConditionChanged: (value) =>
                  setState(() => _selectedCondition = value),
            ),
            verticalSpace(25),
            PricingSection(
              priceController: _priceController,
              stockController: _stockController,
              originalPriceController: _originalPriceController,
            ),
            verticalSpace(25),
            VariantsSection(
              colorsController: _colorsController,
              sizesController: _sizesController,
              availableColors: AppConstants.availableColors,
              selectedColors: _selectedColors,
              availableSizes: AppConstants.availableSizes,
              selectedSizes: _selectedSizes,
              onColorSelected: (option) {
                setState(() {
                  if (_selectedColors.contains(option)) {
                    _selectedColors.remove(option);
                  } else {
                    _selectedColors.add(option);
                  }
                });
              },
              onSizeSelected: (option) {
                setState(() {
                  if (_selectedSizes.contains(option)) {
                    _selectedSizes.remove(option);
                  } else {
                    _selectedSizes.add(option);
                  }
                });
              },
            ),
            verticalSpace(25),
            ShippingSection(
              weightController: _weightController,
              shippingCostController: _shippingCostController,
              freeShipping: _freeShipping,
              onChanged: (value) => setState(() => _freeShipping = value!),
            ),
            verticalSpace(25),
            AdditionalDetailsSection(
              warrantyController: _warrantyController,
              returnPolicyController: _returnPolicyController,
            ),
            verticalSpace(30),
            AppButton(onPressed: () {}, desc: 'Add Product'),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage(
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );

    if (images.isNotEmpty && images.length <= 10) {
      setState(() {
        _selectedImages = images.map((xFile) => File(xFile.path)).toList();
      });
    } else if (images.length > 10 && context.mounted) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You can only select up to 10 images'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  //
  //void _submitForm() {
  //  if (_formKey.currentState?.validate() == true) {
  //    // Process form data here
  //    final productData = {
  //      'name': _nameController.text,
  //      'description': _descriptionController.text,
  //      'category': _selectedCategory,
  //      'brand': _brandController.text,
  //      'condition': _selectedCondition,
  //      'price': double.tryParse(_priceController.text) ?? 0.0,
  //      'stock': int.tryParse(_stockController.text) ?? 1,
  //      'originalPrice': double.tryParse(_originalPriceController.text),
  //      'colors': _selectedColors,
  //      'sizes': _selectedSizes,
  //      'weight': double.tryParse(_weightController.text),
  //      'shippingCost': double.tryParse(_shippingCostController.text),
  //      'freeShipping': _freeShipping,
  //      'tags': _tagsController.text.split(',').map((e) => e.trim()).toList(),
  //      'warranty': _warrantyController.text,
  //      'returnPolicy': _returnPolicyController.text,
  //      'images': _selectedImages,
  //    };
  //
  //    print('Product Data: $productData');
  //
  //    ScaffoldMessenger.of(context).showSnackBar(
  //      const SnackBar(
  //        content: Text('Product added successfully!'),
  //        backgroundColor: Colors.green,
  //      ),
  //    );
  //  }
  //}
}
