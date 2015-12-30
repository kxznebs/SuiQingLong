//
//  PersonViewController.m
//  SuiQingLong
//
//  Created by xiaohuyangche on 15/12/30.
//
//

#import "PersonViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.backgroundColor = [UIColor colorWithRed:1.000 green:0.931 blue:0.308 alpha:1.000];
    [self.view addSubview:label];
    label.text =@"测试一下的label";
}




@end
