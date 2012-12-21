//
//  RootVC.h
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 14/12/12.
//  Copyright (c) 2012 Softmark. All rights reserved.
//
#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface RootVC : UIViewController <UIScrollViewDelegate>{

}


@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIPageControl *pagina;
@property (weak, nonatomic) IBOutlet UITableView *tabla;
@property (weak, nonatomic) IBOutlet UIView *viewPrincipal;

@property (nonatomic,assign) BOOL *VERIFICADOR_MARCADO  ;
@property (nonatomic,assign) NSString *IMAGEN_MARCADA  ;
-(IBAction)pulsarBotonInsertar:(id)sender;
-(IBAction)clickPageControl:(id)sender;
-(void) ampliarImagen:(id) sender;
//-(void) ampliarImagen:(UIButton*) sender;
@end
