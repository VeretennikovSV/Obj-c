//
//  BreedDetails.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 17.06.2024.
//

#import "BreedDetails.h"
#import "Breed.h"
#import "UIViewAutoLayout.h"

@interface BreedDetails ()
@property (nonatomic, copy) Breed * breed;
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * breedLabel;
@property (nonatomic, strong) UILabel * countryLabel;
@property (nonatomic, strong) UILabel * originLabel;
@property (nonatomic, strong) UILabel * coatLabel;
@property (nonatomic, strong) UILabel * patternLabel;
@property (nonatomic, strong) UIStackView * stack;

@property (atomic, strong) NSLayoutConstraint * topConstraint;
@property (atomic, strong) NSLayoutConstraint * widthConstraint;
@property (atomic, strong) NSLayoutConstraint * heightConstraint;
@end

@implementation BreedDetails
#define DEFAULT_PADDING ((CGFloat) -UIApplication.sharedApplication.statusBarFrame.size.height - 5)

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    [self.navigationController setNavigationBarHidden:false animated:false];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColor.whiteColor];
    [self setScrollView];
    [self setImage];
    [self.navigationController setNavigationBarHidden:true animated:false];
}

- (instancetype)initWithBreed:(Breed *)breed {
    self = [super init];
    if (self) {
        _breed = breed;
        _scrollView = [[UIScrollView alloc] init];
        _imageView = [[UIImageView alloc] init];
        _breedLabel = [[UILabel alloc] init];
        _countryLabel = [[UILabel alloc] init];
        _originLabel = [[UILabel alloc] init];
        _coatLabel = [[UILabel alloc] init];
        _patternLabel = [[UILabel alloc] init];
        _stack = [[UIStackView alloc] init];
    }
    return self;
}

- (void) addSubviews {
    for (int i = 0; i < 20; i++) {
        UILabel * label = [[UILabel alloc] init];
        label.text = @"jhahsdkljh saljdh cbljsahbdcsa foo jhasdf jahsd fjklashdfasdhfjhas";
        label.numberOfLines = 10;
        [self.stack addArrangedSubview:label];
    }
    NSLog(@"%i", self.stack.arrangedSubviews.count);
}

- (void) setStackView {
    [self.stack autoLayoutWith:self.scrollView];
    [self.stack setUserInteractionEnabled:false];
    self.stack.axis = UILayoutConstraintAxisVertical;
    self.stack.spacing = 4;
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.stack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.imageView attribute:NSLayoutAttributeBottom multiplier:1 constant:16],
        [NSLayoutConstraint constraintWithItem:self.stack attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1 constant:16],
        [NSLayoutConstraint constraintWithItem:self.stack attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1 constant:16]

    ]];
    CGRect contentRect = CGRectZero;

    for (UIView *view in self.scrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    self.scrollView.contentSize = contentRect.size;
}

- (void) setScrollView {
    [self.scrollView autoLayoutWith:self.view];
    self.scrollView.backgroundColor = UIColor.whiteColor;
    self.scrollView.delegate = self;

    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:(DEFAULT_PADDING)],
        [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
    ]];
}

- (void) setImage {
    [self.imageView autoLayoutWith:self.scrollView];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;

    self.topConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    self.widthConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:UIScreen.mainScreen.bounds.size.width];
    self.heightConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:UIScreen.mainScreen.bounds.size.width];

    [NSLayoutConstraint activateConstraints:@[
        self.topConstraint,
        self.widthConstraint,
        self.heightConstraint,
        [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0],
    ]];

    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSURL * urlImage = [NSURL URLWithString:@"https://sun9-8.userapi.com/impf/c629123/v629123456/2d4c6/zBmkPvmLY2w.jpg?size=900x900&quality=96&sign=60dc6566eca72554bc3b350a80f6e6e7&c_uniq_tag=Rtm6m-YkGYlq4Q_37dwTnJgE0h9ekz5J34lcLce0bB0&type=album"];
        NSData * dataImage = [NSData dataWithContentsOfURL:urlImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageWithData:dataImage];
            [self addSubviews];
            [self setStackView];
        });
    });
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float floats = DEFAULT_PADDING;
    CGFloat offset = scrollView.contentOffset.y - floats;
    [self.imageView setNeedsLayout];
    
    if (offset < 0) {
        self.topConstraint.constant = offset;
        self.widthConstraint.constant = UIScreen.mainScreen.bounds.size.width + ABS(offset);
        self.heightConstraint.constant = UIScreen.mainScreen.bounds.size.width + ABS(offset);
    } else {
        self.topConstraint.constant = 0;
        self.widthConstraint.constant = UIScreen.mainScreen.bounds.size.width;
        self.heightConstraint.constant = UIScreen.mainScreen.bounds.size.width;
    }
    [self.imageView layoutIfNeeded];
}

@end
