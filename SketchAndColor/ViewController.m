//
//  ViewController.m
//  SketchAndColor
//
//  Created by Xinyu Chang on 9/12/15.
//  Copyright (c) 2015 Xinyu Chang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *SketchMyOwnButton;
@property (weak, nonatomic) IBOutlet UIButton *SketchMyPicButton;
@property (weak, nonatomic) IBOutlet UIButton *MySketchbookButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SketchMyOwnPressed:(id)sender {
    NSLog(@"Sketch My Own Pressed!");
}

- (IBAction)SketchMyPicPressed:(id)sender {
    NSLog(@"Sketch My Pic Pressed!");

}

- (IBAction)MySketchbookPressed:(id)sender {
    NSLog(@"My Sketchbook Pressed!");

}



@end
