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
