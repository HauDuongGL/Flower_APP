import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/config/resources/color.dart';
import 'package:flutter_base_bloc/core/config/resources/dimens.dart';
import 'package:flutter_base_bloc/core/config/resources/styles.dart';
import 'package:flutter_base_bloc/gen/assets.gen.dart';
import 'package:flutter_base_bloc/utils/style_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItemFlower extends StatelessWidget {
  const ListItemFlower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 5,
          child: Container(
            width: Dimens.d139,
            height: Dimens.d139, 
            decoration: BoxDecoration(
              color: color61D2C4,
            ),
            child: Center(
              child: Container(
                width: Dimens.d125,
                height: Dimens.d125,
                decoration: BoxDecoration(
                                        image: DecorationImage(
                image: Assets.images.bgFavorite.provider(),fit: BoxFit.fitHeight),
                                      ),
              ),
            ),
          
          ),
        ),
        Flexible(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.only(left: Dimens.d20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Red Cactus',style: AppTextStyle.boldText.copyWith(
                  fontSize: 17.sp,
                ),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('KINGDOM',style: AppTextStyle.mediumText.copyWith(
                        color:colorGraySpain,
                      ),),
                    ), 
                    spaceW5,                
                    Expanded(
                      child: Text('FAMILY',style: AppTextStyle.mediumText.copyWith(
                        color:colorGraySpain,
                      ),),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('Plantae',style: AppTextStyle.lightText),
                    ), 
                    spaceW5,                
                    Expanded(
                      child: Text('Cactaceae',style: AppTextStyle.lightText),
                    ),
                  ],
                ),
                Text('DESCRIPTION',style: AppTextStyle.mediumText.copyWith(
                        color:colorGraySpain,
                      ),),
                      Text('Cactus spines are produced from specialized structures ssssss',maxLines: 2 ,overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        )
      ],                        
    );
  }
}
