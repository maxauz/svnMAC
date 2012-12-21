//
//  StorSegue.m
//  FacturaDB
//
//  Created by Rafael Delgado Aparicio on 19/12/12.
//  Copyright (c) 2012 Softmark. All rights reserved.
//

#import "StorSegue.h"
#import "RootVC.h"
@implementation StorSegue
{
}
//-(void) mostrarImagenes{
-(void) perform{

    UIViewController *a = (UIViewController *) self.sourceViewController;
    UIViewController *b=  (UIViewController *) self.destinationViewController;
    NSString *origen;
    NSString *destino;

     origen=  [NSString stringWithFormat:@"%@",[a class]];
     destino=  [NSString stringWithFormat:@"%@",[b class]];
        NSLog(@"%@",origen);
            NSLog(@"%@",destino);
    if([origen isEqualToString:@"RootVC"] && [destino isEqualToString:@"aViewController"] ){
                                              
        RootVC *root = (RootVC *) a;
       
        if(!root.VERIFICADOR_MARCADO){
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
            NSString *sql=  [NSString stringWithFormat:@"insert into parametro (\"imagen\") values (\"%@\")",root.IMAGEN_MARCADA];
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
        
        
        
        [UIView transitionFromView:a.view toView:b.view duration:1.8 options:UIViewAnimationOptionTransitionFlipFromLeft completion:NULL];    
        
        
    }else if ([origen isEqualToString:@"InicialVC"] && [destino isEqualToString:@"RootVC"] ) {
       
        
    }
    //root
    //indent
    
  //
    
    /*
     
    //esto es cuando uno navigationController 
     
    [UIView transitionWithView:a.navigationController.view duration:1.8 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [a.navigationController pushViewController:b animated:NO];
    } completion:NULL ];
    */
    
       [UIView transitionFromView:a.view toView:b.view duration:0 options:nil completion:NULL];    
    
    
}

@end
