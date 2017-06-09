//
//  MsPacman.h
//  OpenGLES_Ch3_1
//
//  Created by David Dvergsten on 10/31/16.
//
//

#ifndef MsPacman_h
#define MsPacman_h
#import <Foundation/Foundation.h>
#import "AGLKVertexAttribArrayBuffer.h"
enum PMANSTATE{RIGHT, LEFT, UP, DOWN, STOP};
@interface VolcanoMan : NSObject
{
    enum PMANSTATE _state;
    GLKMatrix4 _modelViewMatrix;
    double _moveY;
    double _moveX;
    int _frameCounter;
}
-(void)changeState:(enum PMANSTATE)state;
-(void)update;
-(void)render;
-(id)initWithBaseEffect:(GLKBaseEffect*)baseEffect;
-(void)drawOpenWideMouth;
-(void)drawOpenMouth;
-(void)drawClosedMouth;
-(void)onTick;
//pman up animations
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthUp;
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthWideUp;
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthShutUp;

//pman down animations
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthDown;
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthWideDown;
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthShutDown;

//pman left animations
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthLeft;
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthWideLeft;
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthShutLeft;

//pman left animations
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthRight;
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthWideRight;
@property (strong, nonatomic) AGLKVertexAttribArrayBuffer
*vertexBufferMouthShutRight;


@property (strong, nonatomic) GLKBaseEffect
*baseEffect;

@end

#endif /* MsPacman_h */
