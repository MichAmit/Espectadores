//
//  ViewController.m
//  imageselect
//
//  Created by Amit Gawai on 25/12/17.
//  Copyright © 2017 Amit Gawai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIAlertController *alertctl;
@property(weak,nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Alertsetup];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)Alertsetup{
    self.alertctl=[UIAlertController alertControllerWithTitle:@"Select Image" message:@"Select anyone Option" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camera=[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
#if TARGET_IPHONE_SIMULATOR
        UIAlertController *action1=[UIAlertController alertControllerWithTitle:@"Error" message:@"Camera Cannot Be Opened On Simulator" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action2){
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [action1 addAction:ok];
        [self presentViewController:action1 animated:YES completion:nil];
#elif TARGET_OS_IPHONE
        UIImagePickerController *imgpkr=[[UIImagePickerController alloc]init];
        imgpkr.sourceType=UIImagePickerControllerSourceTypeCamera;
        [self dismissViewControllerAnimated:YES completion:nil];
       [self presentViewController:self animated:YES completion:nil];
        //IPHONE CODE
        
        
#endif
    }];
    UIAlertAction *imagegal=[UIAlertAction actionWithTitle:@"Image Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action3){
        UIImagePickerController *imgpkr1=[[UIImagePickerController alloc]init];
        imgpkr1.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        imgpkr1.delegate=self;
        //[imgpkr1 dismissViewControllerAnimated:YES completion:nil];
        [self presentViewController:imgpkr1 animated:YES completion:nil];
    }];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //Implment Action
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [self.alertctl addAction:camera];
    [self.alertctl addAction:imagegal];
    [self.alertctl addAction:cancel];
    
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
- (IBAction)selectImage:(id)sender {
    [self presentViewController:self.alertctl animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSData *dataImage=UIImageJPEGRepresentation([info objectForKey:@"UIImagePickerControllerOriginalImage"], 1);
    UIImage *img=[[UIImage alloc]initWithData:dataImage];
    [self.imageView setImage:img ];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

