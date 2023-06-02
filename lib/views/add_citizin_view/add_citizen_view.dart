/*
import 'package:flutter/material.dart';

class AddCitizenView extends StatefulWidget {
  const AddCitizenView({Key? key}) : super(key: key);

  @override
  State<AddCitizenView> createState() => _AddCitizenViewState();
}

class _AddCitizenViewState extends State<AddCitizenView> {

  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 3),
              MyText(
                bold: true,
                color: AppColors.kPrimaryColor,
                fontSize: 30,
                text: LocaleKeys.welcome_to_keddily_txt.tr(),
              ),
              MyText(
                bold: false,
                fontSize: 15,
                color: AppCubit.get(context).isDark? Colors.white:Colors.black,
                text: LocaleKeys.sub_title_in_reg_txt.tr(),
              ),
              Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldComp(
                        hint: LocaleKeys.reg_name_txt.tr(),
                        icon: Icons.person,
                        textController: nameController,
                        textInputType: TextInputType.text,
                        isPassword: false,
                        validateFunction: (value){
                          if(value.contains(" ")){
                            context.locale.languageCode == "en"?
                            "Username cannot contain spaces":
                            "اسم المستخدم لا يمكن ان يحتوي على مسافات";
                          }
                        },
                        onChangeFunction: (value){
                          _formKey.currentState!.validate();
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldComp(
                        hint: "email@example.com",
                        icon: Icons.email_outlined,
                        textController: emailController,
                        textInputType: TextInputType.emailAddress,
                        isPassword: false,
                        validateFunction: (value){
                          String  pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = RegExp(pattern);
                          if(!regExp.hasMatch(value)){
                            return context.locale.languageCode == "en"?
                            "Invalid Email":"بريد الكتروني غير صالح";
                          }
                        },
                        onChangeFunction: (value){
                          _formKey.currentState!.validate();
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldComp(
                        hint: LocaleKeys.phone_num_reg_txt.tr(),
                        icon: Icons.phone,
                        textController: phoneController,
                        isPassword: false,
                        textInputType:
                        const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: false,
                        ),
                        validateFunction: (value){
                          if(value.length < 11){
                            return context.locale.languageCode.toLowerCase() == "en"?
                            "Wrong phone number":"رقم هاتف غير صحيح";
                          }
                        },
                        onChangeFunction: (value){
                          _formKey.currentState!.validate();
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldComp(
                        hint: LocaleKeys.pass_reg_txt.tr(),
                        icon: Icons.lock,
                        textController: passwordController,
                        textInputType: TextInputType.text,
                        isPassword: passwordObs,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: IconButton(
                            onPressed: (){
                              setState(() {
                                passwordObs = !passwordObs;
                              });
                            },
                            icon: Icon(
                              passwordObs? FontAwesomeIcons.eyeSlash:FontAwesomeIcons.eye,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        validateFunction: (value){
                          String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          RegExp regExp = RegExp(pattern);
                          if(!regExp.hasMatch(value)){
                            return context.locale.languageCode == "en"?
                            "Weak password":"كلمة سر ضعيفة";
                          }
                        },
                        onChangeFunction: (value){
                          _formKey.currentState!.validate();
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormFieldComp(
                        hint: LocaleKeys.conf_pass_txt.tr(),
                        icon: Icons.lock,
                        textController: confirmPasswordController,
                        prevValue: passwordController.text,
                        textInputType: TextInputType.text,
                        isPassword: confPasswordObs,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: IconButton(
                            onPressed: (){
                              setState(() {
                                confPasswordObs = !confPasswordObs;
                              });
                            },
                            icon: Icon(
                              confPasswordObs? FontAwesomeIcons.eyeSlash:FontAwesomeIcons.eye,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        validateFunction: (value){
                          if(value.isEmpty || value != passwordController.text){
                            return context.locale.languageCode == "en"?
                            "Confirmation not equal the password":
                            "تأكيد كلمة السر لا يساوي كلمة السر التي وضعتها";
                          }
                        },
                        onChangeFunction: (value){
                          _formKey.currentState!.validate();
                        },
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      (state is RegisterLoadingState)?const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      ):SizedBox(
                        width: SizeConfig.screenWidth! * 0.9,
                        height: SizeConfig.defaultSize! * 5,
                        child: AppButton(
                          text: LocaleKeys.join_now_txt.tr(),
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phoneNumber: phoneController.text,
                                acceptedLang: AppCubit.get(context).selectedLanguage.toString(),
                              );
                            }
                            print(state);

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
