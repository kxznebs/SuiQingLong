//
//  ViewController.m
//  SuiQingLong
//
//  Created by xiaohuyangche on 15/12/30.
//
//

#import "ViewController.h"
#import "PersonViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStylePlain target:self action:@selector(abc)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    label.text =@"测试一下的label";
    
    
}


- (void)abc
{
    PersonViewController *p = [[PersonViewController alloc] init];
    [self.navigationController pushViewController:p animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
