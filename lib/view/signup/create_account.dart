import 'package:email_validator_flutter/email_validator_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mybar/DataRepository/remoteService.dart';
import 'package:mybar/common/common.dart';
import 'package:mybar/view/signin/signin.dart';
import 'package:mybar/view/verify/account_verify.dart';
import 'package:mybar/widgets/toast.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/signup_provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _mobileKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _dateform = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  int minAge = 18;
  bool _isChecked = false;
  bool _Checked = false;
  bool isPasswordVisible = true;

  EmailValidatorFlutter emailValidatorFlutter = EmailValidatorFlutter();

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select date of birth";
    }

    DateTime selectedDate = DateFormat('yyyy-MM-dd').parse(value);
    int age = DateTime.now().year - selectedDate.year;
    if (DateTime.now().month < selectedDate.month ||
        (DateTime.now().month == selectedDate.month &&
            DateTime.now().day < selectedDate.day)) {
      age--;
    }

    if (age < minAge) {
      return "You must be at least $minAge years old.";
    }

    return null;
  }

  _launchURLBrowser() async {
    var url = Uri.parse("https://www.mybar.sg/p/terms/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
      body: Consumer<SignupProvider>(builder: (context, signupProvider, child) {
        return Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create Account",
                        style: GoogleFonts.tajawal(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: blackColor,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6.h, bottom: 2.h),
                        child: Form(
                          key: _mobileKey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: signupProvider.mobileNoController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: secondryColor,
                              border: InputBorder.none,
                              prefixIcon: Image.asset(
                                "assets/icons/phone.png",
                                scale: 3,
                              ),
                              hintStyle: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: greyColor,
                              ),
                              hintText: "Mobile Number",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                              // border: OutlineInputBorder(),
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter phone number";
                              } else if (value!.length < 8) {
                                return "Please enter valid phone number";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                        child: Form(
                          key: _emailKey,
                          child: TextFormField(
                            controller: signupProvider.emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: secondryColor,
                              border: InputBorder.none,
                              prefixIcon: Image.asset(
                                "assets/icons/mail.png",
                                scale: 3,
                                color: greyColor,
                              ),
                              hintStyle: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: greyColor,
                              ),
                              hintText: "@jonesjhon.com",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // border: OutlineInputBorder(),
                            ),
                            style: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter email";
                              } else if (!emailValidatorFlutter
                                  .validateEmail(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      Form(
                        key: _dateform,
                        onChanged: () {
                          _dateform.currentState!.validate();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          child: TextFormField(
                              keyboardType: TextInputType.none,
                              controller: signupProvider.dobController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: secondryColor,
                                border: InputBorder.none,
                                prefixIcon: Image.asset(
                                  "assets/icons/calender.png",
                                  scale: 3,
                                ),
                                hintStyle: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor,
                                ),
                                hintText: "Date of Birth",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color(0xffF6F6F6)), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color(0xffF6F6F6)), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color(0xffF6F6F6)), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color(0xffF6F6F6)), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      String time = DateFormat.MMMEd().format(
                                        signupProvider
                                                .dobController.text.isEmpty
                                            ? DateTime.now()
                                            : DateTime.parse(
                                                "${signupProvider.dobController.text}"),
                                      );
                                      return StatefulBuilder(builder:
                                          (context, StateSetter setState) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 48.h,
                                            width: 80.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Select Date",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Text(
                                                  "${time}",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 19.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Divider(),
                                                SfDateRangePicker(
                                                  controller: _controller,
                                                  // onSelectionChanged: _onSelectionChanged,
                                                  selectionMode:
                                                      DateRangePickerSelectionMode
                                                          .single,
                                                  navigationDirection:
                                                      DateRangePickerNavigationDirection
                                                          .vertical,
                                                  initialSelectedDate:
                                                      signupProvider
                                                              .dobController
                                                              .text
                                                              .isEmpty
                                                          ? DateTime.now()
                                                          : DateTime.parse(
                                                              "${signupProvider.dobController.text}"),
                                                  maxDate: DateTime.now(),
                                                  showActionButtons: true,
                                                  toggleDaySelection: true,
                                                  initialDisplayDate: signupProvider
                                                          .dobController
                                                          .text
                                                          .isEmpty
                                                      ? DateTime.now()
                                                      : DateTime.parse(
                                                          "${signupProvider.dobController.text}"),
                                                  onSelectionChanged: (value) {
                                                    // print("value ${value.value}");
                                                    setState(
                                                      () {
                                                        time = DateFormat
                                                                .MMMEd()
                                                            .format(DateTime.parse(
                                                                "${value.value}"));
                                                        print("Time $time");
                                                      },
                                                    );
                                                  },
                                                  onCancel: () {
                                                    Navigator.pop(context);
                                                  },
                                                  onSubmit: (value) {
                                                    print("value$value");

                                                    DateTime pickedDate =
                                                        DateTime.parse(
                                                            "${value}");
                                                    if (pickedDate != null &&
                                                        pickedDate !=
                                                            selectedDate) {
                                                      setState(() {
                                                        selectedDate =
                                                            pickedDate;
                                                      });

                                                      int age =
                                                          DateTime.now().year -
                                                              pickedDate.year;
                                                      if (DateTime.now().month <
                                                              pickedDate
                                                                  .month ||
                                                          (DateTime.now()
                                                                      .month ==
                                                                  pickedDate
                                                                      .month &&
                                                              DateTime.now()
                                                                      .day <
                                                                  pickedDate
                                                                      .day)) {
                                                        age--;
                                                      }
                                                    }

                                                    if (pickedDate != null) {
                                                      print(
                                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                                      String formattedDate =
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(
                                                                  pickedDate);
                                                      print(
                                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                                      //you can implement different kind of Date Format here according to your requirement

                                                      setState(() {
                                                        signupProvider
                                                                .dobController
                                                                .text =
                                                            formattedDate; //set output date to TextField value.
                                                      });
                                                    } else {
                                                      print(
                                                          "Date is not selected");
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    });
                              },
                              style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                              ),
                              validator: _validateAge),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                        child: Form(
                          key: _passwordKey,
                          child: TextFormField(
                            controller: signupProvider.passwordController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: secondryColor,
                              border: InputBorder.none,
                              prefixIcon: SizedBox(
                                height: 3.h,
                                child: Image.asset(
                                  "assets/icons/lock.png",
                                  scale: 3,
                                ),
                              ),
                              suffixIcon: SizedBox(
                                height: 3.h,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: isPasswordVisible == true
                                      ? Icon(
                                          Icons.visibility_off,
                                          color: greyColor,
                                        )
                                      : Icon(
                                          Icons.visibility,
                                          color: greyColor,
                                        ),
                                ),
                              ),
                              hintStyle: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: greyColor,
                              ),
                              hintText: "Password",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color(0xffF6F6F6)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // border: OutlineInputBorder(),
                            ),
                            obscureText: isPasswordVisible,
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              } else if (value.length < 6) {
                                return "Password should be atleast 6 characters";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: Checkbox(
                              //focusColor: Colors.deepOrangeAccent,
                              activeColor: Colors.blue,
                              checkColor: Colors.white,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value != false;
                                });
                              },
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                          Text(
                            "I agree with the ",
                            style: GoogleFonts.tajawal(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _launchURLBrowser();
                            },
                            child: Text(
                              "Terms",
                              style: GoogleFonts.tajawal(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          Text(
                            " and ",
                            style: GoogleFonts.tajawal(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _launchURLBrowser();
                            },
                            child: Text(
                              "Privacy Policy",
                              style: GoogleFonts.tajawal(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                            value: _Checked,
                            onChanged: (bool? value) {
                              setState(() {
                                _Checked = value ?? false;
                              });
                            },
                            visualDensity: VisualDensity.compact,
                          ),
                          Text(
                            "I am of legal drinking age in Singapore",
                            style: GoogleFonts.tajawal(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          _dateform.currentState!.validate();
                          _mobileKey.currentState!.validate();
                          _emailKey.currentState!.validate();

                          if (_passwordKey.currentState!.validate()) {
                            if (_Checked == true && _isChecked == true) {
                              await RemoteService.signup(
                                  contactNo:
                                      signupProvider.mobileNoController.text,
                                  email: signupProvider.emailController.text,
                                  dob: signupProvider.dobController.text,
                                  password:
                                      signupProvider.passwordController.text,
                                  signupProvider: signupProvider,
                                  context: context);
                            } else if (_isChecked == false) {
                              showCustomToast(
                                  "Please Agree with Terms and Condition!");
                            } else if (_Checked == false) {
                              showCustomToast(
                                  "Please agree with you have legal drinking age!");
                            }
                          }
                        },
                        child: Container(
                          width: 100.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                gradientColor,
                                gradientColor1,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                              child: Text(
                                "Sign up",
                                style: GoogleFonts.tajawal(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: secondryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "I’m already a member, ",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signin()),
                              );
                            },
                            child: Text(
                              "Sign in",
                              style: GoogleFonts.tajawal(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (signupProvider.isLoading == true)
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Loading",
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
          ],
        );
      }),
    );
  }
}
