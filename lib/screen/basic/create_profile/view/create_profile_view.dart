import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/utility/page_utility/basic/create_profile_utility.dart';
import '../../../../product/utility/page_utility/basic/welcome_utility.dart';
import '../../../../product/widget/custom_dropdown_button.dart';
import '../controller/create_profile_controller.dart';


class CreateProfileView extends StatefulWidget {
  const CreateProfileView({super.key});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> with WelcomeUtility,CreateProfileUtility {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(context, text: "Devam Et", onPressed: () {
        controller.floatActionOnPressed(context);
      },),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalMedium,
          child: GetBuilder<CreateProfileController>(
            builder: (_) => ListView(
              children: [
                marketPlaceTitle(context),
                createProfileText(context),
                Form(
                  key: controller.getFormKey,
                  child: Column(
                    children: <Widget>[
                      customTextFormField(
                        context,
                        labelText: 'Adınız',
                        controller: controller.nameController,
                        validator: controller.nameValidator,
                        onSaved: controller.updateName,
                      ),
                      customTextFormField(
                        context,
                        labelText: 'Soyadınız',
                        controller: controller.lastnameController,
                        validator: controller.lastNameValidator,
                        onSaved: controller.updateLastname,
                      ),
                      dateSelector(),
                      const CustomDropDownButton<String>(
                        items: ["Erkek", "Kadın", "Diğer"],
                        text: "Cinsiyet",
                      ),
                      customTextFormField(
                        context,
                        labelText: 'Email Adresi ',
                        controller: controller.emailController,
                        validator: controller.emailValidator,
                        onSaved: controller.updateHobbies,
                      ),
                      const CustomDropDownButton(
                        items: [
                          'İlkokul',
                          'Ortaokul',
                          'Lise',
                          'Üniversite',
                          'Yüksek Lisans',
                          'Doktora',
                          'Diğer',
                        ],
                        text: "Eğitim Durumunuz",
                      ),
                      const CustomDropDownButton(
                        items: [
                          'Spor',
                          'Yemek Yemek',
                          'Kitap Okumak',
                          'Müzik Dinlemek',
                          'Seyahat Etmek',
                          'Resim Çizmek',
                          'Dans Etmek',
                          'Bahçe İşleri',
                          'Diğer',
                        ],
                        text: "Hobilerinizi Ekleyiniz",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
