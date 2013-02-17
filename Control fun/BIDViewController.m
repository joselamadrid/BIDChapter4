//
//  BIDViewController.m
//  Control fun
//
//  Created by Josemac on 15.02.13.
//  Copyright (c) 2013 Jose. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()
@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.sliderLabel.text = @"50";
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 12, 0, 12);
    UIImage *strechableButtonImageNormal = [buttonImageNormal resizableImageWithCapInsets:insets];
    [self.doSomethingButton setBackgroundImage:strechableButtonImageNormal forState:UIControlStateNormal];
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed resizableImageWithCapInsets:insets];
    [self.doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender
{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(UISlider *)sender
{
    int progress = lroundf(sender.value);
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", progress];
}

- (IBAction)switchChanged:(UISwitch *)sender
{
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}

- (IBAction)buttonPressed:(UIButton *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way!"
                                  destructiveButtonTitle:@"Yes, I'm Sure!"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *msg = nil;
        
        if(self.nameField.text.length > 0)
            msg =[NSString stringWithFormat:
                  @"You can breathe easy, %@, everything went OK.",
                  self.numberField.text];
        else
            msg = @"YOu can breathe easy, everything went OK.";
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something was done"
            message:msg
            delegate:self
            cancelButtonTitle:@"Phew!"
            otherButtonTitles:nil];
    
        [alert show];
    }
}

- (IBAction)toggleControls:(UISegmentedControl *)sender
{
    if(sender.selectedSegmentIndex == 0)
    {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    }
    else
    {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
}

@end
