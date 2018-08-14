//
//  ViewController.m
//  GoogleWebRTCDemoApp
//
//  Created by Anant Kannaik on 11/07/18.
//  Copyright © 2018 Anant Kannaik. All rights reserved.
//

#import "ViewController.h"
#import "ARTCVideoChatViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *roomNameTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)callButtonTapped:(UIButton *)sender {
    [self performSegueWithIdentifier:@"ARTCVideoChatViewControllerSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ARTCVideoChatViewControllerSegue"]) {
        ARTCVideoChatViewController *aRTCVideoChatViewController = segue.destinationViewController;
        [aRTCVideoChatViewController setRoomNameWith:self.roomNameTextField.text];
    }
}

@end
