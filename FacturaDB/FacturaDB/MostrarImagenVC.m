//
//  MostrarImagenVC.m
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 19/12/12.
//  Copyright (c) 2012 Softmark. All rights reserved.
//

#import "MostrarImagenVC.h"

@interface MostrarImagenVC ()

@end

@implementation MostrarImagenVC
@synthesize ImagenCentral;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"1");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    
        NSLog(@"2");
    [super loadView];
    
    
    
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

- (void)viewDidLoad
{
        NSLog(@"3");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
        NSLog(@"4");
    [self setImagenCentral:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        NSLog(@"5");
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
