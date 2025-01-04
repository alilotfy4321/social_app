// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:social_app/controller/social_app/social_app_cubit.dart';
import 'package:social_app/shared_in_app/custom_widgets/customButton.dart';
import 'package:social_app/shared_in_app/custom_widgets/vhSpace.dart';

Widget customUserStatus(SocialAppCubit cubit)=>Column(
  children: [
    Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        //color: cubit.isStatus? Colors.green:Colors.white,
                        width: 3,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/200/300'),
                      ),
                    ),
                  ),
                ),

            VSpace(),
            CustomButton(
              child: Center(child: Text('Add status')),
              function: () {
              //  cubit.changeStatus();
              },
              width: 100,
              height: 50,
            )
              ],
)
            ;
  //------------------------------hold status 
  //put this function in cubit

  
  // bool isStatus = false;
  // void changeStatus() {
  //   isStatus = !isStatus;
  //   emit(SocialAppChangeStatusState());
  // }          