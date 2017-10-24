//
//  ViewController.m
//  OSSpinLock(自旋锁)
//
//  Created by soliloquy on 2017/8/8.
//  Copyright © 2017年 soliloquy. All rights reserved.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>
#import <AddressBook/AddressBook.h>
@interface ViewController ()
{
    OSSpinLock spinLock;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self OSSpinLock];
}

// 自旋锁
- (void)OSSpinLock {
    //    spinLock = OS_SPINLOCK_INIT;
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        NSLog(@"线程1 准备上锁");
    //        OSSpinLockLock(&spinLock);
    //        sleep(4);
    //        NSLog(@"线程1");
    //        OSSpinLockUnlock(&spinLock);
    //        NSLog(@"线程1 解锁成功");
    //        NSLog(@"--------------------------------------------------------");
    //
    //    });

    /*
     // iOS 10以后用下面的 解决了优先级反转问题
     //    os_unfair_lock_t unfairLock = &(OS_UNFAIR_LOCK_INIT);
     //    os_unfair_lock_lock(unfairLock);
     //    os_unfair_lock_unlock(unfairLock);
     */
    
    os_unfair_lock_t unfairLock = &(OS_UNFAIR_LOCK_INIT);
    NSLog(@"线程1 准备上锁");
    os_unfair_lock_lock(unfairLock);
    sleep(4);
    NSLog(@"线程1");
    os_unfair_lock_unlock(unfairLock);
    NSLog(@"线程1 解锁成功");
    NSLog(@"--------------------------------------------------------");
}

@end
