//
//  ViewController.m
//  图片浏览器
//
//  Created by GuoYunfei on 5/15/16.
//  Copyright © 2016 GuoYunfei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**
 * 索引标签
 */
@property (weak, nonatomic) IBOutlet UILabel *indexLable;
/**
 *图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/*
 *描述
*/
@property (weak, nonatomic) IBOutlet UILabel *describe;
/*
 *下一个按钮
*/
- (IBAction)next:(id)sender;
/*
 * index
 */
- (IBAction)previous:(id)sender;
@property(nonatomic, assign)int index;
@property(nonatomic, strong) NSArray *myary;
@property (weak, nonatomic) IBOutlet UIButton *prebtn;
@property (weak, nonatomic) IBOutlet UIButton *nextbtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray *)myary
{
   if(_myary == nil)
   {
       NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType: @"plist"];
       _myary = [NSArray arrayWithContentsOfFile: path];
   }
   
    return _myary;
}
-(void)changeData
{
    self.indexLable.text = [NSString stringWithFormat:@"%d/% d",self.index+1, self.myary.count];
    NSDictionary *dic = self.myary[_index];
    self.imageView.image = [UIImage imageNamed:dic[@"icon"]];
    self.describe.text = dic[@"desc"];
    if(self.index == self.myary.count-1)
    {
        self.nextbtn.enabled = NO;
        self.prebtn.enabled = YES;
    }
    else if(self.index == 0)
    {
        self.prebtn.enabled = NO;
        self.nextbtn.enabled = YES;
    }
    
    else
    {
        self.prebtn.enabled = YES;
        self.nextbtn.enabled = YES;
    }
}
- (IBAction)next:(id)sender
{
    self.index++;
    [self changeData];
}
- (IBAction)previous:(id)sender
{
    self.index--;
    [self changeData];
    
}
@end
