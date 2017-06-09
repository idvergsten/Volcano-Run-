//
//  MsPacman.m
//  OpenGLES_Ch3_1
//
//  Created by David Dvergsten on 10/31/16.
//
//
#import "VolcanoMan.h"
#import <Foundation/Foundation.h>
#import "Definitions.h"
@implementation VolcanoMan

//draw pman up animation/////////////
//static const SceneVertex verticesMouthUp[] =
//{
//    {{-0.1f, -0.1f, 0.0f}, {0.0f, 0.125f}}, // lower left corner
//    {{ 0.1f, -0.1f, 0.0f}, {0.125f, 0.125f}}, // lower right corner
//    {{-0.1f,  0.1f, 0.0f}, {0.0f, 0.0f}}, // upper left corner
//    {{0.1f,  0.1f, 0.0f}, {0.125f, 0.0f}},
//};
//
//static const SceneVertex verticesMouthWideUp[] =
//{
//    {{-0.1f, -0.1f, 0.0f}, {0.125f, 0.125f}}, // lower left corner
//    {{ 0.1f, -0.1f, 0.0f}, {0.250f, 0.125f}}, // lower right corner
//    {{-0.1f,  0.1f, 0.0f}, {0.125f, 0.0f}}, // upper left corner
//    {{0.1f,  0.1f, 0.0f}, {0.250f, 0.0f}},
//};
//
//static const SceneVertex verticesMouthShutUp[] =
//{
//    {{-0.1f, -0.1f, 0.0f}, {0.250f, 0.125f}}, // lower left corner
//    {{ 0.1f, -0.1f, 0.0f}, {0.375f, 0.125f}}, // lower right corner
//    {{-0.1f,  0.1f, 0.0f}, {0.250f, 0.0f}}, // upper left corner
//    {{0.1f,  0.1f, 0.0f}, {0.375f, 0.0f}},
//};
static const SceneVertex verticesMouthUp[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.0f, 0.250f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.125f, 0.250f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.0f, 0.125f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.125f, 0.125f}},
};

static const SceneVertex verticesMouthWideUp[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.125f, 0.250f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.250f, 0.250f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.125f, 0.125f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.250f, 0.125f}},
};

static const SceneVertex verticesMouthShutUp[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.250f, 0.250f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.375f, 0.250f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.250f, 0.125f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.375f, 0.125f}},
};

//draw pman down animation/////////////
static const SceneVertex verticesMouthDown[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.375f, 0.125f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.500f, 0.125f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.375f, 0.0f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.500f, 0.0f}},
    
};

static const SceneVertex verticesMouthWideDown[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.500, 0.125f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.625f, 0.125f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.500f, 0.0f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.625f, 0.0f}},
    
};

static const SceneVertex verticesMouthShutDown[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.625, 0.125f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.750f, 0.125f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.625f, 0.0f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.750f, 0.0f}},
};

//draw pman left animation/////////////
static const SceneVertex verticesMouthLeft[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.750, 0.125f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.875f, 0.125f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.750f, 0.0f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.875f, 0.0f}},
    
};

static const SceneVertex verticesMouthWideLeft[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.875, 0.125f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {1.0f, 0.125f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.875f, 0.0f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {1.0f, 0.0f}},
    
};

static const SceneVertex verticesMouthShutLeft[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.0f, 0.250f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.125f, 0.250f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.0f, 0.125f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.125f, 0.125f}},
};

//draw pman right animation/////////////
static const SceneVertex verticesMouthRight[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.125f, 0.250f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.250f, 0.250f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.125f, 0.125f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.250f, 0.125f}},
};

static const SceneVertex verticesMouthWideRight[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.250f, 0.250f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.375f, 0.250f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.250f, 0.125f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.375f, 0.125f}},
};

static const SceneVertex verticesMouthShutRight[] =
{
    {{-0.1f, -0.1f, 0.0f}, {0.375f, 0.250f}}, // lower left corner
    {{ 0.1f, -0.1f, 0.0f}, {0.500f, 0.250f}}, // lower right corner
    {{-0.1f,  0.1f, 0.0f}, {0.375f, 0.125f}}, // upper left corner
    {{0.1f,  0.1f, 0.0f}, {0.500f, 0.125f}},
};


-(void)update{
    // _modelViewMatrix = GLKMatrix4MakeTranslation(0.0f, _moveY, -3.5f);
    
    self.baseEffect.transform.modelviewMatrix = _modelViewMatrix;
}

-(void)renderUp{
    if(_frameCounter == 0)
    {
        [self drawWithBuffer:_vertexBufferMouthShutUp];
    }
    else if(_frameCounter == 1 || _frameCounter == 3)
    {
        [self drawWithBuffer:_vertexBufferMouthUp];
    }
    else if(_frameCounter == 2)
    {
        [self drawWithBuffer:_vertexBufferMouthWideUp];
    }
    
    
}

-(void)renderDown{
    [self renderUp];
//    if(_frameCounter == 0)
//    {
//        [self drawWithBuffer:_vertexBufferMouthShutDown];
//    }
//    else if(_frameCounter == 1 || _frameCounter == 3)
//    {
//        [self drawWithBuffer:_vertexBufferMouthDown];
//    }
//    else if(_frameCounter == 2)
//    {
//        [self drawWithBuffer:_vertexBufferMouthWideDown];
//    }
}

-(void)renderLeft{
    [self renderUp];
//    if(_frameCounter == 0)
//    {
//        [self drawWithBuffer:_vertexBufferMouthShutLeft];
//    }
//    else if(_frameCounter == 1 || _frameCounter == 3)
//    {
//        [self drawWithBuffer:_vertexBufferMouthLeft];
//    }
//    else if(_frameCounter == 2)
//    {
//        [self drawWithBuffer:_vertexBufferMouthWideLeft];
//    }
    
}

-(void)renderRight{
    [self renderUp];
//    if(_frameCounter == 0)
//    {
//        [self drawWithBuffer:_vertexBufferMouthShutRight];
//    }
//    else if(_frameCounter == 1 || _frameCounter == 3)
//    {
//        [self drawWithBuffer:_vertexBufferMouthRight];
//    }
//    else if(_frameCounter == 2)
//    {
//        [self drawWithBuffer:_vertexBufferMouthWideRight];
//    }
    
}
-(void)render{
    if(_state == UP)
        [self renderUp];
    else if(_state == DOWN)
        [self renderDown];
    else if(_state == LEFT)
        [self renderLeft];
    else
        [self renderRight];
    
}
-(void)drawWithBuffer:(AGLKVertexAttribArrayBuffer*)buffer{
    [buffer prepareToDrawWithAttrib:GLKVertexAttribPosition
                numberOfCoordinates:3
                       attribOffset:offsetof(SceneVertex, positionCoords)
                       shouldEnable:YES];
    [buffer prepareToDrawWithAttrib:GLKVertexAttribTexCoord0
                numberOfCoordinates:2
                       attribOffset:offsetof(SceneVertex, textureCoords)
                       shouldEnable:YES];
    [buffer drawArrayWithMode:GL_TRIANGLE_STRIP
             startVertexIndex:0
             numberOfVertices:4];
}

-(void)onTick
{
    //TODO: UPDATE THE MODELVIEWMATRIX
    if(_state == UP)
        _moveY += 0.05;
    else if(_state == DOWN)
        _moveY -= 0.05;
    else if(_state == LEFT)
        _moveX -= 0.05;
    else if(_state == RIGHT)
        _moveX += 0.05;
    
    _frameCounter++;
    if(_frameCounter == 3)
    {
        _frameCounter = 0;
    }
    
    
    _modelViewMatrix = GLKMatrix4MakeTranslation(_moveX, _moveY, -3.5f);
    
}
-(void)changeState:(enum PMANSTATE)state{
    _state = state;
}
-(id )initWithBaseEffect:(GLKBaseEffect *)baseEffect
{
    if(self = [super init])
    {
        _state = UP;
        _frameCounter = 0;
        _baseEffect = baseEffect;
        _modelViewMatrix = GLKMatrix4MakeTranslation(0.0f, 0.00, -3.5f);
        //_modelViewMatrix = glkma
        _moveY = 0.00;
        _moveX = 0.00;
        // Create vertex buffer containing vertices to draw
        //pman up animations
        self.vertexBufferMouthUp = [[AGLKVertexAttribArrayBuffer alloc]
                                    initWithAttribStride:sizeof(SceneVertex)
                                    numberOfVertices:sizeof(verticesMouthUp) / sizeof(SceneVertex)
                                    bytes:verticesMouthUp
                                    usage:GL_STATIC_DRAW];
        
        self.vertexBufferMouthWideUp = [[AGLKVertexAttribArrayBuffer alloc]
                                        initWithAttribStride:sizeof(SceneVertex)
                                        numberOfVertices:sizeof(verticesMouthWideUp) / sizeof(SceneVertex)
                                        bytes:verticesMouthWideUp
                                        usage:GL_STATIC_DRAW];
        
        self.vertexBufferMouthShutUp = [[AGLKVertexAttribArrayBuffer alloc]
                                        initWithAttribStride:sizeof(SceneVertex)
                                        numberOfVertices:sizeof(verticesMouthShutUp) / sizeof(SceneVertex)
                                        bytes:verticesMouthShutUp
                                        usage:GL_STATIC_DRAW];
        
        //pman down animations
        self.vertexBufferMouthDown = [[AGLKVertexAttribArrayBuffer alloc]
                                      initWithAttribStride:sizeof(SceneVertex)
                                      numberOfVertices:sizeof(verticesMouthDown) / sizeof(SceneVertex)
                                      bytes:verticesMouthDown
                                      usage:GL_STATIC_DRAW];
        
        self.vertexBufferMouthWideDown = [[AGLKVertexAttribArrayBuffer alloc]
                                          initWithAttribStride:sizeof(SceneVertex)
                                          numberOfVertices:sizeof(verticesMouthWideDown) / sizeof(SceneVertex)
                                          bytes:verticesMouthWideDown
                                          usage:GL_STATIC_DRAW];
        
        self.vertexBufferMouthShutDown = [[AGLKVertexAttribArrayBuffer alloc]
                                          initWithAttribStride:sizeof(SceneVertex)
                                          numberOfVertices:sizeof(verticesMouthShutDown) / sizeof(SceneVertex)
                                          bytes:verticesMouthShutDown
                                          usage:GL_STATIC_DRAW];
        
        //pman left animations
        self.vertexBufferMouthLeft = [[AGLKVertexAttribArrayBuffer alloc]
                                      initWithAttribStride:sizeof(SceneVertex)
                                      numberOfVertices:sizeof(verticesMouthLeft) / sizeof(SceneVertex)
                                      bytes:verticesMouthLeft
                                      usage:GL_STATIC_DRAW];
        
        self.vertexBufferMouthWideLeft = [[AGLKVertexAttribArrayBuffer alloc]
                                          initWithAttribStride:sizeof(SceneVertex)
                                          numberOfVertices:sizeof(verticesMouthWideLeft) / sizeof(SceneVertex)
                                          bytes:verticesMouthWideLeft
                                          usage:GL_STATIC_DRAW];
        
        self.vertexBufferMouthShutLeft = [[AGLKVertexAttribArrayBuffer alloc]
                                          initWithAttribStride:sizeof(SceneVertex)
                                          numberOfVertices:sizeof(verticesMouthShutLeft) / sizeof(SceneVertex)
                                          bytes:verticesMouthShutLeft
                                          usage:GL_STATIC_DRAW];
        
        //pman right animations
        self.vertexBufferMouthRight = [[AGLKVertexAttribArrayBuffer alloc]
                                       initWithAttribStride:sizeof(SceneVertex)
                                       numberOfVertices:sizeof(verticesMouthRight) / sizeof(SceneVertex)
                                       bytes:verticesMouthRight
                                       usage:GL_STATIC_DRAW];
        
        self.vertexBufferMouthWideRight = [[AGLKVertexAttribArrayBuffer alloc]
                                           initWithAttribStride:sizeof(SceneVertex)
                                           numberOfVertices:sizeof(verticesMouthWideRight) / sizeof(SceneVertex)
                                           bytes:verticesMouthWideRight
                                           usage:GL_STATIC_DRAW];
        
        self.vertexBufferMouthShutRight = [[AGLKVertexAttribArrayBuffer alloc]
                                           initWithAttribStride:sizeof(SceneVertex)
                                           numberOfVertices:sizeof(verticesMouthShutRight) / sizeof(SceneVertex)
                                           bytes:verticesMouthShutRight
                                           usage:GL_STATIC_DRAW];
        return self;
    }
    else
        return nil;
}
-(void)viewDidUnload
{
    self.vertexBufferMouthUp = nil;
    self.vertexBufferMouthShutUp = nil;
    self.vertexBufferMouthWideUp = nil;
    //self.vert
}
@end
