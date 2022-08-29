import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/loading_manager.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../controllers/MenuController.dart';
import '../responsive.dart';
import '../services/global_method.dart';
import '../services/utils.dart';
import '../widgets/buttons.dart';
import '../widgets/header.dart';
import '../widgets/side_menu.dart';
import '../widgets/text_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadProductForm extends StatefulWidget {
  static const routeName = '/UploadProductForm';

  const UploadProductForm({Key? key}) : super(key: key);

  @override
  _UploadProductFormState createState() => _UploadProductFormState();
}

class _UploadProductFormState extends State<UploadProductForm> {
  String _catValue = "Pastas";
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController, _priceController;
  int _groupValue = 1;
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  final FirebaseStorage storage = FirebaseStorage.instance;
  @override
  void initState() {
    _priceController = TextEditingController();
    _titleController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  void _uploadForm() async {
    final _firebaseStorage = FirebaseStorage.instance;
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    if (isValid) {
      _formKey.currentState!.save();
      if (_pickedImage == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      }
      final _uuid = const Uuid().v4();

      try {
        // var snapshot = await _firebaseStorage.ref().child('productsImages').child(_uuid + 'jpg');
        // //var downloadUrl = await snapshot.ref.getDownloadURL();

        // // fb.StorageReference storageRef =
        // //     fb.storage().ref().child('productsImages').child(_uuid + 'jpg');

        // final fb.UploadTaskSnapshot uploadTaskSnapshot =
        //     await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
        // Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance.collection('products').doc(_uuid).set({
          'id': _uuid,
          'title': _titleController.text,
          'price': _priceController.text,
          'salePrice': 0.1,
          'imageUrl': '',
          'productCategoryName': _catValue,
          'isOnSale': false,
          'createdAt': Timestamp.now(),
        });
        _clearForm();
        Fluttertoast.showToast(
          msg: "Product uploaded succefully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: ,
          // textColor: ,
          // fontSize: 16.0
        );
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialog(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _clearForm() {
    _groupValue = 1;
    _priceController.clear();
    _titleController.clear();
    setState(() {
      _pickedImage = null;
      webImage = Uint8List(8);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = Utils(context).color;
    final _scaffoldColor = Theme.of(context).scaffoldBackgroundColor;
    Size size = Utils(context).getScreenSize;

    var inputDecoration = InputDecoration(
      filled: true,
      fillColor: _scaffoldColor,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.0,
        ),
      ),
    );
    return LoadingManager(
      isLoading: _isLoading,
      child: Scaffold(
        key: context.read<MenuController>().getAddProductscaffoldKey,
        drawer: const SideMenu(),
        body: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                        title: "Add New Product",
                        fct: () {
                          context
                              .read<MenuController>()
                              .controlAddProductsMenu();
                        }),
                    Container(
                      width: size.width > 650 ? 650 : size.width,
                      color: Colors.yellow,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextWidget(
                              text: 'Product title*',
                              color: color,
                              isTitle: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _titleController,
                              key: const ValueKey('Title'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a Title';
                                }
                                return null;
                              },
                              decoration: inputDecoration,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: 'Price in Rs*',
                                          color: color,
                                          isTitle: true,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: _priceController,
                                              key: const ValueKey('Price \$'),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Price is empty';
                                                }
                                                return null;
                                              },
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(r'[0-9.]')),
                                              ],
                                              decoration: inputDecoration,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextWidget(
                                          text: 'Product category*',
                                          color: color,
                                          isTitle: true,
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              color: _scaffoldColor,
                                              child: Center(
                                                  child: _categoryDropDown())),
                                        ),

                                        const SizedBox(
                                          height: 20,
                                        ),

                                        // Radio button code here
                                      ],
                                    ),
                                  ),
                                ),
                                // Image to be picked code is here
                                Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: _pickedImage == null
                                            ? dottedBorder()
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: kIsWeb
                                                    ? Image.memory(webImage,
                                                        fit: BoxFit.fill)
                                                    : Image.file(
                                                        _pickedImage!,
                                                        fit: BoxFit.fill,
                                                      ),
                                              ),
                                        height: size.width > 650
                                            ? 350
                                            : size.width * 0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: FittedBox(
                                      child: Column(
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                _pickedImage = null;
                                                webImage = Uint8List(8);
                                              });
                                            },
                                            child: TextWidget(
                                              text: 'Clear',
                                              color: Colors.red,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: TextWidget(
                                              text: 'Update image',
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ButtonsWidget(
                                    onPressed: _clearForm,
                                    text: 'Clear form',
                                    icon: IconlyBold.danger,
                                    backgroundColor: Colors.red.shade300,
                                  ),
                                  ButtonsWidget(
                                    onPressed: () {
                                      _uploadForm();
                                    },
                                    text: 'Upload',
                                    icon: IconlyBold.upload,
                                    backgroundColor: Colors.blue,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImg() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();

      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("No image has been picked");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();

      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('b');
        });
      } else {
        print("No image has been picked");
      }
    } else {
      print("Something went wrong");
    }
  }

  Widget _categoryDropDown() {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            hint: Text("Select Category"),
            value: _catValue,
            items: [
              DropdownMenuItem(
                child: Text("Pastas"),
                value: "Pastas",
              ),
              DropdownMenuItem(
                child: Text("Noodles"),
                value: "Noodles",
              ),
              DropdownMenuItem(
                child: Text("Beverages"),
                value: "Beverages",
              ),
            ],
            onChanged: (value) {
              setState(() {
                _catValue = value!;
              });
              print(_catValue);
            }));
  }

  Widget dottedBorder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          radius: Radius.circular(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: Colors.black,
                  size: 50,
                ),
                TextButton(
                    onPressed: () {
                      _pickImg();
                    },
                    child: TextWidget(
                      text: "Choose an image",
                      color: Colors.black,
                    ))
              ],
            ),
          )),
    );
  }
}
