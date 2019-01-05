library material_easy;

import 'package:flutter/material.dart';

class ExpandableListView{

  Map<dynamic,Widget> _groupItem = Map<dynamic,Widget>();
  Map<dynamic,Map<dynamic,Widget>> _childItem = Map<dynamic,Map<dynamic,Widget>>();

  var clickGroup;
  var clickChild;

  ExpandableListView();

  AddData(Map<String,dynamic> data){
    this._groupItem = data['groupItem'];
    this._childItem = data['childItem'];    
    this.clickGroup = data['groupClick'];    
    this.clickChild = data['childClick'];    
  }

  Map<String,dynamic> GetData(){
    Map<String,dynamic> data;
    data['groupItem'] = this._groupItem;
    data['childItem'] = this._childItem;
    data['groupClick'] = this.clickGroup;
    data['childClick'] = this.clickChild;
    return data;
  }

  AddGroupItem({
    int idGroup,
    Widget widget
    }){
    _groupItem[idGroup] = widget;
    _childItem[idGroup] = Map<int,Widget>();
  }

  AddChildItem({
    int idGroup,
    int idChild,
    Widget widget
    }){
    _childItem[idGroup][idChild] = widget;
  }

  SetOnClickListenerGroup(func){
    clickGroup = func;
  }   
  
  SetOnClickListenerChild(func){
     clickChild = func;
  }

  Widget View(){
    List<Widget> listGroup = List<Widget>();
    
    _groupItem.forEach((idGroup,widgetGroup){
      List<Widget> listChild = List<Widget>();
      _childItem[idGroup].forEach((idChild,widgetChild){
        listChild.add(
          GestureDetector(
            onTap: (){
              clickChild(idGroup,idChild);
            },
            child: widgetChild,
          )
        );
      });
      listGroup.add(
        Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                clickGroup(idGroup);
              },
              child: widgetGroup,
            ),
            Column(
              children: listChild,
            )
          ],
        )
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: listGroup
    );
  }

}