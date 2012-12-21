//
//  InicialVC.m
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 21/12/12.
//  Copyright (c) 2012 Softmark. All rights reserved.
//

#import "InicialVC.h"

#import "RootVC.h"
#import <sqlite3.h>
#import "AppDelegate.h"

@interface InicialVC (){
NSMutableArray *imagenes;
}

@end

@implementation InicialVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    /*
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
    */
    
    
    
}


/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    
    if ([segue.identifier isEqualToString:@"1p"]) {
[self performSegueWithIdentifier:@"1p" sender:self];
    }
    else if([segue.identifier isEqualToString:@"2p"]){
[self performSegueWithIdentifier:@"2p" sender:self];    
    }
    
    
    
}
 */



- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
    
    NSLog(@"inicial");
    
    
    
    imagenes=[[NSMutableArray alloc] init];
    
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    sqlite3 *database;
    sqlite3_stmt *sentencia;
    
    if(sqlite3_open([appDelegate.dataBasePath UTF8String], &database)==SQLITE_OK){
        
        NSString *sql = [NSString stringWithFormat:@"select * from parametro"];
        if( sqlite3_prepare_v2(database, [sql UTF8String], -1, &sentencia,NULL)==SQLITE_OK){
            
            while(sqlite3_step(sentencia)==SQLITE_ROW) {
                
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] init ];
                NSString *imagen = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sentencia,0)];
                
                [dic setValue:imagen forKey:@"imagen"];
                [imagenes addObject:dic];
            }
        }else {
            NSLog(@"error en la sentencia");
        }
        sqlite3_finalize(sentencia);
    }
    
    else {        NSLog(@"no entro");
        NSLog(@"error de conexion");
    }
    
    sqlite3_close(database);
    
    
    NSInteger cantidad= [imagenes count];
    
    
    
    if(cantidad>0){
              /*
         RootVC *rvc = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"RootVC"];
         [self presentModalViewController:rvc animated:YES];
         
         */
        [self performSegueWithIdentifier:@"2p" sender:self];
        
    }else{
     
        
        [self performSegueWithIdentifier:@"1p" sender:self];    
        
    }

    
    
    
    [super loadView];
}




- (void)viewDidLoad
{
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
