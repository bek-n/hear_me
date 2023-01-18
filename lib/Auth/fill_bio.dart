import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'congrats_page.dart';

class FillBio extends StatefulWidget {
  const FillBio({super.key});

  @override
  State<FillBio> createState() => _FillBioState();
}

class _FillBioState extends State<FillBio> {
  final ImagePicker _picker = ImagePicker();
  String imagePath = "";

  TextEditingController fullname = TextEditingController();
  TextEditingController nickname = TextEditingController();

  bool isFullNameFilled = false;
  bool isNickFilled = false;

  bool value = false;
  bool visibilityOfpasswor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Fill Your Profile',
          style: Theme.of(context).textTheme.headline2,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imagePath.isEmpty
                ? Column(
                    children: [
                      50.verticalSpace,
                      Container(
                        padding: const EdgeInsets.only(
                            left: 150, right: 150, top: 23, bottom: 23),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(-0, 1),
                                  color: Colors.grey)
                            ],
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: const Color(0xffFAFAFA),
                            border: Border.all(color: const Color(0xffEBEEF2))),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                final XFile? photo = await _picker
                                    .pickImage(source: ImageSource.camera)
                                    .then((value) async {
                                  if (value != null) {
                                    CroppedFile? cropperImage =
                                        await ImageCropper()
                                            .cropImage(sourcePath: value.path);
                                    imagePath = cropperImage?.path ?? '';
                                    setState(() {});
                                  }
                                });
                                setState(() {});
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff06C149)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                child: const Icon(
                                  Icons.photo_camera,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'Take photo',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,
                      Container(
                        padding: const EdgeInsets.only(
                            left: 150, right: 150, top: 23, bottom: 23),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(-0, 1),
                                  color: Colors.grey)
                            ],
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: const Color(0xffFAFAFA),
                            border: Border.all(color: const Color(0xffEBEEF2))),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                final XFile? image = await _picker
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) async {
                                  if (value != null) {
                                    CroppedFile? cropperImage =
                                        await ImageCropper()
                                            .cropImage(sourcePath: value.path);
                                    imagePath = cropperImage?.path ?? '';
                                    setState(() {});
                                  }
                                });
                                setState(() {});
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff06C149)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                child: const Icon(
                                  Icons.folder,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'From gallery',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            24.verticalSpace,
            imagePath.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 140.h,
                            width: 140.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: FileImage(
                                      File(imagePath),
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  showCupertinoDialog(
                                      context: context,
                                      builder: ((context) =>
                                          CupertinoAlertDialog(
                                            title: const Text('Choose'),
                                            actions: [
                                              CupertinoButton(
                                                  onPressed: (() async {
                                                    _picker
                                                        .pickImage(
                                                            source: ImageSource
                                                                .camera)
                                                        .then((value) async {
                                                      if (value != null) {
                                                        CroppedFile?
                                                            _cropperImage =
                                                            await ImageCropper()
                                                                .cropImage(
                                                                    sourcePath:
                                                                        value
                                                                            .path);
                                                        if (_cropperImage !=
                                                            null) {
                                                          imagePath =
                                                              _cropperImage
                                                                  .path;
                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      }
                                                    });
                                                  }),
                                                  child: const Text("Take photo")),
                                              CupertinoButton(
                                                  onPressed: (() async {
                                                    _picker
                                                        .pickImage(
                                                            source: ImageSource
                                                                .gallery)
                                                        .then((value) async {
                                                      if (value != null) {
                                                        CroppedFile?
                                                            _cropperImage =
                                                            await ImageCropper()
                                                                .cropImage(
                                                                    sourcePath:
                                                                        value
                                                                            .path);
                                                        if (_cropperImage !=
                                                            null) {
                                                          imagePath =
                                                              _cropperImage
                                                                  .path;
                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      }
                                                    });
                                                  }),
                                                  child: const Text("From Gallery")),
                                              CupertinoButton(
                                                  onPressed: (() async {
                                                    imagePath = '';
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  }),
                                                  child: const Text('Delete')),
                                              CupertinoButton(
                                                  onPressed: (() async {
                                                    Navigator.pop(context);
                                                  }),
                                                  child: const Text('Cancel'))
                                            ],
                                          )));
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 35.w,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff06C149),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 48, top: 20),
                        child: Row(
                          children: [
                            Text(
                              'Full Name',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff2C3A4B)),
                            ),
                            Text(
                              '*',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffDA1414)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 24, right: 24),
                        child: TextFormField(
                          onChanged: (value) {
                            isFullNameFilled = false;
                            setState(() {});
                          },
                          controller: fullname,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 24, right: 80, top: 12, bottom: 12),
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffDADEE3)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 221, 206, 206)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 221, 206, 206)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                          ),
                        ),
                      ),
                      isFullNameFilled == true
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, top: 8, right: 24),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 6, bottom: 6, left: 36),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Color(0xffEBEEF2)),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Icon(
                                        Icons.error,
                                        color: Color(0xff394452),
                                      ),
                                    ),
                                    Text(
                                      'Please fill the Full Name',
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff394452)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.only(left: 48, top: 35),
                        child: Row(
                          children: [
                            Text(
                              'Nick Name',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff2C3A4B)),
                            ),
                            Text(
                              '*',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xffDA1414)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 24, right: 24),
                        child: TextFormField(
                          onChanged: (value) {
                            isNickFilled = false;
                            setState(() {});
                          },
                          controller: nickname,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 24, right: 80, top: 12, bottom: 12),
                            hintText: 'Nick Name',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffDADEE3)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 221, 206, 206)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 221, 206, 206)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                          ),
                        ),
                      ),
                      isNickFilled == true
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, top: 8, right: 24),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 6, bottom: 6, left: 36),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Color(0xffEBEEF2)),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Icon(
                                        Icons.error,
                                        color: Color(0xff394452),
                                      ),
                                    ),
                                    Text(
                                      'Please fill the Nick Name',
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff394452)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
            35.verticalSpace,
            GestureDetector(
                onTap: () async {
                  if (fullname.text.isEmpty) {
                    isFullNameFilled = true;
                    setState(() {});
                  } else if (nickname.text.isEmpty) {
                    isNickFilled = true;
                    setState(() {});
                  }
                  if (fullname.text.isNotEmpty && nickname.text.isNotEmpty) {
                    // UserModel user = UserModel(
                    //     fullName: fullname.text,
                    //     nickName: nickname.text,
                    //     image: '');

                    // SharedPreferences local =
                    //     await SharedPreferences.getInstance();
                    // local.setString('user', jsonEncode(user.toJson()));

                    // String userLocal = local.getString('user') ?? '';
                    // UserModel newUser =
                    //     UserModel.fromJson(jsonDecode(userLocal));

                    SharedPreferences _store =
                        await SharedPreferences.getInstance();
                    _store.setString('nickname', nickname.text);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => const CongratsPage())));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    decoration: BoxDecoration(
                      color: imagePath.isEmpty ||
                              fullname.text.isEmpty ||
                              nickname.text.isEmpty
                          ? const Color.fromARGB(255, 138, 234, 172)
                          : const Color(0xff06C149),
                      borderRadius: const BorderRadius.all(Radius.circular(32)),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
