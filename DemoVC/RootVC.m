//
//  RootVC.m
//  XHWebImageHeightLayoutExample
//
//  Created by zhuxiaohui on 2016/11/15.
//  Copyright © 2016年 ruiec.cn. All rights reserved.
//

#import "RootVC.h"
#import "DemoVC1.h"
#import "DemoVC2.h"
#import "DemoVC3.h"

@interface RootVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSArray *vcArray;
@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"XHWebImageAutoSizeExample";
    self.myTableView.tableFooterView = [[UIView alloc] init];
    
    // Do any additional setup after loading the view from its nib.
}
-(NSArray *)dataArray{
    if(_dataArray==nil)
    {
         _dataArray = @[@"UITableView - DemoVC1",@"UITableView - DemoVC2",@"UICollectionView - DemoVC3"
                          ];
    }
    return _dataArray;
}
-(NSArray *)vcArray
{
    if(_vcArray==nil)
    {
        _vcArray = @[@"DemoVC1",@"DemoVC2",@"DemoVC3"];
    }
    return _vcArray;
}
#pragma mark-tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.dataArray[indexPath.row];
    Class class = NSClassFromString(self.vcArray[indexPath.row]);
    UIViewController *VC = [[class alloc]init];
    VC.navigationItem.title = title;
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
