//
//  ViewController.m
//  Obj-c training
//
//  Created by Sergei Veretennikov on 13.06.2024.
//

#import "ViewController.h"
#import "UIViewAutoLayout.h"
#import "ViewColorModel.h"
#import "TableViewController.h"

#define s1Constant ((CGFloat) 4)
#define s2Constant ((CGFloat) 8)
#define s3Constant ((CGFloat) 12)
#define s4Constant ((CGFloat) 16)
#define tfHeight ((CGFloat) 50)
#define tfWidth ((CGFloat) 300)

@interface ViewController ()

@property UITextField * textField;
@property UITextField * greenTextField;
@property UITextField * blueTextField;
@property UIView * redrawColorView;
@property (nonatomic, strong) void (^completion)(BOOL success);

@property ViewColorModel * colorManager;
@property (nonatomic, copy) int (^sumOf)(int first, int second);
- (int)returnSumFromFun:(int(^)(int first, int second))sum;
@end

@implementation ViewController

- (int)returnSumFromFun:(int (^)(int first, int second))sum {
    return sum(5, 2);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.colorManager = [[ViewColorModel alloc] initWithRed:0.4 green:0.2 blue:1];

        self.completion = ^(BOOL success) {
            __weak typeof(self) weakSelf = self;
            [weakSelf.redrawColorView setBackgroundColor:weakSelf.colorManager.color];
        };

        self.sumOf = ^(int first, int second) {
            return first + second;
        };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Some obj-c in life";
    self.view.backgroundColor = UIColor.whiteColor;
    [self setTextFieldConstraints];
    [self setGreenTF];
    [self setBlueTF];
    [self setViewConstraints];
    [self setEventsHandling];
    [self setGesture];
}

- (void) setEventsHandling {
    [self.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.greenTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.blueTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void) setGreenTF {
    self.greenTextField = [[UITextField alloc] init];
    [self.greenTextField defaultStyleWith: CGColorCreateSRGB(0, 1, 0, 1)];
    [self.greenTextField autoLayoutWith:self.view];
    self.greenTextField.delegate = self;

    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.greenTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.textField attribute:NSLayoutAttributeBottom multiplier:1 constant:s4Constant],
        [NSLayoutConstraint constraintWithItem:self.greenTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:tfWidth],
        [NSLayoutConstraint constraintWithItem:self.greenTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:tfHeight],
        [NSLayoutConstraint constraintWithItem:self.greenTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]
    ]];
}

- (void) setBlueTF {
    self.blueTextField = [[UITextField alloc] init];
    [self.blueTextField defaultStyleWith: CGColorCreateSRGB(0, 0, 1, 1)];
    [self.blueTextField autoLayoutWith:self.view];
    self.blueTextField.delegate = self;

    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.blueTextField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.greenTextField attribute:NSLayoutAttributeBottom multiplier:1 constant:s4Constant],
        [NSLayoutConstraint constraintWithItem:self.blueTextField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:tfWidth],
        [NSLayoutConstraint constraintWithItem:self.blueTextField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:tfHeight],
        [NSLayoutConstraint constraintWithItem:self.blueTextField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]
    ]];
}

- (void) setViewConstraints {
    self.redrawColorView = [[UIView alloc] init];
    self.redrawColorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.redrawColorView];
    [self.redrawColorView setBackgroundColor: self.colorManager.color];

    [
        NSLayoutConstraint activateConstraints:@[
            [NSLayoutConstraint constraintWithItem:self.redrawColorView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:100],
            [NSLayoutConstraint constraintWithItem:self.redrawColorView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:100],
            [NSLayoutConstraint constraintWithItem:self.redrawColorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0],
            [NSLayoutConstraint constraintWithItem:self.redrawColorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]
        ]
    ];
}

- (void) textFieldDidChange:(UITextField *)textField {
    if ([textField.text integerValue] > 255) {
        textField.text = @"255";
    }
    int numberValue = [textField.text intValue];
    if (textField == self.textField) {
        [self.colorManager setRed:numberValue];
    } else if (textField == self.greenTextField) {
        [self.colorManager setGreen:numberValue];
    } else if (textField == self.blueTextField) {
        [self.colorManager setBlue:numberValue];
    }
    [
        UIView animateWithDuration:1 animations:^{
            self.completion(true);
            int value = [self returnSumFromFun: self.sumOf];
            NSLog(@"%i", value);
        }
    ];
}

- (void) setGesture {
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    UITapGestureRecognizer * endEditing = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditing)];

    [self.redrawColorView setGestureRecognizers:@[gesture]];
    [self.view setGestureRecognizers:@[endEditing]];
}

- (void) onTap {
    [self.view endEditing:true];
    UIViewController * controller = [[TableViewController alloc] init];
    [self.navigationController pushViewController:controller animated:true];
}

- (void) endEditing {
    [self.view endEditing:true];
}

- (void) setTextFieldConstraints {
    self.textField = [[UITextField alloc] init];
    [self.textField defaultStyleWith:CGColorCreateSRGB(1, 0, 0, 1)];
    self.textField.delegate = self;

    [self.textField autoLayoutWith:self.view];
    NSLayoutConstraint * topConstraint = [NSLayoutConstraint
                                                                    constraintWithItem:self.textField
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                    attribute:NSLayoutAttributeTop
                                                                    multiplier:1 constant:100];

    NSLayoutConstraint * widthConstr = [NSLayoutConstraint constraintWithItem:self.textField
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy: NSLayoutRelationEqual
                                                                    toItem:nil
                                                                    attribute:NSLayoutAttributeWidth
                                                                    multiplier:1
                                                                    constant:tfWidth];

    NSLayoutConstraint * heightConstr = [NSLayoutConstraint constraintWithItem:self.textField
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy: NSLayoutRelationEqual
                                                                    toItem:nil
                                                                    attribute:NSLayoutAttributeHeight
                                                                    multiplier:1
                                                                    constant:tfHeight];

    NSLayoutConstraint * centerConstr = [NSLayoutConstraint constraintWithItem:self.textField
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    multiplier:1
                                                                    constant:0];

    [NSLayoutConstraint activateConstraints:@[topConstraint, widthConstr, heightConstr, centerConstr]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textField) {
        [self.greenTextField becomeFirstResponder];
    } else if (textField == self.greenTextField) {
        [self.blueTextField becomeFirstResponder];
    } else if (textField == self.blueTextField) {
        [self.view endEditing:true];
    }
    return true;
}

@end
