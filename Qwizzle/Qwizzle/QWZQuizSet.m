//
//  QWZQuizSet.m
//  Qwizzle
//
//  Created by Team Qwizzle on 3/22/13.
//  Copyright (c) 2013 Florida Tech. All rights reserved.
//

#import "QWZQuizSet.h"

@implementation QWZQuizSet

@synthesize quizSetID;
@synthesize title;
@synthesize creator;
@synthesize creatorID;
@synthesize requestID;
@synthesize dateCreated;

// The designated initializer
- (id)initWithTitle:(NSString *)t andID:(NSInteger)ID
{
    // Always call the superclass's designated initializer
    self = [super init];
    
    // Did the superclass's designated initializer succeed?
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *userName = [defaults objectForKey:@"user_name"];
        
        allQuizzes = [[NSMutableArray alloc] init];
        title = [t copy];
        dateCreated = [[NSDate alloc] init]; // Initialize the date this quiz was taken
        creator = [userName copy]; // Store creator, which is the username
        quizSetID = ID;
    }
    
    // Return the address of the newly initialized object
    return self;
}

- (id)initWithTitle:(NSString *)t
{
    // Call the designated initializer with a default value
    return [self initWithTitle:t andID:-1];
}

- (id)init
{
    // Call the designated initializer with a default value
    return [self initWithTitle:@"Default Title"];
}

// Get all questions in the quizset
- (NSArray *)allQuizzes
{
    return allQuizzes;
}

// Add a new question
- (void)addQuiz:(QWZQuiz *)q
{
    [allQuizzes addObject:q];
}

// Remove a question
- (void)removeQuiz:(QWZQuiz *)q
{
    [allQuizzes removeObjectIdenticalTo:q];
}

- (void)removeAllQuizzes
{
    [allQuizzes removeAllObjects];
}

// Move a quiz from an index to another index
- (void)moveQuizAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    
    // Get pointer to object being moved so we can re-insert it
    QWZQuiz *quiz = [allQuizzes objectAtIndex:from];
    
    // Remove quiz from array
    [allQuizzes removeObjectAtIndex:from];
    
    // Insert quiz in array at the new location
    [allQuizzes insertObject:quiz atIndex:to];
}

@end
