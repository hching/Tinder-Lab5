//
//  CardsViewController.m
//  Tinder
//
//  Created by Henry Ching on 9/18/15.
//  Copyright © 2015 Henry Ching. All rights reserved.
//

#import "CardsViewController.h"
#import "ProfileViewController.h"

@interface CardsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property CGPoint cardInitialCenter;
@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.cardInitialCenter = self.mainImage.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onPanImage:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender translationInView:sender.view];
    //CGPoint velocity = [sender velocityInView:sender.view];
    
    if(sender.state == UIGestureRecognizerStateBegan) {
        sender.view.center = CGPointMake(self.cardInitialCenter.x, self.cardInitialCenter.y + point.y);
        NSLog(@"Tray Begin");
    } else if(sender.state == UIGestureRecognizerStateChanged) {
        sender.view.center = CGPointMake(self.cardInitialCenter.x, self.cardInitialCenter.y + point.y);
        NSLog(@"Tray Changed");
    } else if(sender.state == UIGestureRecognizerStateEnded) {
        sender.view.center = CGPointMake(self.cardInitialCenter.x, self.cardInitialCenter.y);
        NSLog(@"Tray Ended");
        [self performSegueWithIdentifier:@"profileSegue" sender:self];
    }
    //[sender setTranslation:CGPointMake(0, 0) inView:sender.view];
}

@end
