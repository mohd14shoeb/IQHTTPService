//
//  FileUploadViewController.m
//  IQHTTPService Demo
//
//  Created by Indresh on 23/01/15.
//  Copyright (c) 2015 Iftekhar. All rights reserved.
//

#import "FileUploadViewController.h"
#import "TestHTTPService.h"

@interface FileUploadViewController ()
{
    IBOutlet UILabel *labelRequest;
    IBOutlet UILabel *labelInfo;
    NSDictionary *requestDict;
}

@end

@implementation FileUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    requestDict = @{@"Key1":@"Value1",@"Key2":@"Value2",@"Key3":@"Value3"};
    labelRequest.text = [NSString stringWithFormat:@"%@",requestDict];
}

- (IBAction)requestAction:(UIButton *)sender {
    
    IQMultipartFormData *formDataJpeg = [IQMultipartFormData multipartDataWithKeyName:@"test1" fileAtPath:[[NSBundle mainBundle] pathForResource:@"test1" ofType:@"jpeg"]];
    
    IQMultipartFormData *formDataPng = [IQMultipartFormData multipartDataWithKeyName:@"test2" fileAtPath:[[NSBundle mainBundle] pathForResource:@"test2" ofType:@"png"]];
    
    [[TestHTTPService service] uploadFilesWithParameters:requestDict files:@[formDataJpeg,formDataPng] completionBlock:^(NSDictionary *result, NSError *error) {
        if (result)
        {
            labelInfo.text = [NSString stringWithFormat:@"%@",result];
            NSLog(@"Completion: %@", result);
        }
        else
        {
            NSLog(@"Error: %@", error);
        }
    }];
}

@end
