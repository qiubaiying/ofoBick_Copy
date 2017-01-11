//
//  MainViewController.m
//  ofoBick
//
//  Created by Jack on 17/1/10.
//  Copyright © 2017年 SUP M. All rights reserved.
//  http://stackoverflow.com/questions/39762732/ios-10-heading-arrow-for-mkuserlocation-dot/40808645#40808645

#import "MainViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MainViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) UIImageView *headingImageView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self locationManagerSet];
    [self mapViewSet];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction

- (IBAction)locationBtnTap:(id)sender {
    
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
    
    //[self.mapView setRegion:MKCoordinateRegionMake(self.mapView.userLocation.location.coordinate, MKCoordinateSpanMake(0.003, 0.003))];
    
}

- (IBAction)reportBtnTap:(id)sender {
    
}

#pragma mark - mapView

- (void)mapViewSet {

    self.mapView.mapType = MKMapTypeStandard;
    
    // 
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    // 显示用户的当前位置
    self.mapView.showsUserLocation = YES;
    
    self.mapView.showsPointsOfInterest = YES;
    
    self.mapView.showsCompass  = YES;
    
    self.mapView.delegate = self;
    
    
}



- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    NSLog(@"地图定位位置%@", userLocation.location);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self.mapView setRegion:MKCoordinateRegionMake(self.mapView.userLocation.location.coordinate, MKCoordinateSpanMake(0.003, 0.003))];
    });
    
    //
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views {
    
    
    if (!self.headingImageView) {
        
        MKAnnotationView *annotationView = views.lastObject;
        
        // 向地图位置点添加蓝色箭头图标
        if ([annotationView.annotation isKindOfClass:[MKUserLocation class]]) {
            
            UIImageView *headingImageView = nil;
            
            UIImage *image = [UIImage imageNamed:@"userPosition"];
            
            headingImageView = [[UIImageView alloc] initWithImage:image];
            
            CGFloat imageW =  image.size.width * 1.4;
            CGFloat imageH =  image.size.height * 1.4;
            
            headingImageView.frame = CGRectMake((annotationView.width - imageW)/2, (annotationView.height - imageH)/2, imageW, imageH);
            
            //[annotationView addSubview:headingImageView];
            [annotationView insertSubview:headingImageView atIndex:0];
            
            self.headingImageView = headingImageView;
            
            //
        }
    }

}



- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    
    // 模拟上传坐标获取周围车数量
    _mapView.userLocation.title = @"正在计算周围车数量...";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _mapView.userLocation.title = @"您周围车辆数量约为9辆";
    });
    
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    
    
    
}



#pragma mark - Location

- (void)locationManagerSet {
    
    self.locationManager = [CLLocationManager new];
    
    self.locationManager.delegate = self;
    
    [self.locationManager requestAlwaysAuthorization];
    
    //[self.locationManager startUpdatingLocation];
    
    [self.locationManager startUpdatingHeading];
    

    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    NSLog(@"定位到了 %@", locations);
    [self.locationManager stopUpdatingLocation];
    
}

/** 设备方向改变 */
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    
    if (newHeading.headingAccuracy < 0) return;
    
    CGFloat rotation = (newHeading.trueHeading > 0 ? newHeading.trueHeading : newHeading.magneticHeading) / 180 * M_PI;
    
    self.headingImageView.transform = CGAffineTransformMakeRotation(rotation);
    
    NSLog(@"%lf", newHeading.trueHeading);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
