//
//  SerialTest+SerialEnsure.h
//  LearningCodes
//
//  Created by Tony on 2019/7/15.
//  Copyright © 2019 Tony. All rights reserved.
//

#import "SerialTest.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^EnsureCompletion)(void);

@interface SerialTest (SerialEnsure)

- (void)doSomethingWithCompletionHandler:(STCompletion)handler
                            ensureFinish:(EnsureCompletion) ensureHandler;

@end

NS_ASSUME_NONNULL_END
