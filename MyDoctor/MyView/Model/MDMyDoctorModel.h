//
//  MDMyDoctorModel.h
//  MyDoctor
//
//  Created by 巫筠 on 15/11/30.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDMyDoctorModel : NSObject

@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * headView;
@property (nonatomic,copy) NSString * hospitol;
@property (nonatomic,copy) NSString * major;

+(instancetype)ModelWithDrName:(NSString *)name andheadView:(NSString *)icon andHospitolName:(NSString *)hospitol andmajor:(NSString *)major;


@end
