//
//  ViewController.h
//  GetFromAlbum
//
//  Created by 鲁又佳 on 9/12/15.
//  Copyright (c) 2015 Youjia Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface PhotoViewController : UIViewController
- (IBAction)showSavedMediaBrowser:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

