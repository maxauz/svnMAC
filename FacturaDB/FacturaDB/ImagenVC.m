//
//  ImagenVC.m
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 19/12/12.
//  Copyright (c) 2012 Softmark. All rights reserved.
//

#import "ImagenVC.h"

@interface ImagenVC ()

@end

@implementation ImagenVC

/*

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/


- (void)loadView
{
   
    [super    loadView];
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

- (void)viewDidLoad
{
        NSLog(@"2");
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
         NSLog(@"3");
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
