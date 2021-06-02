//
//  ResidentThreadTestView.m
//  VCode
//
//  Created by fk on 2021/4/17.
//

#import "ResidentThreadTestView.h"

@interface ResidentThreadTestView()

@property (nonatomic, strong) NSThread *thread;
        
@end

@implementation ResidentThreadTestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadEntry) object:nil];
        [self.thread start];
    }
    return self;
}

- (void)threadEntry
{
    @autoreleasepool {
        NSMachPort *port = [[NSMachPort alloc] init];
        [[NSRunLoop currentRunLoop] addPort:port forMode:NSDefaultRunLoopMode];
        
        while (!_isStop) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        NSLog(@" %s ", __func__);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self performSelector:@selector(action) onThread:self.thread withObject:nil waitUntilDone:NO];
    
}

- (void)action
{
    NSLog(@" ResidentThreadTestView action completed in %s ", __func__);
}


@end
