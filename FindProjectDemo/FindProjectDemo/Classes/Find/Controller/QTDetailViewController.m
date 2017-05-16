//
//  QTDetailViewController.m
//  FindProjectDemo
//
//  Created by I on 2017/5/12.
//  Copyright © 2017年 QT. All rights reserved.
//

#import "QTDetailViewController.h"

#import "QTCommentCell.h"

#import "QTTopCycleView.h"

static NSString * const CellID = @"CellID";

@interface QTDetailViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UIImageView *iconImageView;

@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) UILabel *timeLabel;

@property (strong, nonatomic) UILabel *articleLabel;

@property (strong, nonatomic) UIView *separatorView;

@property (strong, nonatomic) UIView *articleView;

@property (strong, nonatomic) UITableView *commentTableView;

@property (strong, nonatomic) UIView *bottomView;

@property (strong, nonatomic) UITapGestureRecognizer *singleTapGR;

@end

@implementation QTDetailViewController

#pragma mark - lazy

- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
#warning TODO
        _iconImageView.image = [UIImage imageNamed:@"icon"];
    }
    
    return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
#warning TODO
        _nameLabel.text = @"lisa";
    }
    
    return _nameLabel;
}

- (UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textColor = [UIColor colorWithHexValue:0x949494 alpha:1];
#warning TODO
        _timeLabel.text = @"20分钟前";
        
    }
    
    return _timeLabel;
}

- (UILabel *)articleLabel
{
    if (_articleLabel == nil) {
        
        _articleLabel = [[UILabel alloc] init];
        
        _articleLabel.numberOfLines = 0;
        
        NSString *textStr = @"夏天快到了,是不是又在纠结有那个防晒了? 今天要公布的就是各款人气防晒的排名啦夏天快到了,是不是又在纠结有那个防晒了? 今天要公布的就是各款人气防晒的排名啦夏天快到了,是不是又在纠结有那个防晒了? 今天要公布的就是各款人气防晒的排名啦夏天快到了,是不是又在纠结有那个防晒了? 今天要公布的就是各款人气防晒的排名啦夏天快到了,是不是又在纠结有那个防晒了? 今天要公布的就是各款人气防晒的排名啦";
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:textStr];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        paragraphStyle.lineSpacing = 7;
        
        paragraphStyle.alignment = NSTextAlignmentJustified;
        
//        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
        
//        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, attributedString.length)];
        
        NSDictionary *attributesDict = @{NSFontAttributeName : [UIFont systemFontOfSize:13],
                               NSParagraphStyleAttributeName : paragraphStyle};
        
        [attributedString addAttributes:attributesDict range:NSMakeRange(0, attributedString.length)];
        
        _articleLabel.attributedText = attributedString;
        
//        NSLog(@"%f",[_articleLabel.attributedText boundingRectWithSize:CGSizeMake(328 * SCALE_6S_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics context:nil].size.height);
        
//        [_articleLabel.attributedText boundingRectWithSize:CGSizeMake(328 * SCALE_6S_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics context:nil];
        
//        [_articleLabel.text boundingRectWithSize:CGSizeMake(328 * SCALE_6S_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics attributes:attributesDict context:nil].size.height;
        
//        NSLog(@"%f",[_articleLabel.text boundingRectWithSize:CGSizeMake(328 * SCALE_6S_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics attributes:attributesDict context:nil].size.height);
        
    }
    
    return _articleLabel;
}

- (UIView *)separatorView
{
    if (_separatorView == nil) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = [UIColor colorWithHexValue:0xE5E5E5 alpha:1];
    }
    
    return _separatorView;
}

- (UIView *)articleView
{
    if (_articleView == nil) {
        
        _articleView = [[UIView alloc] init];
        
        
        // topCycleView
        
        QTTopCycleView *topCycleView = [[QTTopCycleView alloc] init];
        
        [_articleView addSubview:topCycleView];
        
        [topCycleView makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.height.offset(SCREEN_WIDTH);
            
            make.top.equalTo(_articleView.top);
            
            make.left.equalTo(_articleView.left);
            
        }];
        
        // iconImageView
        
        [_articleView addSubview:self.iconImageView];
        
        [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.height.offset(40);
            
            make.top.equalTo(topCycleView.bottom).offset(23 * SCALE_6S_HEIGHT);
            
            make.left.equalTo(_articleView.left).offset(23 * SCALE_6S_WIDTH);
        }];
        
        // nameLabel
        
        [_articleView addSubview:self.nameLabel];
        
        [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
            
           
            make.top.equalTo(self.iconImageView.top);
            
            make.left.equalTo(self.iconImageView.right).offset(6);
            
        }];
        
        // timeLabel
        
        [_articleView addSubview:self.timeLabel];
        
        [self.timeLabel makeConstraints:^(MASConstraintMaker *make) {
            
           
            make.left.equalTo(self.nameLabel.left);
            
            make.bottom.equalTo(self.iconImageView.bottom);
            
        }];
        
        // articleLabel
        
        [_articleView addSubview:self.articleLabel];
        
        [self.articleLabel makeConstraints:^(MASConstraintMaker *make) {
            
           
            make.width.offset(328 * SCALE_6S_WIDTH);
            
            make.centerX.equalTo(_articleView.centerX);
            
            make.top.equalTo(self.iconImageView.bottom).offset(24);
        }];
        
        // 计算 articleLabel 高度
        
        CGFloat articleLabelH = [self.articleLabel.attributedText boundingRectWithSize:CGSizeMake(328 * SCALE_6S_WIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics context:nil].size.height;
        
        // separatorView
        
        [_articleView addSubview:self.separatorView];
        
        [self.separatorView makeConstraints:^(MASConstraintMaker *make) {
            
           
            make.width.offset(SCREEN_WIDTH);
            
            make.height.offset(1);
            
            make.bottom.equalTo(_articleView.bottom);
            
            make.centerX.equalTo(_articleView.centerX);
            
        }];
        
        // 375 + 23 + 40 + 27 + height
        
//        NSLog(@"%f",ceil(articleLabelH));
        
        CGFloat articleViewH = SCALE_6S_HEIGHT * (375 + 23 + 40 + 27 + 20) + ceil(articleLabelH);
        
        _articleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, articleViewH);
    }
    
    return _articleView;
}

- (UITableView *)commentTableView
{
    if (_commentTableView == nil) {
        _commentTableView = [[UITableView alloc] init];
        
        _commentTableView.dataSource = self;
        _commentTableView.delegate = self;
        
        [_commentTableView registerClass:[QTCommentCell class] forCellReuseIdentifier:CellID];
        
        _commentTableView.contentInset = UIEdgeInsetsMake(0, 0, 45 * SCALE_6S_HEIGHT, 0);

        _commentTableView.rowHeight = UITableViewAutomaticDimension;
        
        _commentTableView.estimatedRowHeight = 60 * SCALE_6S_HEIGHT;
        
        _commentTableView.tableHeaderView = self.articleView;
        
        _commentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return _commentTableView;
}

- (UIView *)bottomView
{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor colorWithHexValue:0xF9F9F9 alpha:1];
        
        UITextField *textField = [[UITextField alloc] init];
        
        textField.delegate = self;
        
        textField.borderStyle = UITextBorderStyleRoundedRect;
        
        textField.backgroundColor = [UIColor colorWithHexValue:0xEBEBEB alpha:1];
        
        textField.font = [UIFont systemFontOfSize:12];
        
        textField.placeholder = @"说点什么吧";
        
        textField.leftView           = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        textField.leftViewMode       = UITextFieldViewModeAlways;
        
        
        [_bottomView addSubview:textField];
        
        [textField makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.offset(217);
            
            make.left.equalTo(_bottomView.left).offset(12 * SCALE_6S_WIDTH);
            
            make.centerY.equalTo(_bottomView.centerY);
        }];
    }
    
    return _bottomView;
}



#pragma mark - view life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self.view addSubview:self.commentTableView];
    
    [self.commentTableView makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(SCREEN_WIDTH);
        
        make.height.offset(SCREEN_HEIGHT - 64);
        
        make.top.equalTo(self.view);
        
        make.left.equalTo(self.view);
        
    }];
    
    [self.view addSubview:self.bottomView];
    
    [self.bottomView makeConstraints:^(MASConstraintMaker *make) {
        
       
        make.width.offset(SCREEN_WIDTH);
        
        make.height.offset(45 * SCALE_6S_HEIGHT);
        
        make.bottom.equalTo(self.view.bottom);
        
        make.centerX.equalTo(self.view.centerX);
    }];
    
    self.singleTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAnywhereToDismissKeyboard:)];
    
    
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer
{
    //此method会将self.view里所有的subview的first responder都resign掉

    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        NSDictionary *userInfoDict = note.userInfo;
        
        CGFloat KBHeight = [[userInfoDict objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
        [self.bottomView updateConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.view.bottom).offset(-KBHeight);
        }];
        
        self.commentTableView.contentInset = UIEdgeInsetsMake(0, 0, KBHeight + 45 * SCALE_6S_HEIGHT, 0);
        
        [self.view layoutIfNeeded];
        
        [self.view addGestureRecognizer:self.singleTapGR];
        
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        [self.bottomView updateConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(self.view.bottom);
        }];
        
        self.commentTableView.contentInset = UIEdgeInsetsMake(0, 0, 45 * SCALE_6S_HEIGHT, 0);
        
        [self.view layoutIfNeeded];

        [self.view removeGestureRecognizer:self.singleTapGR];
        
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark - commentTableView data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QTCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - commentTableView delegate

#pragma mark - TextField Delegate



@end
