part of 'widget_imports.dart';

// ignore: must_be_immutable
class BasicDropdown extends StatelessWidget {
  final List<String> items;
  String? selectedValue;
  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final double? width;
  final double? buttonHeight;
  final double? dropdownWidth;
  final bool required;

  BasicDropdown(
      {super.key,
      required this.items,
      required this.selectedValue,
      required this.hintText,
      required this.labelText,
      required this.onChanged,
      this.width,
      this.buttonHeight = 44,
      this.dropdownWidth,
      this.required = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: <InlineSpan>[
              WidgetSpan(
                child: BodyText(text: labelText),
              ),
              WidgetSpan(
                child: BodyText(
                  text: required ? '*' : '',
                  textColor: AppColors.errorColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: BodyText(
              text: hintText,
              textColor: AppColors.secondaryTextColor,
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: BodyText(
                        text: item,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              selectedValue = value;
              onChanged(selectedValue!);
            },
            iconStyleData: const IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down, size: 20),
              iconSize: 14,
              iconEnabledColor: AppColors.textFieldHintColor,
              iconDisabledColor: Colors.grey,
            ),
            buttonStyleData: ButtonStyleData(
              height: buttonHeight,
              width: width ?? double.infinity,
              padding: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.borderColor),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              elevation: 0,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 12, right: 12),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 700,
              width: dropdownWidth ?? MediaQuery.of(context).size.width * .82,
              padding: null,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              elevation: 8,
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(10),
                thickness: WidgetStateProperty.all(6),
                thumbVisibility: WidgetStateProperty.all(true),
              ),
            ),
          ),
        )
      ],
    );
  }
}
