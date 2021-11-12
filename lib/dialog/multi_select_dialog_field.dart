import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import '../util/multi_select_list_type.dart';
import '../util/multi_select_item.dart';
import '../chip_display/multi_select_chip_display.dart';
import 'mult_select_dialog.dart';

/// A customizable InkWell widget that opens the MultiSelectDialog
// ignore: must_be_immutable
class MultiSelectDialogField<V> extends FormField<List<V>> {
  /// An enum that determines which type of list to render.
  final MultiSelectListType? listType;

  /// Style the Container that makes up the field.
  final InputDecoration decoration;

  /// Set text that is displayed on the button.
  // final Text? buttonText;

  /// Specify the button icon.
  // final Icon? buttonIcon;
  final ValueChanged<String>? onChanged;

  /// The text at the top of the dialog.
  final Widget? title;

  /// List of items to select from.
  final List<MultiSelectItem<V>> items;

  /// Fires when the an item is selected / unselected.
  final void Function(List<V>)? onSelectionChanged;

  /// Overrides the default MultiSelectChipDisplay attached to this field.
  /// If you want to remove it, use MultiSelectChipDisplay.none().
  final MultiSelectChipDisplay<V>? chipDisplay;

  /// The list of selected values before interaction.
  final List<V>? initialValue;

  /// Fires when confirm is tapped.
  final void Function(List<V>) onConfirm;

  /// Toggles search functionality.
  final bool? searchable;

  /// Text on the confirm button.
  final Text? confirmText;

  /// Text on the cancel button.
  final Text? cancelText;

  /// Set the color of the space outside the BottomSheet.
  final Color? barrierColor;

  /// Sets the color of the checkbox or chip when it's selected.
  final Color? selectedColor;

  /// Give the dialog a fixed height
  final double? height;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  /// A function that sets the color of selected items based on their value.
  /// It will either set the chip color, or the checkbox color depending on the list type.
  final Color Function(V)? colorator;

  /// Set the background color of the dialog.
  final Color? backgroundColor;

  /// Color of the chip body or checkbox border while not selected.
  final Color? unselectedColor;

  /// Replaces the deafult search icon when searchable is true.
  final Icon? searchIcon;

  /// Replaces the default close search icon when searchable is true.
  final Icon? closeSearchIcon;

  /// Style the text on the chips or list tiles.
  final TextStyle? itemsTextStyle;

  /// Style the text on the selected chips or list tiles.
  final TextStyle? selectedItemsTextStyle;

  /// Style the text that is typed into the search field.
  final TextStyle? searchTextStyle;

  /// Style the search hint.
  final TextStyle? searchHintStyle;

  /// Set the color of the check in the checkbox
  final Color? checkColor;

  final TextEditingController controller;

  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<List<V>>? validator;
  final FormFieldSetter<List<V>>? onSaved;
  final GlobalKey<FormFieldState>? formKey;
  FormFieldState<List<V>>? state;
  Key? key;
  FormFieldValidator<String>? validatorFunction;

  MultiSelectDialogField({
    required this.items,
    required this.onConfirm,
    required this.decoration,
    required this.controller,
    this.onChanged,
    this.title,
    this.validatorFunction,
    // this.buttonText,
    // this.buttonIcon,
    this.listType,
    this.onSelectionChanged,
    this.chipDisplay,
    this.searchable,
    this.confirmText,
    this.cancelText,
    this.barrierColor,
    this.selectedColor,
    this.searchHint,
    this.height,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.checkColor,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.key,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.formKey,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            autovalidateMode: autovalidateMode,
            initialValue: initialValue ?? [],
            builder: (FormFieldState<List<V>> state) {
              _MultiSelectDialogFieldView field = _MultiSelectDialogFieldView<V>(
                  title: title,
                  items: items,
                  // buttonText: buttonText,
                  // buttonIcon: buttonIcon,
                  chipDisplay: chipDisplay,
                  decoration: decoration,
                  listType: listType,
                  onConfirm: onConfirm,
                  onSelectionChanged: onSelectionChanged,
                  formKey: formKey,
                  initialValue: initialValue,
                  searchable: searchable,
                  confirmText: confirmText,
                  cancelText: cancelText,
                  barrierColor: barrierColor,
                  selectedColor: selectedColor,
                  searchHint: searchHint,
                  height: height,
                  controller: controller,
                  colorator: colorator,
                  backgroundColor: backgroundColor,
                  unselectedColor: unselectedColor,
                  searchIcon: searchIcon,
                  closeSearchIcon: closeSearchIcon,
                  itemsTextStyle: itemsTextStyle,
                  searchTextStyle: searchTextStyle,
                  searchHintStyle: searchHintStyle,
                  selectedItemsTextStyle: selectedItemsTextStyle,
                  checkColor: checkColor,
                  validatorFunction: validatorFunction,
                  onChanged: onChanged);
              return _MultiSelectDialogFieldView<V?>._withState(
                field as _MultiSelectDialogFieldView<V?>,
                state,
              );
            });
}

// ignore: must_be_immutable
class _MultiSelectDialogFieldView<V> extends StatefulWidget {
  final MultiSelectListType? listType;
  final InputDecoration decoration;
  final FormFieldValidator<String>? validatorFunction;
  final Text? buttonText;
  final Icon? buttonIcon;
  final Widget? title;
  final List<MultiSelectItem<V>> items;
  final void Function(List<V>)? onSelectionChanged;
  final MultiSelectChipDisplay<V>? chipDisplay;
  final List<V>? initialValue;
  final void Function(List<V>)? onConfirm;
  final bool? searchable;
  final Text? confirmText;
  final Text? cancelText;
  final Color? barrierColor;
  final Color? selectedColor;
  final double? height;
  final String? searchHint;
  final Color Function(V)? colorator;
  final Color? backgroundColor;
  final Color? unselectedColor;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final TextStyle? itemsTextStyle;
  final TextStyle? selectedItemsTextStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final Color? checkColor;
  FormFieldState<List<V>>? state;
  TextEditingController controller;
  ValueChanged<String>? onChanged;
  final GlobalKey<FormFieldState>? formKey;

  _MultiSelectDialogFieldView({
    required this.items,
    required this.decoration,
    required this.controller,
    this.validatorFunction,
    this.title,
    this.formKey,
    this.onChanged,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.onSelectionChanged,
    this.onConfirm,
    this.chipDisplay,
    this.initialValue,
    this.searchable,
    this.confirmText,
    this.cancelText,
    this.barrierColor,
    this.selectedColor,
    this.searchHint,
    this.height,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.checkColor,
  });

  /// This constructor allows a FormFieldState to be passed in. Called by MultiSelectDialogField.
  _MultiSelectDialogFieldView._withState(
    _MultiSelectDialogFieldView<V> field,
    FormFieldState<List<V>> state,
  )   : items = field.items,
        title = field.title,
        buttonText = field.buttonText,
        buttonIcon = field.buttonIcon,
        formKey = field.formKey,
        listType = field.listType,
        decoration = field.decoration,
        onSelectionChanged = field.onSelectionChanged,
        onConfirm = field.onConfirm,
        chipDisplay = field.chipDisplay,
        initialValue = field.initialValue,
        searchable = field.searchable,
        confirmText = field.confirmText,
        cancelText = field.cancelText,
        barrierColor = field.barrierColor,
        selectedColor = field.selectedColor,
        height = field.height,
        searchHint = field.searchHint,
        colorator = field.colorator,
        backgroundColor = field.backgroundColor,
        unselectedColor = field.unselectedColor,
        searchIcon = field.searchIcon,
        closeSearchIcon = field.closeSearchIcon,
        itemsTextStyle = field.itemsTextStyle,
        searchHintStyle = field.searchHintStyle,
        searchTextStyle = field.searchTextStyle,
        selectedItemsTextStyle = field.selectedItemsTextStyle,
        checkColor = field.checkColor,
        controller = field.controller,
        validatorFunction = field.validatorFunction,
        onChanged = field.onChanged,
        state = state;

  @override
  __MultiSelectDialogFieldViewState createState() => __MultiSelectDialogFieldViewState<V>();
}

class __MultiSelectDialogFieldViewState<V> extends State<_MultiSelectDialogFieldView<V>> {
  List<V> _selectedItems = [];

  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedItems.addAll(widget.initialValue!);
    }
  }

  Widget _buildInheritedChipDisplay() {
    List<MultiSelectItem<V>?> chipDisplayItems = [];
    chipDisplayItems =
        _selectedItems.map((e) => widget.items.firstWhereOrNull((element) => e == element.value)).toList();
    chipDisplayItems.removeWhere((element) => element == null);
    if (widget.chipDisplay != null) {
      // if user has specified a chipDisplay, use its params
      if (widget.chipDisplay!.disabled!) {
        return Container(
          width: 10,
        );
      } else {
        return MultiSelectChipDisplay<V>(
          items: chipDisplayItems,
          colorator: widget.chipDisplay!.colorator ?? widget.colorator,
          onTap: (item) {
            List<V>? newValues;
            if (widget.chipDisplay!.onTap != null) {
              dynamic result = widget.chipDisplay!.onTap!(item);
              if (result is List<V>) newValues = result;
            }
            if (newValues != null) {
              _selectedItems = newValues;
              if (widget.state != null) {
                widget.state!.didChange(_selectedItems);
              }
            }
          },
          decoration: widget.chipDisplay!.decoration,
          chipColor: widget.chipDisplay!.chipColor ??
              ((widget.selectedColor != null && widget.selectedColor != Colors.transparent)
                  ? widget.selectedColor!.withOpacity(0.35)
                  : null),
          alignment: widget.chipDisplay!.alignment,
          textStyle: widget.chipDisplay!.textStyle,
          icon: widget.chipDisplay!.icon,
          shape: widget.chipDisplay!.shape,
          scroll: widget.chipDisplay!.scroll,
          scrollBar: widget.chipDisplay!.scrollBar,
          height: widget.chipDisplay!.height,
          chipWidth: widget.chipDisplay!.chipWidth,
        );
      }
    } else {
      // user didn't specify a chipDisplay, build the default
      return MultiSelectChipDisplay<V>(
        items: chipDisplayItems,
        colorator: widget.colorator,
        chipColor: (widget.selectedColor != null && widget.selectedColor != Colors.transparent)
            ? widget.selectedColor!.withOpacity(0.35)
            : null,
      );
    }
  }

  /// Calls showDialog() and renders a MultiSelectDialog.
  _showDialog(BuildContext ctx) async {
    await showDialog(
      barrierColor: widget.barrierColor,
      context: context,
      builder: (ctx) {
        return MultiSelectDialog<V>(
          checkColor: widget.checkColor,
          selectedItemsTextStyle: widget.selectedItemsTextStyle,
          searchHintStyle: widget.searchHintStyle,
          searchTextStyle: widget.searchTextStyle,
          itemsTextStyle: widget.itemsTextStyle,
          searchIcon: widget.searchIcon,
          closeSearchIcon: widget.closeSearchIcon,
          unselectedColor: widget.unselectedColor,
          backgroundColor: widget.backgroundColor,
          colorator: widget.colorator,
          searchHint: widget.searchHint,
          selectedColor: widget.selectedColor,
          onSelectionChanged: widget.onSelectionChanged,
          height: widget.height,
          listType: widget.listType,
          items: widget.items,
          title: widget.title != null ? widget.title : Text("Select"),
          initialValue: _selectedItems,
          searchable: widget.searchable ?? false,
          confirmText: widget.confirmText,
          cancelText: widget.cancelText,
          onConfirm: (selected) {
            if (widget.state != null) {
              widget.state!.didChange(selected);
            }
            _selectedItems = selected;
            if (widget.onConfirm != null) widget.onConfirm!(selected);
            widget.controller.text = _selectedItems.toList().toString();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          enableInteractiveSelection: false,
          readOnly: true,
          autofocus: false,
          controller: widget.controller,
          validator: widget.validatorFunction,
          onChanged: widget.onChanged,
          key: widget.key,
          decoration: InputDecoration(
            suffixIcon: widget.controller.text.isNotEmpty
                ? _buildInheritedChipDisplay()
                : Container(
                    width: 10,
                  ),
            disabledBorder: widget.decoration.disabledBorder ?? OutlineInputBorder(),
            errorBorder: widget.decoration.errorBorder == null ? OutlineInputBorder() : widget.decoration.errorBorder,
            focusedErrorBorder: widget.decoration.focusedErrorBorder == null
                ? OutlineInputBorder()
                : widget.decoration.focusedErrorBorder,
            enabledBorder:
                widget.decoration.enabledBorder == null ? OutlineInputBorder() : widget.decoration.enabledBorder,
            focusedBorder:
                widget.decoration.focusedBorder == null ? OutlineInputBorder() : widget.decoration.focusedBorder,
            border: widget.decoration.border == null ? OutlineInputBorder() : widget.decoration.border,
            hintText: widget.decoration.hintText == null ? "" : widget.decoration.hintText,
            labelText: widget.decoration.labelText == null ? "" : widget.decoration.labelText,
            hintStyle: widget.decoration.hintStyle == null ? TextStyle() : widget.decoration.hintStyle,
            labelStyle: widget.decoration.labelStyle == null ? TextStyle() : widget.decoration.labelStyle,
          ),
          onTap: () {
            _showDialog(context);
          },
        ),
      ],
    );
  }
}
