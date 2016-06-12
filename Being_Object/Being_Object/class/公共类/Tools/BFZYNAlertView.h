//
//  BFZYNAlertView.h
//  BFMX-Comment-App
//
//  Created by yaning Zhu on 16/5/21.
//  Copyright © 2016年 BFMXYJ. All rights reserved.
//
@protocol BFZYNAlertViewDeleget <NSObject>

- (void)liftAction;
- (void)rightAction;

@end
#import <UIKit/UIKit.h>

@interface BFZYNAlertView : UIView
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIButton *liftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIView *view;
@property (nonatomic,strong)NSString * lift;
@property (nonatomic,strong)NSString * right;
@property (nonatomic,strong)NSString * test;
@property (nonatomic,assign)id<BFZYNAlertViewDeleget>delegate;
- (IBAction)liftAction:(id)sender;
- (IBAction)rightAction:(id)sender;
- (void)show;
-(void)dismiss;
@end
