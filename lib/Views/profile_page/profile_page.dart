import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lawgism/Controllers/locale_controller.dart';
import 'package:lawgism/Controllers/auth_controller.dart';
import 'package:lawgism/Components/ElevatedContainer.dart';
import 'package:lawgism/Components/CustomDialog.dart';
import 'package:lawgism/Utils/validators/fullname_validator.dart';
import 'package:lawgism/Utils/validators/phone_validator.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/Profile";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    //final double sh = deviceSize.height;
    final double sw = deviceSize.width;

    final double textFieldHeight = 42;

    final AuthController _authController =
        Provider.of<AuthController>(context, listen: false);

    _showErrorDialog(String errorMessage) {
      showDialog(
        context: context,
        builder: (ctx) => CustomDialog(
          title: "Something went wrong..",
          description: errorMessage,
          positiveButtonText: "",
          negativeButtonText: "Okay",
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile".tr),
        actions: [
          CupertinoSwitch(
            value: true,
            onChanged: (v) {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 600,
              width: sw,
              margin: EdgeInsets.only(
                left: 0.05 * sw,
                right: 0.05 * sw,
                top: 0.07 * sw,
                bottom: 0.020 * sw,
              ),
              child: ElevatedContainer(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 0.03 * sw,
                    right: 0.04 * sw,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor,
                        Colors.white,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.22, 0.22, 1.0],
                    ),
                  ),
                  child: Selector<AuthController, bool>(
                    selector: (_, profile) => profile.editEnabled,
                    builder: (_, editEnabled, __) => Stack(
                      children: <Widget>[
                        Positioned(
                          top: 45,
                          height: 120,
                          left: 0,
                          width: 120,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedContainer(
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Selector<AuthController, String>(
                                    selector: (_, profileProvider) {
                                      return profileProvider.user.photoUrl;
                                    },
                                    builder: (_, photo, __) {
                                      return Stack(
                                        children: [
                                          photo == null || photo == ""
                                              ? Container(
                                                  child: IconButton(
                                                    icon: Icon(Icons.camera_alt,
                                                        color: Theme.of(context)
                                                            .accentColor),
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (_) {
                                                          return PhotoDialog(
                                                            staticProfile:
                                                                _authController,
                                                          );
                                                        },
                                                      );
                                                    },
                                                    padding:
                                                        EdgeInsets.all(30.0),
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Theme.of(context)
                                                            .primaryColorLight,
                                                    iconSize: 30.0,
                                                  ),
                                                )
                                              : CachedNetworkImage(
                                                  imageUrl: photo,
                                                  fit: BoxFit.cover,
                                                ),
                                          Positioned(
                                            bottom: 0,
                                            child: InkWell(
                                              child: Container(
                                                width: 92,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 3),
                                                child: Center(
                                                  child: Text(
                                                    "Change Photo".tr,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (_) {
                                                    return PhotoDialog(
                                                      staticProfile:
                                                          _authController,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 155,
                          left: 10,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Account".tr,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                SizedBox(
                                  width: 72.0,
                                  child: FlatButton(
                                    onPressed: () async {
                                      if (editEnabled) {
                                        if (_formKey.currentState != null &&
                                            _formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();

                                          _authController.isLoading = true;
                                          await _authController
                                              .updateOnlineProfile();
                                          _authController.editEnabled =
                                              !editEnabled;

                                          _authController.isLoading = false;
                                        }
                                      } else
                                        _authController.editEnabled =
                                            !editEnabled;
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    child: Text(
                                      editEnabled ? "Save".tr : "Edit".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 225.0,
                          height: 600.0 - 225.0,
                          left: 10.0,
                          right: 0.0,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              //mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      height: 30.0,
                                      width: 30.0,
                                      child: Icon(
                                        Icons.person,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Name".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          Container(
                                            height: textFieldHeight,
                                            child: TextFormField(
                                              controller: _authController
                                                  .nameController,
                                              enabled: editEnabled,
                                              validator: validateFullName,
                                              onSaved: (fullName) {
                                                _authController.updateProfile(
                                                    name: fullName);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      height: 30.0,
                                      width: 30.0,
                                      child: Icon(
                                        Icons.email,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Email".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          Container(
                                            height: textFieldHeight,
                                            child: TextFormField(
                                              controller: _authController
                                                  .emailController,
                                              enabled: false,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              onSaved: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      height: 30.0,
                                      width: 30.0,
                                      child: Icon(
                                        Icons.phone,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Phone".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          Container(
                                            height: textFieldHeight,
                                            child: TextFormField(
                                              controller: _authController
                                                  .phoneController,
                                              enabled: editEnabled,
                                              keyboardType: TextInputType.phone,
                                              validator: validatePhone,
                                              onSaved: (phone) {
                                                _authController.updateProfile(
                                                    phone: phone);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      height: 30.0,
                                      width: 30.0,
                                      child: Icon(
                                        Icons.home_rounded,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Address".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          Container(
                                            height: textFieldHeight,
                                            child: TextFormField(
                                              controller: _authController
                                                  .addressController,
                                              enabled: editEnabled,
                                              onSaved: (address) {
                                                _authController.updateProfile(
                                                    address: address);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedContainer(
              height: 60,
              width: 0.9 * sw,
              radius: 4.0,
              child: InkWell(
                onTap: () {
                  Provider.of<AuthController>(context, listen: false).signOut();
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Text(
                          "Sign Out".tr,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14.0,
                      ),
                      const SizedBox(width: 15.0),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.07 * sw,
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoDialog extends StatelessWidget {
  final AuthController staticProfile;

  PhotoDialog({required this.staticProfile});

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Change Profile Photo'.tr,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                try {
                  PickedFile? photo = await picker.getImage(
                    source: ImageSource.camera,
                    maxWidth: 400,
                    maxHeight: 400,
                  );

                  Navigator.of(context).pop();

                  if (photo != null)
                    await staticProfile.updatePhoto(File(photo.path));
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.maxFinite,
                child: Text(
                  'Take Photo'.tr,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                try {
                  PickedFile? photo = await picker.getImage(
                    source: ImageSource.gallery,
                    maxWidth: 400,
                    maxHeight: 400,
                  );

                  Navigator.of(context).pop();

                  if (photo != null)
                    await staticProfile.updatePhoto(File(photo.path));
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                width: double.maxFinite,
                child: Text(
                  'Choose Photo'.tr,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
