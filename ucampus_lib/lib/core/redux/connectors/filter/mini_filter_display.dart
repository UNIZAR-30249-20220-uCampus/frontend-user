import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/redux/actions/filter_actions.dart';
import 'package:ucampus_lib/core/redux/actions/map_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/ui/widgets/filter/mini_filter_display.dart';

class MiniFilterDisplayConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      distinct: true,
      builder: (context, model) => MiniFilterDisplay(
        activeCriteria: model.appliedCriteria,
        onCriteriaRemoved: model.onCriteriaRemoved,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  List<CriteriaKind> appliedCriteria;
  Function(CriteriaKind) onCriteriaRemoved;

  ViewModel.build({
    @required this.appliedCriteria,
    @required this.onCriteriaRemoved,
  }) : super(equals: [appliedCriteria]);

  @override
  BaseModel fromStore() => ViewModel.build(
        appliedCriteria: state.appliedCriteria,
        onCriteriaRemoved: (criteria) {
          dispatch(RemoveAndCopyCriteriaAction(criteriaKindToRemove: criteria));
          dispatch(ApplyFilterAction());
        },
      );
}
