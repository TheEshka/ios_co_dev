//
//  ESKWallViewController.m
//  MainProject
//
//  Created by Gagik on 27/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

#import "ESKWallViewController.h"
#import "ESKWallCollectionView.h"
#import "ESKWallPostCell.h"
#import "Post.h"

@interface ESKWallViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray<Post *> *posts;
@property (nonatomic, strong) ESKWallCollectionView *wallCollection;

@end

@implementation ESKWallViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wallCollection = [[ESKWallCollectionView alloc] init];
    self.wallCollection.frame = self.view.frame;
    self.collectionView = self.wallCollection;
    self.wallCollection.dataSource = self;
    self.wallCollection.delegate = self;
    [self.collectionView registerClass:[ESKWallPostCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.frame), 1000);
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ESKWallPostCell *cell = (ESKWallPostCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.post = self.posts[indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self.view layoutIfNeeded];
}


@end






//self.posts = [NSMutableArray new];
//Post *post1 = [[Post alloc] init];
//post1.postTitle = @"Co-dev";
//post1.postSubject = @"Mobile application";
//post1.postCreatedTime = @"73 june 2019";
//post1.postDescription = @"Oui, it is. The auteur theory of film making arose in France in the 1940s and it basically means that the director is the driving creative force behind a film. Not every director is an auteur — only the ones who stamp each film with their individual styles. Think Tarantino or Scorsese. And not everyone agrees with this theory — don’t get your screenwriter friend started. But, the client is always right, so you’re ready to start rolling.";
//post1.postAuthor = @"Avetisyan Gagik";
//[self.posts addObject:post1];
//
//Post *post2 = [[Post alloc] init];
//post2.postTitle = @"Suicide squad";
//post2.postSubject = @"web platform";
//post2.postCreatedTime = @"12 june 2019";
//post2.postDescription = @"There’s one problem: “We started making the app, but we’re stumped at how to display the content in a table view,” your client admits. “Our table view cells have to resize (gulp!) dynamically! Can you make it work?”";
//post2.postAuthor = @"Andrey Bulgaru";
//[self.posts addObject:post2];
//
//Post *post3 = [[Post alloc] init];
//post3.postTitle = @"cool story";
//post3.postSubject = @"Mobile application";
//post3.postCreatedTime = @"22 may 2019";
//post3.postDescription = @"UITextView supports the display of text using custom style information and also supports text editing. You typically use a text view to display multiple lines of text, such as when displaying the body of a large text document. This class supports multiple text styles through use of the attributedText property. (Styled text is not supported in versions of iOS earlier than iOS 6.) Setting a value for this property causes the text view to use the style information provided in the attributed string. You can still use the font, textColor, and textAlignment properties to set style attributes, but those properties apply to all of the text in the text view. It’s recommended that you use a text view—and not a UIWebView object—to display both plain and rich text in your app. When the user taps in an editable text view, that text view becomes the first responder and automatically asks the system to display the associated keyboard. Because the appearance of the keyboard has the potential to obscure portions of your user interface, it is up to you to make sure that does not happen by repositioning any views that might be obscured. Some system views, like table views, help you by scrolling the first responder into view automatically. If the ";
//post3.postAuthor = @"Mixas";
//[self.posts addObject:post3];
//
//
//Post *post4 = [[Post alloc] init];
//post4.postTitle = @"Command4";
//post4.postSubject = @"Mamka application";
//post4.postCreatedTime = @"12 june 2019";
//post4.postDescription = @"t text view becomes the first responder and automatically asks the system to display the associated keyboard. Because the appearance of the keyboard has the potential to obscure portions of your user interface, it is up to you to make sure that does not happen by repositioning any views that might be obscured. Some system views, like table views, help you by scrolling the first responder into view automatically. If the ";
//post4.postAuthor = @"Mamka";
//[self.posts addObject:post4];
//
//Post *post5 = [[Post alloc] init];
//post5.postTitle = @"Command5";
//post5.postSubject = @"VK Killer";
//post5.postCreatedTime = @"12 june 2019";
//post5.postDescription = @"Oui, it is. The auteur theory of film making arose in France in the 1940s and it basically means that the director is the driving creative force behind a film. Not every director is an auteur — only the ones who stamp each film with their individual styles. Think Tarantino or Scorsese. And not everyone agrees with this theory — don’t get your screenwriter friend started. But, the client is always right, so you’re ready to start rolling.Oui, it is. The auteur theory of film making arose in France in the 1940s and it basically means that the director is the driving creative force behind a film. Not every director is an auteur — only the ones who stamp each film with their individual styles. Think Tarantino or Scorsese. And not everyone agrees with this theory — don’t get your screenwriter friend started. But, the client is always right, so you’re ready to start rolling.t text view becomes the first responder and automatically asks the system to display the associated keyboard. Because the appearance of the keyboard has the potential to obscure portions of your user interface, it is up to you to make sure that does not happen by repositioning any views that might be obscured. Some system views, like table views, help you by scrolling the first responder into view automatically. If the ";
//post5.postAuthor = @"OSEEEL";
//[self.posts addObject:post5];
