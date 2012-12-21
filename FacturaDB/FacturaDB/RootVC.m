//
//  RootVC.m
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 14/12/12.
//  Copyright (c) 2012 Softmark. All rights reserved.
//

#import "RootVC.h"
#import <sqlite3.h>
#import "AppDelegate.h"
//#import "StorSegue.h"
#import "aViewController.h"
@interface RootVC ()

@end
int MIN_HEIGTH=  360;
int MIN_WIDHT =260;


@implementation RootVC
@synthesize scroll;
@synthesize pagina;
@synthesize tabla;
@synthesize viewPrincipal;
@synthesize VERIFICADOR_MARCADO;
@synthesize IMAGEN_MARCADA;

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scroll.contentOffset.x / scroll.frame.size.width;
    NSLog(@"la pagina es %i",page);
    pagina.currentPage=page;

}

- (void)loadView
{    
    [super loadView];
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

-(void) ampliarImagen:(id) sender {
    UIButton *btn = (UIButton *) sender;  
/*
    CGRect frame=scroll.frame;
    int page=pagina.currentPage;
    frame.origin.x=frame.size.width * page;
    frame.origin.y=0;
*/
//    [scroll scrollRectToVisible:frame animated:YES];    
btn.frame = CGRectMake(0,0, 380,460);
//btn.imageView.frame= CGRectMake(0,0, 380,460);
}

-(IBAction)animateView:(id)sender{
    NSLog(@"pass here");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:0.8];
    [UIView commitAnimations];
}



-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"mejor es pasar por aqui ");
}

- (void)viewDidLoad
{
    
    
//    self.view.backgroundColor = [UIColor blackColor];
    [super viewDidLoad];

    CGFloat lComponents[4]={0,0,0,1};
        CGColorSpaceRef lColorSpace= CGColorSpaceCreateDeviceRGB();

//    self.scroll.layer.opacity=0.5;
    self.viewPrincipal.layer.borderWidth=8;
    self.viewPrincipal.layer.shadowOpacity=1.2;
    self.viewPrincipal.layer.cornerRadius=8;
    self.viewPrincipal.backgroundColor=[UIColor clearColor];
    self.viewPrincipal.opaque=NO;

    self.viewPrincipal.layer.borderColor= [[UIColor colorWithWhite:0.8 alpha:0.8   ] CGColor];
    self.viewPrincipal.layer.borderColor = CGColorCreate(lColorSpace,lComponents);
    CGColorSpaceRelease(lColorSpace);   
    [scroll setBackgroundColor:[UIColor blackColor]];
    scroll.indicatorStyle = UIScrollViewIndicatorStyleBlack;

    for(int i=1;i<7;i++){
        CGRect medidas= CGRectMake((i-1)*360,0, 360, 460);
        CGRect medidaImagen =CGRectMake(50, 50, MIN_WIDHT, MIN_HEIGTH);
        
        UIView *vista = [[UIView alloc] initWithFrame:medidas];
        
        UIImageView *images= [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpeg",i ] ]]; 
            
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Clickear:)];
        [images addGestureRecognizer:singleTap];
        [images setMultipleTouchEnabled:YES];
        [images setUserInteractionEnabled:YES];
        [images setAccessibilityIdentifier:[NSString stringWithFormat:@"%i.jpeg",i]];

        
        [images setFrame:medidaImagen];
      //  vista.backgroundColor=[UIColor greenColor];
        
        [vista addSubview:images];
        
//        UIImage *imagenInicial = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpeg",i ]];
  //      [imagenInicial drawInRect:];
    //    UIImage *imagenFinal = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpeg",i ]];
        
          //      [imagenFinal drawInRect:CGRectMake((i-1)*380+50, 50, 380, 460)];
    //    UIButton *boton = [UIButton buttonWithType:UIButtonTypeRoundedRect] ;
       // 
        
      //  [boton setTitle:@"BOTOOOON" forState:UIControlStateNormal];
//        boton.frame= CGRectMake(0, 0, 280, 360);

       // boton.frame = CGRectMake((i-1)*380+50, 50, 280, 360);
        
        
        /*
        [boton setImage:imagenInicial forState:UIControlStateNormal];
        [boton setImage:imagenFinal forState:UIControlStateSelected ];
        [boton addTarget:self action:@selector(ampliarImagen:) forControlEvents:UIControlEventTouchUpInside];
        */
        
    //    [images addSubview:boton];
       
//        [scroll addSubview:images];
        [scroll addSubview:vista];
    }
    
    scroll.delegate =self;
    scroll.contentSize = CGSizeMake(360*6, 460);
    scroll.pagingEnabled=YES;
    
    
    pagina.numberOfPages = 6;
    pagina.currentPage=0;
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)Clickear:(UITapGestureRecognizer *) gesture{
    [UIImageView beginAnimations:nil context:NULL];
    [UIImageView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIImageView setAnimationDuration:0.8];
    UIView *tapp = [gesture.view hitTest:[gesture locationInView:gesture.view] withEvent:nil];
    UIImageView *imagen = (UIImageView *) tapp;
    CGSize original =imagen.bounds.size;
    CGRect originalRecta = CGRectMake(50, 50, MIN_WIDHT, MIN_HEIGTH);
    CGSize medidaImagen =CGSizeMake(340, 440);
    CGRect  medidaRecta = CGRectMake(0, 0, medidaImagen.width, medidaImagen.height);
    if(CGSizeEqualToSize(original, medidaImagen)){        
          [imagen setFrame:originalRecta];
                pagina.hidden=FALSE;
        VERIFICADOR_MARCADO=FALSE;
        IMAGEN_MARCADA=nil;
        
    }else{
          [imagen setFrame:medidaRecta];          
        pagina.hidden=TRUE;

        self.VERIFICADOR_MARCADO = TRUE;
        IMAGEN_MARCADA= [imagen accessibilityIdentifier];

    }
    [UIImageView commitAnimations];
    [UIPageControl beginAnimations:nil context:NULL];
    [UIPageControl setAnimationCurve:UIViewAnimationCurveLinear];
    [UIPageControl setAnimationDuration:0.8];
    [UIPageControl commitAnimations];    
    NSLog(@"el view tocado es %@",[tapp class]);
}
- (void)viewDidUnload
{
    [self setScroll:nil];
    [self setPagina:nil];
    [self setTabla:nil];
    [self setViewPrincipal:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    
    if ([segue.identifier isEqualToString:@"ImagenSeque"]) {
        return;
        if(!VERIFICADOR_MARCADO){
            
            
            UIAlertView *alerta = [[UIAlertView alloc] init] ;
            [alerta setTitle:@"Mensaje"];
            [alerta setMessage:[NSString stringWithFormat:@"Debe seleccionar una imagen "]];
            [alerta addButtonWithTitle:@"OK"];
            [alerta show];
            
        }
    }
    
     
    
}


-(IBAction)pulsarBotonInsertar:(id)sender{
    NSLog(@"paspor boton insertar");

    
    
    
   // aViewController  *mivc = [[aViewController alloc] init ];
   // [self presentViewController:mivc animated:YES completion:nil  ];
    
//    [mivc setDelegate:self];
 //   [self.navigationController pushViewController:mivc animated:YES];
  //  [mivc.navigationItem setTitle:@"Main"];
    

    
    if(!VERIFICADOR_MARCADO){
    
        
        UIAlertView *alerta = [[UIAlertView alloc] init] ;
        [alerta setTitle:@"Mensaje"];
        [alerta setMessage:[NSString stringWithFormat:@"Debe seleccionar una imagen "]];
        [alerta addButtonWithTitle:@"OK"];
        [alerta show];
    
        
        return;
        
        
    }
    
    
    //si una de las imagenes tiene las siguientes caracteristicas
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    sqlite3 *database;
    sqlite3_stmt *sentencia;
    if(sqlite3_open([appDelegate.dataBasePath UTF8String], &database)==SQLITE_OK){
      NSString *sql=  [NSString stringWithFormat:@"insert into parametro (\"imagen\") values (\"%@\")",self.IMAGEN_MARCADA];
        if(sqlite3_prepare_v2(database, [sql UTF8String], -1, &sentencia, NULL)==SQLITE_OK){

            while(sqlite3_step(sentencia)==SQLITE_ROW){
                NSLog(@"insertando");
            }
        }else{
            NSLog(@"error en la creacion del insert");
        }
        sqlite3_finalize(sentencia);
    }else{
    
        NSLog(@"No se ha podido abrir la BD");
    }
    sqlite3_close(database);
   
}

- (IBAction)clickPageControl:(id)sender {
    CGRect frame=scroll.frame;
    int page=pagina.currentPage;
    frame.origin.x=frame.size.width * page;
    frame.origin.y=0;
    
    [scroll scrollRectToVisible:frame animated:YES];
}
@end
