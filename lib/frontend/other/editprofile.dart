import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> _selectedCategories = [];
  String? _selectedGender;
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
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
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
        ),
        title: AppText.subtitle("Edit Profile"),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'FirstName',
                                weight: FontWeight.normal,
                              ),
                              SizedBox(height: 5),
                              AppTextFeild(hintText: 'Enter First Name'),
                            ],
                          ),

                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Last Name',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          AppTextFeild(hintText: 'Enter Last Name'),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'Country geo loaction',
                                weight: FontWeight.normal,
                              ),
                              SizedBox(height: 5),
                              AppTextFeild(
                                hintText: 'use your current location',
                                prefixIcon: Icon(
                                  LucideIcons.locateFixed,
                                  size: 20,
                                  color: API.linkcolor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          AppText.smalltitle(
                            'Category',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildMultiSelect<String>(
                            items: categoriesList,
                            selectedItems: _selectedCategories,
                            hintText: 'Select Categories',
                            onConfirm: (values) {
                              setState(() {
                                _selectedCategories = values;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'Stage/Screen Name',
                                weight: FontWeight.normal,
                              ),
                              SizedBox(height: 5),
                              AppTextFeild(hintText: 'Enter Stage/Screen Name'),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.smalltitle(
                                      'Age',
                                      weight: FontWeight.normal,
                                    ),
                                    SizedBox(height: 5),
                                    AppTextFeild(
                                      hintText: 'Enter Age',
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.smalltitle(
                                      'Gender',
                                      weight: FontWeight.normal,
                                    ),
                                    SizedBox(height: 5),
                                    API.buildDropdown(
                                      items: [
                                        'Male',
                                        'Female',
                                        'Prefer not to say',
                                      ],
                                      hintText: 'Select Gender',
                                      selectedItem: _selectedGender,
                                      onChanged: (val) {
                                        setState(() {
                                          _selectedGender = val;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Prefered Pronun',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['He', 'She', 'They', 'Prefer not to say'],
                            hintText: 'Select Prefered Pronun',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        AppText.smalltitle(
                                          'Height',
                                          weight: FontWeight.normal,
                                        ),
                                        SizedBox(width: 5),
                                        AppText.smalltitle(
                                          '*',
                                          weight: FontWeight.normal,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    AppTextFeild(
                                      hintText: 'Enter Height',
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.smalltitle(
                                      'Weight',
                                      weight: FontWeight.normal,
                                    ),
                                    SizedBox(height: 5),
                                    AppTextFeild(
                                      hintText: 'Enter Weight',
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Etinicity',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Etinicity',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Complexion',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Complexion',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Body Type',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildDropdown(
                            items: ['item1', 'item2', 'item3', 'item4'],
                            hintText: 'Select Body Type',
                            selectedItem: _selectedGender,
                            onChanged: (val) {
                              setState(() {
                                _selectedGender = val;
                              });
                            },
                          ),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Language Known',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          API.buildMultiSelect<String>(
                            items: categoriesList,
                            selectedItems: _selectedCategories,
                            hintText: 'Select Language Known',
                            onConfirm: (values) {
                              setState(() {
                                _selectedCategories = values;
                              });
                            },
                          ),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Language accent if Malayalam selected',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          AppTextFeild(hintText: 'Enter Accent'),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Location in India',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          AppTextFeild(hintText: 'Enter Location'),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'District',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          AppTextFeild(hintText: 'Enter District'),

                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Other',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              AppCheckbox(
                                label: 'Passport',
                                value: _isChecked,
                                onChanged: (val) {
                                  setState(() {
                                    _isChecked = val ?? false;
                                  });
                                },
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                borderColor: Colors.grey,
                              ),
                              SizedBox(width: 20),
                              AppCheckbox(
                                label: 'Driving License',
                                value: _isChecked,
                                onChanged: (val) {
                                  setState(() {
                                    _isChecked = val ?? false;
                                  });
                                },
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                                borderColor: Colors.grey,
                              ),

                            ],
                          ),
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
                          AppText.smalltitle('Hips', weight: FontWeight.normal),
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
                              Expanded(
                                child: AppButton(
                                  text: "Save",
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  width: 100,
                                ),
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
