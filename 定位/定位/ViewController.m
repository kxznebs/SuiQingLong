//
//  ViewController.m
//  定位
//
//  Created by 邹鑫 on 15/7/13.
//  Copyright (c) 2015年 寇希增. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locMgr;



@end

@implementation ViewController

- (CLLocationManager *)locMgr
{
    if (!_locMgr) {
         // 1.创建位置管理器（管理用户的位置）
        self.locMgr = [[CLLocationManager alloc] init];
        // 2.设置代理
        self.locMgr.delegate = self;
        
        self.locMgr.desiredAccuracy=kCLLocationAccuracyBest;// 定位精准度，越高越耗电
        self.locMgr.distanceFilter=10;// 每个多少米调用一次
    }
    return _locMgr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        [self.locMgr requestWhenInUseAuthorization];  //调用了这句,就会弹出允许框了.前台定位
//         [self.locMgr  requestAlwaysAuthorization];// 前后台同时定位
    }
    
    if ([CLLocationManager locationServicesEnabled]) {
        // 开始定位用户的位置
        [self.locMgr startUpdatingLocation];
        
        // 传一个位置进来，进来时调用didEnterRegion方法，离开时调用didExitRegion方法
//        self.locMgr startMonitoringForRegion:<#(CLRegion *)#>
        
        
    } else { // 不能用
        NSLog(@"不能用");
        // 1.告诉用户检查网络状况
        // 2.提醒用户打开定位开关
    }
    
    [self countDistance];
    
}


// 计算两个经纬度之间的距离
- (void)countDistance
{
    CLLocation *loc1 = [[CLLocation alloc] initWithLatitude:40 longitude:116];
    CLLocation *loc2 = [[CLLocation alloc] initWithLatitude:41 longitude:116];
    
    CLLocationDistance distance = [loc1 distanceFromLocation:loc2];
    NSLog(@"(%@)和（%@）的距离：%f", loc1, loc2, distance);
    
}




#pragma mark - CLLocationManagerDelegate
// 数组里面存放多个位置信息
// 当定位到用户的位置时，就会调用（经纬度发生变化就会调用）
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    
    // 数组里面存放的是CLLocation对象，一个CLLocation对象就代表一个位置
    // coordinate：经纬度
    // altitude：海拔---等等
    // speed：行走速度
    CLLocation *loc = [locations lastObject];
    
    // 经度：loc.coordinate.longitude
    // 纬度：loc.coordinate.latitude
    
    NSLog(@"经度%f, 纬度%f", loc.coordinate.longitude, loc.coordinate.latitude);
    
    // 停止更新位置（不用定位服务，应当马上停止定位，非常耗电）
//    [manager stopUpdatingLocation];
    
}



//// 进入某个区域
//- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
//{
//    
//}
//
//// 离开某个区域
//- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
//{
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
