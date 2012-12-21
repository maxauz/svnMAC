//
//  InicioVC.m
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 14/12/12.
//  Copyright (c) 2012 Softmark. All rights reserved.
//

#import "InicioVC.h"

@interface InicioVC ()

@end

@implementation InicioVC


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    [super   loadView];
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

- (void)viewDidLoad
{
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:(CGSizeMake(1000,320))];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
 
    scroll = nil;
  
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
