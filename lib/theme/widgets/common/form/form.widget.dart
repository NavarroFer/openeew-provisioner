import 'package:flutter/material.dart';
import 'package:openeew_provisioner/theme/carbon.dart';
import 'package:stylex/stylex.dart';

export './form.style.dart';

class CForm extends StatefulWidget {
  CForm({
    Key key,
    this.title,
    this.description,
    this.label,
    this.labelSize = 12,
    this.titleSize = 20,
    this.descriptionSize = 14,
    this.type = CFormType.modal,
    this.content,
    this.actions,
    this.note,
  }) : super(key: key);

  final CFormType type;
  final String label;
  final String title;
  final String description;
  final double labelSize;
  final double titleSize;
  final double descriptionSize;

  final Widget content;
  final Widget actions;
  final Widget note;

  CFormState createState() => CFormState();

  static CFormState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InteritedCForm>().state;
  }
}

class CFormState extends State<CForm> {
  final Map<String, CValidationResult> validations = {};

  bool validate() {
    return validations.values.every((validation) =>
      validation != null && validation.type == CValidationResultType.success
    );
  }

  CValidationResult validatePresence(String value, String message) {
    return value.isEmpty
      ? CValidationResult(type: CValidationResultType.error, message: message)
      : CValidationResult(type: CValidationResultType.success, message: '');
  }

  @override
  Widget build(BuildContext context) {
    final carbon = context.style;

    final formType = enumToString(widget.type);
    final style = 'form-$formType';

    return _InteritedCForm(
      state: this,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: carbon.get('$style-background-color'),
            padding: carbon.get('$style-padding'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.label != null) ...[
                  CText(
                    data: widget.label,
                    style: TextStyle(
                      fontSize: widget.labelSize,
                      color: carbon.get('$style-label-color'),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                if (widget.title != null) ...[
                  if (widget.label == null) const SizedBox(height: 8),
                  CText(
                    data: widget.title,
                    style: TextStyle(
                      fontSize: widget.titleSize,
                      color: carbon.get('$style-title-color'),
                    ),
                  ),
                  if (widget.description != null)
                    const SizedBox(height: 11)
                  else
                    const SizedBox(height: 16),
                ],
                if (widget.description != null) ...[
                  CText(
                    data: widget.description,
                    style: TextStyle(
                      fontSize: widget.descriptionSize,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                if (widget.content != null) widget.content,
                if (widget.actions != null) widget.actions,
                if (widget.note != null) ...[
                  const SizedBox(height: 20),
                  widget.note,
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InteritedCForm extends InheritedWidget {
  const _InteritedCForm({Key key, this.state, Widget child})
      : super(key: key, child: child);

  final CFormState state;

  @override
  bool updateShouldNotify(oldWidget) => true;
}
