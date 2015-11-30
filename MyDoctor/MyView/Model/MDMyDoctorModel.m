//
//  MDMyDoctorModel.m
//  MyDoctor
//
//  Created by 巫筠 on 15/11/30.
//  Copyright © 2015年 com.mingxing. All rights reserved.
//

#import "MDMyDoctorModel.h"

@implementation MDMyDoctorModel

+(instancetype)ModelWithDrName:(NSString *)name andheadView:(NSString *)icon andHospitolName:(NSString *)hospitol andmajor:(NSString *)major
{
    MDMyDoctorModel * model = [[self alloc] init];
    model.name = name;
    model.headView = icon;
    model.hospitol = hospitol;
    model.major = major;
    return model;
}

@end
