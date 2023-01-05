import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local/local_store.dart';
import '../model/user_model.dart';
import 'congrats_page.dart';

class FillBio extends StatefulWidget {
  const FillBio({super.key});

  @override
  State<FillBio> createState() => _FillBioState();
}

class _FillBioState extends State<FillBio> {
  final ImagePicker _picker = ImagePicker();
  String imagePath = '';
  TextEditingController fullname = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController address = TextEditingController();
  bool value = false;
  bool visibilityOfpasswor = false;
  bool isFullNameEmpty = false;
  bool isNickNameEmpty = false;
  bool isPhoneNumberEmpty = false;
  bool isGenderEmpty = false;
  bool isDateOfBirthEmpty = false;
  bool isAddressEmpty = false;
  String datetext = '';
  var items = ['Male', 'Female'];
  String initialvalue = 'Male';

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
            icon: Icon(
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
                        padding: EdgeInsets.only(
                            left: 150, right: 150, top: 23, bottom: 23),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(-0, 1),
                                  color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xffFAFAFA),
                            border: Border.all(color: Color(0xffEBEEF2))),
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
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff06C149)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                child: Icon(
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
                        padding: EdgeInsets.only(
                            left: 150, right: 150, top: 23, bottom: 23),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(-0, 1),
                                  color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xffFAFAFA),
                            border: Border.all(color: Color(0xffEBEEF2))),
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
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff06C149)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 24),
                                child: Icon(
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
                : SizedBox.shrink(),
            24.verticalSpace,
            imagePath.isEmpty
                ? SizedBox.shrink()
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
                                            title: Text('Choose'),
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
                                                  child: Text("Take photo")),
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
                                                  child: Text("From Gallery")),
                                              CupertinoButton(
                                                  onPressed: (() async {
                                                    imagePath = '';
                                                    Navigator.pop(context);
                                                    setState(() {});
                                                  }),
                                                  child: Text('Delete')),
                                              CupertinoButton(
                                                  onPressed: (() async {
                                                    Navigator.pop(context);
                                                  }),
                                                  child: Text('Cancel'))
                                            ],
                                          )));
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 35.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xff06C149),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
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
                                  color: Color(0xff2C3A4B)),
                            ),
                            Text(
                              '*',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffDA1414)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 24, right: 24),
                        child: TextFormField(
                          onChanged: (value) {
                            isFullNameEmpty = false;
                            setState(() {});
                          },
                          controller: fullname,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
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
                      isFullNameEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, top: 8, right: 24),
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
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
                                          color: Color(0xff394452)),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 36),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Color(0xffEBEEF2)),
                              ),
                            )
                          : SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.only(left: 48, top: 35),
                        child: Row(
                          children: [
                            Text(
                              'Nick Name',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2C3A4B)),
                            ),
                            Text(
                              '*',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffDA1414)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 24, right: 24),
                        child: TextFormField(
                          onChanged: (value) {
                            isNickNameEmpty = false;
                            setState(() {});
                          },
                          controller: nickname,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
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
                      isNickNameEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, top: 8, right: 24),
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
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
                                          color: Color(0xff394452)),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 36),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Color(0xffEBEEF2)),
                              ),
                            )
                          : SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.only(left: 48, top: 35),
                        child: Row(
                          children: [
                            Text(
                              'Phone Number',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2C3A4B)),
                            ),
                            Text(
                              '*',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffDA1414)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 24, right: 24),
                        child: TextFormField(
                          onChanged: (value) {
                            isPhoneNumberEmpty = false;
                            setState(() {});
                          },
                          controller: phonenumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 24, right: 80, top: 12, bottom: 12),
                            hintText: 'Phone Number',
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
                      isPhoneNumberEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, top: 8, right: 24),
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(
                                        Icons.error,
                                        color: Color(0xff394452),
                                      ),
                                    ),
                                    Text(
                                      'Please fill the Phone Number',
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff394452)),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.only(
                                    top: 6, bottom: 6, left: 36),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: Color(0xffEBEEF2)),
                              ),
                            )
                          : SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.only(left: 48, top: 35),
                        child: Row(
                          children: [
                            Text(
                              'Date of Birth',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2C3A4B)),
                            ),
                            Text(
                              '*',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffDA1414)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 24, right: 24),
                        child: TextFormField(
                          onChanged: (value) {
                            isDateOfBirthEmpty = false;
                            setState(() {});
                          },
                          controller: dateOfBirth,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (() {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1970),
                                        lastDate: DateTime.now())
                                    .then((value) {
                                  dateOfBirth.text = DateFormat('MMMM dd, yyyy')
                                      .format(value ?? DateTime.now());
                                  setState(() {});
                                });
                              }),
                              icon: SvgPicture.asset(
                                'assets/svg/calendar.svg',
                                height: 24,
                                width: 24,
                                color: Colors.grey,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 24, right: 24, top: 12, bottom: 12),
                            hintText: 'Date of Birth',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 48, top: 35),
                        child: Row(
                          children: [
                            Text(
                              'Address',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2C3A4B)),
                            ),
                            Text(
                              '*',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffDA1414)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 24, right: 24),
                        child: TextFormField(
                          onChanged: (value) {
                            isAddressEmpty = false;
                            setState(() {});
                          },
                          controller: address,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 24, right: 80, top: 12, bottom: 12),
                            hintText: 'Address',
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
                    ],
                  ),
            35.verticalSpace,
            GestureDetector(
                onTap: () async {
                  if (imagePath.isNotEmpty) {
                    LocalStore locall = LocalStore();
                    UserModel newuser = await locall.getUser();
                    UserModel user = UserModel(
                        adress: newuser.adress,
                        fullName: newuser.fullName,
                        image: imagePath,
                        nickName: newuser.nickName,
                        phoneNumber: newuser.phoneNumber);

                    locall.setUser(user);
                    if (fullname.text.isNotEmpty &&
                      nickname.text.isNotEmpty &&
                      phonenumber.text.isNotEmpty &&
                      address.text.isNotEmpty) {
                    UserModel user = UserModel(
                        adress: address.text,
                        fullName: fullname.text,
                        nickName: nickname.text,
                        phoneNumber: phonenumber.text,
                        image: imagePath);

                    SharedPreferences local =
                        await SharedPreferences.getInstance();
                    local.setString('user', jsonEncode(user.toJson()));

                    String userLocal = local.getString('user') ?? '';
                    UserModel newUser =
                        UserModel.fromJson(jsonDecode(userLocal));
                        

                    // SharedPreferences _store =
                    //     await SharedPreferences.getInstance();
                    // _store.setString('nickname', nickname.text);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => CongratsPage())));
                  }
                  }
                  if (fullname.text.isEmpty) {
                    isFullNameEmpty = true;
                    setState(() {});
                  } else if (nickname.text.isEmpty) {
                    isNickNameEmpty = true;
                    setState(() {});
                  } else if (phonenumber.text.isEmpty) {
                    isPhoneNumberEmpty = true;
                    setState(() {});
                  } else if (address.text.isEmpty) {
                    isAddressEmpty = true;
                    setState(() {});
                  }
                  
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    decoration: BoxDecoration(
                      color: imagePath.isEmpty ||
                              fullname.text.isEmpty ||
                              nickname.text.isEmpty ||
                              phonenumber.text.isEmpty ||
                              address.text.isEmpty
                          ? Color.fromARGB(255, 138, 234, 172)
                          : Color(0xff06C149),
                      borderRadius: BorderRadius.all(Radius.circular(32)),
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
