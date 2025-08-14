import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileInfo3 extends StatefulWidget {
  const ProfileInfo3({super.key});

  @override
  State<ProfileInfo3> createState() => _ProfileInfo3State();
}

class _ProfileInfo3State extends State<ProfileInfo3> {
  List<String> _selectedCategories = [];
  String? _selectedGender;
  String? _selectedCountryCode;
  bool isObsured = false;
  bool _isChecked = false;

  final List<String> categoriesList = [
    'Actor',
    'Actress',
    'Director',
    'Producer',
    'Writer',
    'Cinematographer',
    'Editor',
    'Composer',
    'Sound Designer',
    'Costume Designer',
    'Makeup Artist',
    'Stunt Coordinator',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: API.cardbg,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: API.cardbg.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(Icons.arrow_back, size: 20),
            ),
          ),
        ),
        title: AppText.subtitle("Profile Info"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [API.appcolor, API.subcolor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SizedBox(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.smalltitle(
                            'Skill',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildMultiSelect<String>(
                            items: categoriesList,
                            selectedItems: _selectedCategories,
                            hintText: 'Select Skill',
                            onConfirm: (values) {
                              setState(() {
                                _selectedCategories = values;
                              });
                            },
                          ),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Hair Color',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Hair Color',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Eye Color',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Eye Color',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Chest Size',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Chest Size',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Hips',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Hips',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Waist',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Waist',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Dress Size',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Dress Size',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Voice Style',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Voice Style',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                 Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),

                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    height: 12,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      color: API.appcolor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),

                                ],
                              ),
                              AppButton(
                                text: "Next",
                                onPressed: () {},
                                width: 100,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
