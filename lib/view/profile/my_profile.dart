import 'package:email_validator_flutter/email_validator_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mybar/common/common.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var dateController = TextEditingController();
  var genderController = TextEditingController();
  var nameController = TextEditingController();
  var locationController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  TextEditingController dateinp = TextEditingController();
  DateTime? selectedDate;
  int minAge = 18;
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

  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Male';
  bool isButton = false;
  bool _showpopUp = false;

  EmailValidatorFlutter emailValidatorFlutter = EmailValidatorFlutter();
  void _toggleContainer() async {
    setState(() {
      _showpopUp = !_showpopUp;
      isButton = !isButton;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _showpopUp = !_showpopUp;
      isButton = !isButton;
    });
  }

  void dispose() {
    dateController;
    genderController;
    nameController;
    emailController;
    locationController;
    numberController;
    super.dispose();
  }

  DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.transparent, ,),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              onChanged: () =>
                  setState(() => isButton = _formKey.currentState!.validate()),
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                children: [
                  Container(
                    width: 100.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff84182B),
                          Color(0xffB31430),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 5.w, top: 4.h, bottom: 1.h),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: secondryColor,
                                    ))),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x33000000),
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8.h),
                            border: Border.all(color: greyColor),
                          ),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/profile.png",
                                scale: 3.8,
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Icon(
                                  Icons.photo_camera,
                                  color: secondryColor,
                                  size: 3.5.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "C Jordan",
                          style: GoogleFonts.tajawal(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w700,
                            color: secondryColor,
                          ),
                        ),
                        SizedBox(
                          height: 0.8.h,
                        ),
                        Text(
                          "jordanc5500gmail.com",
                          style: GoogleFonts.tajawal(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: secondryColor,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff828282),
                          ),
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              "assets/icons/person_icon.png",
                              scale: 3,
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            hintText: "C Jordan",
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Email",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff828282),
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              "assets/icons/Email.png",
                              scale: 3,
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            hintText: "jordanc5500gmail.com",
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else if (!emailValidatorFlutter
                                .validateEmail(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Phone No",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff828282),
                          ),
                        ),
                        TextFormField(
                          controller: numberController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              "assets/icons/phone.png",
                              scale: 3,
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            hintText: "Mobile Number",
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else if (value!.length < 8) {
                              return "Please enter valid phone number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.w, right: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date of Birth",
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff828282),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 27.w),
                                child: Text(
                                  "Gender",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff828282),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.none,
                                readOnly: true,
                                controller: dateController,
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset(
                                    "assets/icons/date.png",
                                    scale: 3,
                                  ),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  hintText: "Select date",
                                  hintStyle: GoogleFonts.tajawal(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        String time = DateFormat.MMMEd().format(
                                            dateinp.text.isEmpty
                                                ? DateTime.now()
                                                : DateTime.parse(
                                                    "${dateinp.text}"));
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
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                    initialSelectedDate: dateinp
                                                            .text.isEmpty
                                                        ? DateTime.now()
                                                        : DateTime.parse(
                                                            "${dateinp.text}"),
                                                    maxDate: DateTime.now(),
                                                    showActionButtons: true,
                                                    toggleDaySelection: true,
                                                    initialDisplayDate: dateinp
                                                            .text.isEmpty
                                                        ? DateTime.now()
                                                        : DateTime.parse(
                                                            "${dateinp.text}"),
                                                    onSelectionChanged:
                                                        (value) {
                                                      // print("value ${value.value}");
                                                      setState(
                                                        () {
                                                          time = DateFormat
                                                                  .MMMEd()
                                                              .format(DateTime
                                                                  .parse(
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

                                                        int age = DateTime.now()
                                                                .year -
                                                            pickedDate.year;
                                                        if (DateTime.now()
                                                                    .month <
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

                                                        if (age < minAge) {
                                                          // Show error or handle age validation failure
                                                          // ScaffoldMessenger.of(context).showSnackBar(
                                                          //   SnackBar(
                                                          //     content: Text(
                                                          //         "You must be at least $minAge years old."),
                                                          //   ),
                                                          // );
                                                        } else {
                                                          // Proceed with valid age
                                                          // Your logic here...
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
                                                          dateController.text =
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
                                  // DateTime? pickedDate = await showDatePicker(
                                  //   context: context,
                                  //   initialDate: selectedDate ?? DateTime.now(),
                                  //   firstDate: DateTime(
                                  //       1950), //DateTime.now() - not to allow to choose before today.
                                  //   lastDate: DateTime.now(),

                                  //   builder: (context, child) {
                                  //     return Theme(
                                  //       data: Theme.of(context).copyWith(
                                  //         colorScheme: const ColorScheme.light(
                                  //           primary:
                                  //               primaryColor, // <-- SEE HERE
                                  //           onPrimary:
                                  //               Colors.white, // <-- SEE HERE
                                  //           onSurface: Colors.black,

                                  //           // <-- SEE HERE
                                  //         ),
                                  //         textButtonTheme: TextButtonThemeData(
                                  //           style: TextButton.styleFrom(
                                  //             primary:
                                  //                 primaryColor, // button text color
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       child: child!,
                                  //     );
                                  //   },
                                  // );
                                  // if (pickedDate != null) {
                                  //   print(
                                  //       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  //   String formattedDate =
                                  //       DateFormat('yyyy-MM-dd')
                                  //           .format(pickedDate);
                                  //   print(
                                  //       formattedDate); //formatted date output using intl package =>  2021-03-16
                                  //   //you can implement different kind of Date Format here according to your requirement

                                  //   setState(() {
                                  //     dateController.text =
                                  //         formattedDate; //set output date to TextField value.
                                  //   });
                                  // } else {
                                  //   print("Date is not selected");
                                  // }
                                },
                                style: GoogleFonts.tajawal(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: primaryColor,
                                ),
                                validator: _validateAge,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 3.w),
                                height: 7.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11.sp),
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(15, 14, 15, 0.431))),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 1.5.h, left: 4.w),
                                      child: Image.asset(
                                        "assets/icons/male.png",
                                        scale: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.w,
                                    ),
                                    Container(
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton<String>(
                                            value: dropdownValue,
                                            items: <String>[
                                              'Male',
                                              'Female',
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: GoogleFonts.tajawal(
                                                    fontSize: 19.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: primaryColor,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            // Step 5.
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownValue = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Address",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff828282),
                          ),
                        ),
                        TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              "assets/icons/location.png",
                              scale: 3,
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            hintText: "Duxten Road, 338750",
                            hintStyle: GoogleFonts.tajawal(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  isButton == true
                      ? InkWell(
                          onTap: _toggleContainer,
                          child: Container(
                            width: 50.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff851729),
                                  Color(0xffAF1731),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              // border: Border.all(color: Color(0xffC11331)),
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 1.2.h, bottom: 0.5.h),
                                child: Text(
                                  "SAVE",
                                  style: GoogleFonts.tajawal(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w700,
                                    color: secondryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
          if (_showpopUp == true)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 7.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, -4),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                  child: Text(
                    "Changes Updated Successfully",
                    style: GoogleFonts.tajawal(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
