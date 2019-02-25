//
//  KKPhotoBrowser.m
//  JSAPI
//
//  Created by CaiMing on 2017/6/20.
//  Copyright © 2017年 CaiMing. All rights reserved.
//

#import "KKPhotoBrowser.h"
#import "KKPhotoBrowserImageView.h"
#import <Masonry/Masonry.h>
#import "UIColor+HexColor.h"
#import "UIColor+HexColor.h"

#define KKPhotoBrowserImageViewMargin 10
#define KKPHONE_WIDTH [UIScreen mainScreen].bounds.size.width

#define KKIPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define KKStatusBarHeight           (KKIPHONE_X ? 44.0 : 20.0)



@interface KKPhotoBrowser ()<UIScrollViewDelegate,KKPhotoBrowserImageViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,assign)CGPoint beginContentOffset;
@property (nonatomic,strong) UIView *naviView;
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UILabel *countLab;
@property (nonatomic,strong) UILabel *totalCountLab;

@end

@implementation KKPhotoBrowser

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self initSubviews];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    // 获取到自己的bounds
    CGRect rect = self.view.bounds;
    rect.size.width += KKPhotoBrowserImageViewMargin * 2;
    
    _scrollView.bounds = rect;
    _scrollView.center = self.view.center;
    
    CGFloat y = 0;
    CGFloat w = _scrollView.frame.size.width - KKPhotoBrowserImageViewMargin * 2;
    CGFloat h = _scrollView.frame.size.height;
    
    // 布局ScrollView子空间的frame
    [_scrollView.subviews enumerateObjectsUsingBlock:^(KKPhotoBrowserImageView *obj, NSUInteger idx, BOOL *stop) {
        CGFloat x = KKPhotoBrowserImageViewMargin + idx * (KKPhotoBrowserImageViewMargin * 2 + w);
        obj.frame = CGRectMake(x, y, w, h);
    }];
    // ScrollView的内容尺寸
    _scrollView.contentSize = CGSizeMake(_scrollView.subviews.count * _scrollView.frame.size.width, 0);
    
    _scrollView.contentOffset = CGPointMake(self.currentImageIndex * _scrollView.frame.size.width, 0);
}


- (void)initSubviews
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    [self.view addSubview:self.naviView];
    
    [self.naviView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.right.offset(0);
        make.bottom.equalTo(self.navigationController.navigationBar.mas_bottom);
    }];
    
    [self.view addSubview:self.countLab];
    [self.view addSubview:self.totalCountLab];
    self.totalCountLab.text = [NSString stringWithFormat:@"/%@",@(self.imageCount)];
    self.countLab.text = [NSString stringWithFormat:@"%@",@(self.currentImageIndex+1)];
    
    [self.totalCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.offset(38);
        make.bottom.offset(-41);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(100);
    }];
    
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(0);
        make.bottom.offset(-41);
        make.height.mas_equalTo(22);
        make.right.equalTo(self.totalCountLab.mas_left).offset(0);
    }];
    for (int i = 0; i < self.imageCount; i++) {
        
        // 在ScrollView上添加图片
        KKPhotoBrowserImageView *imageView = [[KKPhotoBrowserImageView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        imageView.tag = i;
        imageView.delegate = self;
        [_scrollView addSubview:imageView];
    }
    [self preloadImageOfImageViewForIndex:_currentImageIndex];
}


- (void)preloadImageOfImageViewForIndex:(NSInteger)index
{

    if (index<0||index>_scrollView.subviews.count-1)
    {
        return;
    }

    KKPhotoBrowserImageView *imageView = _scrollView.subviews[index];
    if (imageView.preload) {
        
        return;
    }
    
    NSURL *url = nil;
    UIImage *image = nil;
    if ([self.delegate respondsToSelector:@selector(photoBrowser:highQualityImageURLForIndex:)]) {
        
        url = [self.delegate photoBrowser:self highQualityImageURLForIndex:index];
        
    }
    
    if ([self.delegate respondsToSelector:@selector(photoBrowser:placeholderImageForIndex:)]) {
        
        image = [self.delegate photoBrowser:self placeholderImageForIndex:index];
    }
    
    [imageView setImageWithURL:url placeholderImage:image];
    imageView.preload = YES;
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _beginContentOffset = scrollView.contentOffset;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _currentImageIndex = (scrollView.contentOffset.x) / _scrollView.bounds.size.width;
    NSLog(@"%@",@(_currentImageIndex));
    self.countLab.text = [NSString stringWithFormat:@"%@",@(_currentImageIndex+1)];

}
#pragma mark - scrollview代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%@",scrollView);
    if (scrollView.contentOffset.x>_beginContentOffset.x) {
        
        [self preloadImageOfImageViewForIndex:_currentImageIndex+1];

    }else
    {
        [self preloadImageOfImageViewForIndex:_currentImageIndex-1];
    }
    
}

#pragma mark - KKPhotoBrowserImageViewDelegate

- (void)photoBrowserImageViewSingleTap:(UIView*)aView
{
//    [self dismiss];
}
- (void)photoBrowserImageViewLongPress:(UIView*)aView
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"保存图片"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       
                                                       
                                                   }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       
                                                       
                                                   }];
    
    [alertController addAction:action];
    [alertController addAction:cancel];
    [self presentViewController:alertController animated:YES completion:nil];

}
// 展示的方法
- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.view.frame = window.bounds;
    // 监听自己的Frame
    [window.rootViewController addChildViewController:self];
    [window.rootViewController.view addSubview:self.view];
    
    self.view.alpha=0;
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha=1;
    } completion:^(BOOL finished) {
        
    }];

}

- (void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.alpha=0;
    } completion:^(BOOL finished) {
        [self removeFromParentViewController];
        [self.view removeFromSuperview];
    }];
    
}

#pragma mark ------------ Lazy
-(UIView *)naviView
{
    if (!_naviView) {
        _naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KKPHONE_WIDTH, KKStatusBarHeight+54)];
        _naviView.backgroundColor = [UIColor whiteColor];
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, KKStatusBarHeight+10, 34, 34)];
        _backBtn.layer.cornerRadius = 17;
        [_backBtn setImage:[UIImage imageNamed:@"GoodsDetailPopIcon"] forState:UIControlStateNormal];
        _backBtn.alpha = 1;
        [_backBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_naviView addSubview:_backBtn];
    }
    return _naviView;
}

- (UILabel *)countLab
{
    if (!_countLab) {
        
        _countLab = [[UILabel alloc]init];
        _countLab.textColor = [UIColor whiteColor];
        _countLab.font = [UIFont systemFontOfSize:22];
        _countLab.textAlignment = NSTextAlignmentRight;

    }
    return _countLab;
}

- (UILabel *)totalCountLab
{
    if (!_totalCountLab) {
        
        _totalCountLab = [[UILabel alloc]init];
        _totalCountLab.textColor = [UIColor whiteColor];
        _totalCountLab.font = [UIFont systemFontOfSize:14];;
    }
    return _totalCountLab;
}

@end
