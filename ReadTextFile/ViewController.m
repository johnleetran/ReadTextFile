//
//  ViewController.m
//  ReadTextFile
//
//  Created by John Tran on 1/25/20.
//  Copyright © 2020 John Tran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *browseFileButton;
@property (weak, nonatomic) IBOutlet UITextView *textReadFileView;
@property (weak, nonatomic) IBOutlet UIImageView *imageFileView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)tapBrowseFileButton:(id)sender {
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.image", @"public.text", @"public.plain-text", @"text/plain"] inMode:UIDocumentPickerModeImport];
    documentPicker.delegate = self;
    documentPicker.allowsMultipleSelection = false;
    [self presentViewController:documentPicker animated:YES completion:nil];
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    if (controller.documentPickerMode == UIDocumentPickerModeImport) {
        NSString* filePath = [url relativePath];
        NSString* fileExt = [url pathExtension];

        if([fileExt isEqualToString:@"txt"] ||  [fileExt isEqualToString:@"json"]){
            NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
            [ _textReadFileView setText: content];
        }else if([fileExt isEqualToString:@"jpg"] || [fileExt isEqualToString:@"jpeg"] || [fileExt isEqualToString:@"png"]){
            NSString *ImageURL = filePath;
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            _imageFileView.image = [UIImage imageWithData:imageData];
        }

    }
}

@end
