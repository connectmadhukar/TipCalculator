//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Madhukar Mulpuri on 1/8/14.
//  Copyright (c) 2014 Madhukar Mulpuri. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipSelector;
- (IBAction)defaultTipChange:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Settings";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTip = [defaults integerForKey:@"defaultSelectedTip"];
    
    self.defaultTipSelector.selectedSegmentIndex = defaultTip;
    
}


- (void)viewWillDisappear:(BOOL)animated {
    NSInteger selectedIndex = [self.defaultTipSelector selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:selectedIndex
                  forKey:@"defaultSelectedTip"];
    [defaults synchronize];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)defaultTipChange:(id)sender {
    NSInteger selectedIndex = [self.defaultTipSelector selectedSegmentIndex];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:selectedIndex
                 forKey:@"defaultSelectedTip"];
    [defaults synchronize];
}
@end
