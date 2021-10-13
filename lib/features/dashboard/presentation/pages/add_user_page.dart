import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodyn_rest/core/bloc/config_bloc/config_bloc.dart';
import 'package:foodyn_rest/core/data/models/location_model.dart';
import 'package:foodyn_rest/core/services/validator_service.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/botton_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/dropdown_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/password_text_form_widget.dart';
import 'package:foodyn_rest/features/auth/presentation/widgets/text_form_widget.dart';
import 'package:foodyn_rest/features/dashboard/presentation/widgets/dropdown_group_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/config/router/router.dart';
import '../../../../core/config/theme/global_theme.dart';
import '../../../../core/utils/theme_brightness.dart';
import '../../../../core/widgets/scaffold_container_widget.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';

class AddUserPage extends StatefulWidget {
  static const kRouteName = "/add-user";

  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  late PageController _pageController;
  late int _selectedIndex;
  late int _selectedGroupIndex;
  final _formEmailKey = GlobalKey<FormState>();
  final _formPhoneKey = GlobalKey<FormState>();
  final _formUsernameKey = GlobalKey<FormState>();
  List<LocationModel> _locations = [];
  List<String> _groupList = [];
  int _selectedDialCodeIndex = 0;
  int _selectedDialCode = 0;
  late ConfigBloc _configBloc;
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _usernameTextEditingController =
      TextEditingController();
  final TextEditingController _emailPasswordTextEditingController =
      TextEditingController();
  final TextEditingController _phonePasswordTextEditingController =
      TextEditingController();
  final TextEditingController _usernamePasswordTextEditingController =
      TextEditingController();

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 1.1);
    _selectedIndex = 0;
    _configBloc =  context.read<ConfigBloc>();
    if (_configBloc.state.locations != null && _configBloc.state.locations!.isNotEmpty) {
      _locations = _configBloc.state.locations!;
      _locations.sort((a, b) {
        return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
      });
    }
    super.initState();
  }

  void _addByEmail() {}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _configBloc)
      ],
      child: ScaffoldContainerWidget(
        logout: false,
        title: "Add User",
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: "By".text.xl.make(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(),
                      child: InkWell(
                        onTap: () => _pageController.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuart),
                        child: "Email"
                            .text
                            .color((_selectedIndex == 0)
                                ? GlobalTheme.kOrangeColor
                                : (Colors.grey.shade500))
                            .xl
                            .make(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () => _pageController.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuart),
                        child: "Phone"
                            .text
                            .color((_selectedIndex == 1)
                                ? GlobalTheme.kOrangeColor
                                : (Colors.grey.shade500))
                            .xl
                            .make(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () => _pageController.animateToPage(2,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOutQuart),
                        child: "Username"
                            .text
                            .color((_selectedIndex == 2)
                                ? GlobalTheme.kOrangeColor
                                : (Colors.grey.shade500))
                            .xl
                            .make(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 320,
                child: PageView(
                  onPageChanged: (index) =>
                      setState(() => _selectedIndex = index),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1 / _pageController.viewportFraction,
                      child: Form(
                        key: _formEmailKey,
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: TextFormWidget(
                                    controller: _emailTextEditingController,
                                    onChanged: (_) {},
                                    hint: "Email",
                                    keyboardType: TextInputType.emailAddress,
                                    validator: ValidatorService.emailValidator,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: PasswordTextFormWidget(
                                  controller: _emailPasswordTextEditingController,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: DropdownGroupWidget(
                                          onSelect: (name, index) {
                                            setState(() {
                                              _selectedGroupIndex = index;
                                            });
                                          },
                                        )),
                                  ),
                                ],
                              ),
                              ButtonWidget(
                                onTap: _addByEmail,
                                children: [
                                  "Create"
                                      .text
                                      .xl
                                      .color((isDark(context))
                                          ? GlobalTheme.kPrimaryColor
                                          : GlobalTheme.kAccentColor)
                                      .make(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1 / _pageController.viewportFraction,
                      child: Form(
                        key: _formPhoneKey,
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: DropdownFormWidget(
                                          onSelect: (code, index) => setState(() {
                                            _selectedDialCodeIndex = index;
                                            final jsonResult = json.decode(code);
                                            _selectedDialCode = int.parse(jsonResult["dialCode"]);
                                          }),
                                          defaultIndex: _selectedDialCodeIndex,
                                          list: _locations.map((e) {
                                            return json.encode({
                                              "code": e.code!.toString(),
                                              "dialCode": e.dialCode!.toString(),
                                            });
                                          }).toList(),
                                          modifyListOutput: (text) {
                                            final jsonResult = json.decode(text);
                                            return jsonResult["code"] +
                                                " (+" +
                                                jsonResult["dialCode"] +
                                                ")";
                                          },
                                          modifySelectedOutput: (text) {
                                            final jsonResult = json.decode(text);
                                            return jsonResult["code"] +
                                                " (+" +
                                                jsonResult["dialCode"] +
                                                ")";
                                          },
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: TextFormWidget(
                                          onChanged: (_) {},
                                          hint: "Phone number",
                                          keyboardType: TextInputType.phone,
                                          validator: (value) {
                                            // if (value == null ||
                                            //     value.isEmpty) {
                                            //   return '● Please enter some text';
                                            // }
                                            return null;
                                          },
                                          controller: _phoneTextEditingController,
                                        )),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: PasswordTextFormWidget(
                                  controller: _phonePasswordTextEditingController,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: DropdownGroupWidget(
                                          onSelect: (name, index) {
                                            setState(() {
                                              _selectedGroupIndex = index;
                                            });
                                          },
                                        )),
                                  ),
                                ],
                              ),
                              ButtonWidget(
                                onTap: _addByEmail,
                                children: [
                                  "Create"
                                      .text
                                      .xl
                                      .color((isDark(context))
                                          ? GlobalTheme.kPrimaryColor
                                          : GlobalTheme.kAccentColor)
                                      .make(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 1 / _pageController.viewportFraction,
                      child: Form(
                        key: _formEmailKey,
                        child: Padding(
                          padding: const EdgeInsets.only(),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20),
                                  child: TextFormWidget(
                                    controller: _usernameTextEditingController,
                                    onChanged: (_) {},
                                    hint: "Username",
                                    keyboardType: TextInputType.text,
                                    validator: (text) {
                                      return null;
                                    },
                                  )),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: PasswordTextFormWidget(
                                  controller:
                                      _usernamePasswordTextEditingController,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: DropdownGroupWidget(
                                          onSelect: (name, index) {
                                            setState(() {
                                              _selectedGroupIndex = index;
                                            });
                                          },
                                        )),
                                  ),
                                ],
                              ),
                              ButtonWidget(
                                onTap: _addByEmail,
                                children: [
                                  "Create"
                                      .text
                                      .xl
                                      .color((isDark(context))
                                          ? GlobalTheme.kPrimaryColor
                                          : GlobalTheme.kAccentColor)
                                      .make(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
