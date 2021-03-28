import 'package:flutter/material.dart';
import 'package:openeew_provisioner/theme/carbon.dart';
import 'package:stylex/stylex.dart';

final _form = StyleX({
  'form-modal-padding': const EdgeInsets.only(
    top: 16,
    left: 16,
    right: 16,
    bottom: 24,
  ),
  'form-group-padding': const EdgeInsets.only(
    top: 0,
    left: 0,
    right: 0,
    bottom: 24,
  ),
});

final formG100 = StyleX({
  // background-color
  'form-modal-background-color': CColors.gray20,
  'form-group-background-color': CColors.gray20,

  // label-color
  'form-modal-label-color': CColors.gray70,
  'form-group-label-color': CColors.gray70,

  // title-color
  'form-modal-title-color': CColors.gray90,
  'form-group-title-color': CColors.gray90,

  // description-color
  'form-modal-description-color': CColors.gray30,
  'form-group-description-color': CColors.gray10,
})
  ..inject(_form);
