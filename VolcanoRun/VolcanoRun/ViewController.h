//
//  OpenGLES_Ch3_1ViewController.h
//  OpenGLES_Ch3_1
//

#import <GLKit/GLKit.h>
#import "VolcanoMan.h"
//@class AGLKVertexAttribArrayBuffer;


@interface VolcanoRunViewController : GLKViewController
{
    GLKMatrix4 _modelViewMatrix;
    double timerInterval ;
    VolcanoMan* _volcanoMan;
}
@property (nonatomic, strong)UISwipeGestureRecognizer* leftSwipt;
@property (nonatomic, strong)UISwipeGestureRecognizer* rightSwipt;
@property (nonatomic, strong)UISwipeGestureRecognizer* upSwipt;
@property (nonatomic, strong)UISwipeGestureRecognizer* downSwipt;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) GLKBaseEffect
*baseEffect;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipey;
//- (IBAction)Swipe2:(id)sender;




@end
