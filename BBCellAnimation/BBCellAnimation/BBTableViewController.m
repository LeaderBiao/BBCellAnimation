//
//  BBTableViewController.m
//  BBCellAnimation
//
//  Created by Biao on 16/4/14.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import "BBTableViewController.h"

@interface BBTableViewController ()

@property(nonatomic,strong)NSMutableSet *showIndexes;


@end

@implementation BBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _showIndexes = [NSMutableSet set];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BBCell" forIndexPath:indexPath];
    
    return cell;
}


/**
 *  @author Biao
 *
 *  Display customization
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  @author Biao
     *
     *  动画一 从下往上出现
     */
    if(![self.showIndexes containsObject:indexPath])
    {
        [self.showIndexes addObject:indexPath];
        /**
         *  @author Biao
         *
         *  旋转角度
         */
        CGFloat rotationAngleDegrees = -30;
        
        /**
         *  @author Biao
         *
         *  旋转弧度
         */
        CGFloat rotaionAngleRadians = rotationAngleDegrees * (M_PI / 180);
        
        /**
         *  @author Biao
         *
         *  偏移量
         */
        CGPoint offsetPositioning = CGPointMake(-80, -80);
        
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, rotaionAngleRadians, 0.0, 0.0, 1.0);
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, 0.0);
        cell.layer.transform = transform;
        cell.alpha = 0.8;
        
        [UIView animateWithDuration:1 delay:0.0 usingSpringWithDamping:0.6f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            cell.layer.transform = CATransform3DIdentity;
            cell.layer.opacity = 1;
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
    
    /**
     *  @author Biao
     *
     *  动画二 左边出现
     */
//    if(![self.showIndexes containsObject:indexPath])
//    {
//        [self.showIndexes addObject:indexPath];
//        /**
//         *  @author Biao
//         *
//         *  旋转
//         */
//        CATransform3D rotation;
//        rotation = CATransform3DMakeRotation((90.0*M_PI)/180, 0.0, 0.7, 0.4);
//        /**
//         *  @author Biao
//         *
//         *  m34表示透视效果，默认值是0（1/D），表示的是无穷远( D无穷大)。当D越小，也就是m34越接近1，透视效果越明显
//         */
//        rotation.m34 = 1.0 / -600;
//        
//        //Define the initial state (Before the animation)
//        cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//        cell.layer.shadowOffset = CGSizeMake(10, 10);
//        cell.alpha = 0;
//        cell.layer.transform = rotation;
//        cell.layer.anchorPoint = CGPointMake(0, 0.5);
//        
//        //Define the final state (After the animation) and commit the animation
//        [UIView beginAnimations:@"rotation" context:NULL];
//        //Define Animation Duration设置动画时长
//        [UIView setAnimationDuration:0.3];
//        cell.layer.transform = CATransform3DIdentity;
//        cell.alpha = 1;
//        cell.layer.shadowOffset = CGSizeMake(0, 0);
//        [UIView commitAnimations];
//    }
    
    
    /**
     *  @author Biao
     *
     *  动画三 右边出现
     */
//    if(![self.showIndexes containsObject:indexPath])
//    {
//        [self.showIndexes addObject:indexPath];
//        cell.layer.transform = CATransform3DTranslate(cell.layer.transform, 300, 0, 0);
//        cell.alpha = 0.5;
//        
//        [UIView animateWithDuration:0.3 delay:0.0f usingSpringWithDamping:0.8f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            cell.layer.transform = CATransform3DIdentity;
//            cell.alpha = 1;
//        } completion:nil];
//    }
    
}


@end
