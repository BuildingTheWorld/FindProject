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

@property (strong, nonatomic) UITextField *commentTextField;

@property (strong, nonatomic) UIButton *likeButton;

//@property (strong, nonatomic) UILabel *likeLabel;

@property (strong, nonatomic) UIButton *commentScrolltButton;

@property (strong, nonatomic) UILabel *commentCountLabel;

@property (strong, nonatomic) UIView *bottomView;

@property (strong, nonatomic) UITapGestureRecognizer *singleTapGR;

@property (assign, nonatomic) CGFloat articleViewH;

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
        
        self.articleViewH = articleViewH;
        
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

- (UITextField *)commentTextField
{
    if (_commentTextField == nil)
    {
        _commentTextField = [[UITextField alloc] init];
        
        _commentTextField.delegate = self;
        
        _commentTextField.borderStyle = UITextBorderStyleRoundedRect;
        
        _commentTextField.backgroundColor = [UIColor colorWithHexValue:0xEBEBEB alpha:1];
        
        _commentTextField.font = [UIFont systemFontOfSize:12];
        
        _commentTextField.placeholder = @"说点什么吧";
        
        _commentTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        
        _commentTextField.leftViewMode = UITextFieldViewModeAlways;
        
        _commentTextField.returnKeyType = UIReturnKeySend;
    }
    
    return _commentTextField;
}

- (UIButton *)likeButton
{
    if (_likeButton == nil) {
        _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_likeButton setImage:[UIImage imageNamed:@"like_normal"] forState:UIControlStateNormal];
        [_likeButton setImage:[UIImage imageNamed:@"like_selected"] forState:UIControlStateSelected];
        
        [_likeButton addTarget:self action:@selector(likeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _likeButton;
}

#warning likeButtonClick:

- (void)likeButtonClick:(UIButton *)button
{
    button.selected = !button.isSelected;
}

/*

- (UILabel *)likeLabel
{
    if (_likeLabel == nil) {
        _likeLabel = [[UILabel alloc] init];
        _likeLabel.font = [UIFont systemFontOfSize:12];
        _likeLabel.textColor = [UIColor colorWithHexValue:0xADADAD alpha:1];
        _likeLabel.text = @"喜欢";
    }
    
    return _likeLabel;
}

*/
 
- (UIButton *)commentScrolltButton
{
    if (_commentScrolltButton == nil) {
        _commentScrolltButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_commentScrolltButton setImage:[UIImage imageNamed:@"commentImage"] forState:UIControlStateNormal];
        
        // commentCountLabel
        
        [_commentScrolltButton addSubview:self.commentCountLabel];
        
        [self.commentCountLabel makeConstraints:^(MASConstraintMaker *make) {
            
           
            make.width.height.offset(10);
            
            make.top.equalTo(_commentScrolltButton.top).offset(-2);
            make.right.equalTo(_commentScrolltButton.right).offset(2);
            
        }];
        
        [_commentScrolltButton addTarget:self action:@selector(commentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _commentScrolltButton;
}

#warning commentButtonClick:

- (void)commentButtonClick:(UIButton *)button
{
    [self.commentTableView setContentOffset:CGPointMake(0, self.articleViewH) animated:YES];
}



- (UILabel *)commentCountLabel
{
    if (_commentCountLabel == nil) {
        _commentCountLabel = [[UILabel alloc] init];
        _commentCountLabel.backgroundColor = [UIColor redColor];
        _commentCountLabel.textColor = [UIColor whiteColor];
        _commentCountLabel.font = [UIFont systemFontOfSize:6];
        _commentCountLabel.textAlignment = NSTextAlignmentCenter;
        _commentCountLabel.text = @"7";
        _commentCountLabel.layer.cornerRadius = 5;
        _commentCountLabel.layer.masksToBounds = YES;
    }
    
    return _commentCountLabel;
}



- (UIView *)bottomView
{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor colorWithHexValue:0xF9F9F9 alpha:1];
        
        // comment TextField
        
        [_bottomView addSubview:self.commentTextField];
        [self.commentTextField makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.width.offset(264 * SCALE_6S_WIDTH);
            
            make.left.equalTo(_bottomView.left).offset(12 * SCALE_6S_WIDTH);
            
            make.centerY.equalTo(_bottomView.centerY);
        }];
        
        // like button
        
        [_bottomView addSubview:self.likeButton];
        [self.likeButton makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.offset(18);
            make.height.offset(16);
            make.centerY.equalTo(_bottomView.centerY);
            make.left.equalTo(self.commentTextField.right).offset(22 * SCALE_6S_WIDTH);
        }];
        
        // like label
        /*
        
        [_bottomView addSubview:self.likeLabel];
        [self.likeLabel makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_bottomView.centerY);
            
            make.left.equalTo(self.likeButton.right).offset(18);
            
        }];
        
        */
        
        // commentCount button
        
        [_bottomView addSubview:self.commentScrolltButton];
        [self.commentScrolltButton makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.height.offset(18);
            
            make.centerY.equalTo(_bottomView.centerY);
            
            make.left.equalTo(self.likeButton.right).offset(22 * SCALE_6S_WIDTH);
        }];
        
        // commentCount label
        /*
        
        [_bottomView addSubview:self.commentCountLabel];
        [self.commentCountLabel makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(_bottomView.centerY);
            
            make.left.equalTo(self.commentCountButton.right).offset(18);
            
        }];
        
        */
        
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
    //此方法会将 self.view 里所有的 subview 的 first responder 都 resign

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
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QTCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - commentTableView delegate

#pragma mark - TextField Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    /*
    
    if (![textField.textInputMode.primaryLanguage isEqualToString:@"zh-Hans"] && ![textField.textInputMode.primaryLanguage isEqualToString:@"en-US"])
    {
        return NO;
    }
    
     */
     
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
#warning 发送评论网络请求
    
    
    [self.view endEditing:YES];
    
    return YES;
}

@end
