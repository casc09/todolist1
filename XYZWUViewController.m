//
//  XYZWUViewController.m
//  wu
//
//  Created by wuzheng on 15-3-6.
//  Copyright (c) 2015年 wuzheng. All rights reserved.
//

#import "XYZWUViewController.h"

@interface XYZWUViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBotton;

@end

@implementation XYZWUViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender !=self.doneBotton)return;
    if (self.textField.text.length> 0){
        self.toDoItem=[[XYZwu alloc]init];
        self.toDoItem.itemName=self.textField.text;
        self.toDoItem.completed=NO;
    }
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
