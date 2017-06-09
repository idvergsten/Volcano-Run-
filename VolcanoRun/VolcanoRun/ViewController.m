
//
//  OpenGLES_Ch3_1ViewController.m
//  OpenGLES_Ch3_1
//

#import "ViewController.h"
#import "AGLKVertexAttribArrayBuffer.h"
#import "AGLKContext.h"

@implementation VolcanoRunViewController
//@synthesize baseEffect;

/////////////////////////////////////////////////////////////////
// This data type is used to store information for each vertex
//#import "Definitions.h"
/////////////////////////////////////////////////////////////////
// Define vertex data for a triangle to use in example



/////////////////////////////////////////////////////////////////
// Called when the view controller's view is loaded
// Perform initialization before the view is asked to draw
- (void)viewDidLoad
{
    
    self.leftSwipt = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handlesSwipes:)];
    self.rightSwipt = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handlesSwipes:)];
    self.upSwipt = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handlesSwipes:)];
    self.downSwipt = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handlesSwipes:)];
    
    self.leftSwipt.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipt.direction = UISwipeGestureRecognizerDirectionRight;
    self.upSwipt.direction = UISwipeGestureRecognizerDirectionUp;
    self.downSwipt.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:self.leftSwipt];
    [self.view addGestureRecognizer:self.rightSwipt];
    [self.view addGestureRecognizer:self.upSwipt];
    [self.view addGestureRecognizer:self.downSwipt];
    [super viewDidLoad];
    
    timerInterval = 0.05;
    // Verify the type of view created automatically by the
    // Interface Builder storyboard
    GLKView *view = (GLKView *)self.view;
    NSAssert([view isKindOfClass:[GLKView class]],
             @"View controller's view is not a GLKView");
    
    // Create an OpenGL ES 2.0 context and provide it to the
    // view
    view.context = [[AGLKContext alloc]
                    initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    // Make the new context current
    [AGLKContext setCurrentContext:view.context];
    
    // Create a base effect that provides standard OpenGL ES 2.0
    // shading language programs and set constants to be used for
    // all subsequent rendering
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make(
                                                   1.0f, // Red
                                                   1.0f, // Green
                                                   1.0f, // Blue
                                                   1.0f);// Alpha
    
    // Set the background color stored in the current context
    ((AGLKContext *)view.context).clearColor = GLKVector4Make(
                                                              0.0f, // Red
                                                             0.0f, // Green
                                                              0.0f, // Blue
                                                              1.0f);// Alpha
    
    
    _volcanoMan = [[VolcanoMan alloc]initWithBaseEffect:self.baseEffect];
    // Setup texture
    CGImageRef imageRef =
    [[UIImage imageNamed:@"Grid.gif"]CGImage];//leaves.gif"] CGImage];
    
    GLKTextureInfo *textureInfo = [GLKTextureLoader
                                   textureWithCGImage:imageRef
                                   options:nil
                                   error:NULL];
    
    self.baseEffect.texture2d0.name = textureInfo.name;
    self.baseEffect.texture2d0.target = textureInfo.target;
    //_timer = [[NSTimer alloc]init];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timerInterval
                                                  target:self
                                                selector:@selector(onTick)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)handlesSwipes:(UISwipeGestureRecognizer*)sender{
    
    if(sender.direction == UISwipeGestureRecognizerDirectionUp)
    {
        [_volcanoMan changeState:(UP)];
        NSLog(@"swiped down");
    }
    if(sender.direction == UISwipeGestureRecognizerDirectionDown)
    {
        [_volcanoMan changeState:(DOWN)];
        NSLog(@"swiped down");
    }
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [_volcanoMan changeState:(LEFT)];
        NSLog(@"swiped down");
    }
    if(sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [_volcanoMan changeState:(RIGHT)];
        NSLog(@"swiped down");
    }
}

-(void)onTick
{
    //set move in y direction for pacman
    [_volcanoMan onTick];
}

-(void)update{
    
    float aspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 0.1f, 100.0f);
    
    self.baseEffect.transform.projectionMatrix = projectionMatrix;
    
    //setup the translation matrix for pacman
    [_volcanoMan update];
    // Compute the model view matrix for the object rendered with GLKit
    
    
}
/////////////////////////////////////////////////////////////////
// GLKView delegate method: Called by the view controller's view
// whenever Cocoa Touch asks the view controller's view to
// draw itself. (In this case, render into a frame buffer that
// shares memory with a Core Animation Layer)
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.baseEffect prepareToDraw];
    
    // Clear back frame buffer (erase previous drawing)
    [(AGLKContext *)view.context clear:GL_COLOR_BUFFER_BIT];
    
    //draw pacman
    [_volcanoMan render];
    
}
//- (void)slideToLeftWithGestureRecognizer:(id)sender {
//  [self performSegueWithIdentifier:@"myConnectionIdentifierHere"]
//}

/////////////////////////////////////////////////////////////////
// Called when the view controller's view has been unloaded
// Perform clean-up that is possible when you know the view
// controller's view won't be asked to draw again soon.
- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.timer invalidate];
    // Make the view's context current
    GLKView *view = (GLKView *)self.view;
    [AGLKContext setCurrentContext:view.context];
    
    // Delete buffers that aren't needed when view is unloaded
    
    
    // Stop using the context created in -viewDidLoad
    ((GLKView *)self.view).context = nil;
    [EAGLContext setCurrentContext:nil];
}

- (IBAction)Swipe:(id)sender {
    NSLog(@"");
}
- (IBAction)Swipe2:(id)sender {
    
}
@end
