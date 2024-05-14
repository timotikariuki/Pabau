//
//  ViewController.m
//  Pabau
//
//  Created by star on 5/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnRequestTerminal.layer.borderWidth = 1.0f;
    self.btnRequestTerminal.layer.cornerRadius = 4.0f;
    self.btnRequestTerminal.layer.borderColor = [UIColor colorWithRed:84/255.0f green:178/255.0f blue:211/255.0f alpha:1.0f].CGColor;
    
    self.btnLearnMore.layer.cornerRadius = 4.0f;
    self.btnLearnMore.layer.borderWidth = 1.0f;
    self.btnLearnMore.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    
}

-(void)viewDidLayoutSubviews {
    
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (orientation == UIDeviceOrientationUnknown) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        if (screenSize.height > screenSize.width) {
            orientation = UIDeviceOrientationPortrait;
        } else {
            orientation = UIDeviceOrientationLandscapeLeft;
        }
    }
    [self handleOrientation:orientation];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationChanged:(NSNotification *)notification {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    [self handleOrientation:orientation];
}

- (void)handleOrientation:(UIDeviceOrientation)orientation {
    
    BOOL isLandscape = NO;
    BOOL isUnknown = NO;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
        case UIDeviceOrientationPortraitUpsideDown:
            isLandscape = NO;
            break;
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            isLandscape = YES;
            break;
        default:
            NSLog(@"Unknown orientation");
            isUnknown = YES;
            break;
    }
    
    if (isLandscape) {
        self.textWidthConstraint.constant = 0.9f;
        self.backgroundImageWidthConstraint.constant = 0.65f;
        self.itemHeightConstraint.constant = 40.0f;
        
    } else {
        self.textWidthConstraint.constant = 0.65f;
        self.backgroundImageWidthConstraint.constant = 0.45f;
        self.itemHeightConstraint.constant = 60.0f;
    }
    
    [self updateViewConstraints];
    [self.view layoutIfNeeded];
    
}


@end
