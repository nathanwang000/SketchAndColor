//
//  ViewController.m
//  GetFromAlbum
//
//  Created by 鲁又佳 on 9/12/15.
//  Copyright (c) 2015 Youjia Lu. All rights reserved.
//
#import "PhotoViewController.h"

@interface PhotoViewController()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL) startMediaBrowserFromViewController: (UIViewController*) controller
                               usingDelegate: (id <UIImagePickerControllerDelegate,
                                               UINavigationControllerDelegate>) delegate {
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)
        || (delegate == nil)
        || (controller == nil))
        return NO;
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    
    
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    // Displays saved pictures and movies, if both are available, from the
    // Camera Roll album.
    mediaUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage,
                          nil];    // Hides the controls for moving & scaling pictures, or for
    // trimming movies. To instead show the controls, use YES.
    mediaUI.allowsEditing = NO;
    mediaUI.delegate = delegate;
    [controller presentModalViewController: mediaUI animated: YES];
    return YES;
}

- (void) imagePickerController: (UIImagePickerController *) picker
    didFinishPickingMediaWithInfo: (NSDictionary *) info
{
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToUse;
    // Handle a still image picked from a photo album
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        if (editedImage) {
            imageToUse = editedImage;
        } else {
            imageToUse = originalImage;
        }
        // Do something with imageToUse
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageView setImage:imageToUse]; //Assign the picture to the image view
        [self dismissModalViewControllerAnimated:YES];
    }
    // Handle a movied picked from a photo album
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0)
        == kCFCompareEqualTo) {
        NSString *moviePath = [[info objectForKey:
                                UIImagePickerControllerMediaURL] path];
        // Do something with the picked movie available at moviePath
    }
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    
    
}

- (IBAction)showSavedMediaBrowser:(id)sender {
        [self startMediaBrowserFromViewController: self
                                    usingDelegate: self];
}

- (IBAction)doneButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
