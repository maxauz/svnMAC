//
//  aViewController.m
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 19/12/12.
//  Copyright (c) 2012 Softmark. All rights reserved.
//

#import "aViewController.h"
#import "AppDelegate.h"
@interface aViewController (){
NSMutableArray *imagenes;
}

@end

@implementation aViewController
@synthesize aImg;


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
 

    [super loadView];
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

- (void)viewDidLoad
{
   
   
    imagenes=[[NSMutableArray alloc] init];
    
/*
 //cargar imagen programaticamente 
 
    UIImage *im = [UIImage imageNamed:@"6.jpeg"];    
    aImagen = [[UIImageView alloc] initWithImage:im];
    aImagen.frame=CGRectMake(100, 100, 100, 100);
    [self.view addSubview:aImagen];    
 */   
    



    
    [super viewDidLoad];
   [self mostrarImagenes];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) mostrarImagenes{
    
    
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

    

    NSMutableDictionary *diction =(NSMutableDictionary *)[imagenes objectAtIndex:0];

UIImage *a = [UIImage imageNamed:[diction objectForKey:@"imagen"]];
[self.aImg setImage:a];
    
    
}


- (void)viewDidUnload
{
  
    [self setAImg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
