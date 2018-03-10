//
//  ViewController.h
//  imageselect
//
//  Created by Amit Gawai on 25/12/17.
//  Copyright © 2017 Amit Gawai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

- (IBAction)selectImage:(id)sender;


@end

