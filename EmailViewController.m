//
//  EmailViewController.m
//  wu
//
//  Created by wuzheng on 15-4-11.
//  Copyright (c) 2015年 wuzheng. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>

@interface EmailViewController ()

@property (weak, nonatomic) IBOutlet UINavigationItem *zt;
@property (weak, nonatomic) IBOutlet UILabel *sjr;
@property (weak, nonatomic) IBOutlet UITextField *zw;
@end

@implementation EmailViewController

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


#pragma mark-UI事件
- (IBAction)fasong:(id)sender 
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailController=[[MFMailComposeViewController alloc]init];
        mailController.mailComposeDelegate=self;
        [mailController setToRecipients:[self.sjr.text componentsSeparatedByString:@","]];
        [mailController setSubject:self.zt.title];
        [mailController setMessageBody:self.zw.text isHTML:YES];
        [self presentViewController:mailController animated:YES completion:nil ];// 弹出邮件窗口
        
    }
}

#pragma mark-代理方法
-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch(result){
        case MFMailComposeResultSent:
            NSLog(@" 发送成功");
            break;
        case MFMailComposeResultSaved:
            NSLog(@" 邮件以保存");
            break;
        case MFMailComposeResultCancelled:
            NSLog(@"取消发送");
            break;
        default:
            NSLog(@"发送失败");
            break;
            }
    if (error) {
        NSLog(@"错误，错误信息：％@",error.localizedDescription);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
                  } //关闭邮件窗口
    
        
        
        
        
    


@end
