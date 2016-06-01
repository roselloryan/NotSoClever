//
//  main.m
//  NotSoClever


#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *line = @"4 3 2 1 | 1";
        
        NSArray *sepArray = [line componentsSeparatedByString: @" | "];
        
        NSMutableArray *numbersMutArray = [[[sepArray objectAtIndex:0] componentsSeparatedByString:@" "] mutableCopy];
        
        NSInteger requestedCount = [[sepArray objectAtIndex:1] integerValue];
        NSInteger passesMade = 0;
        
        
        NSInteger mutArrayCount = numbersMutArray.count;
        
        
        while (passesMade < requestedCount) {
            
            NSInteger i = 0;
            for (i = 0; i < mutArrayCount - 1; i++) {
                
                NSString *numStringAtI = [numbersMutArray objectAtIndex:i];
                NSString *numStringAtIPlusOne = [numbersMutArray objectAtIndex:i + 1];
                
                if ([numStringAtI integerValue] > [numStringAtIPlusOne integerValue]) {
                    
                    [numbersMutArray removeObjectAtIndex: i + 1];
                    [numbersMutArray insertObject:numStringAtIPlusOne atIndex:i];
                    passesMade ++;
                    break;
                }
            }
        }
        
        NSMutableString *solutionString = [[NSMutableString alloc]init];
        
        for (NSString *numString in numbersMutArray) {
            [solutionString appendFormat:@"%@ ", numString];
        }
        
        NSRange lastSpaceRange = NSMakeRange(solutionString.length - 1, 1);
        [solutionString deleteCharactersInRange:lastSpaceRange];
        
        NSLog(@"solutionString: %@", solutionString);
    }
    return 0;
}
