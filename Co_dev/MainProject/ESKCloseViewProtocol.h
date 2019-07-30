//
//  ESKCloseViewProtocol.h
//  MainProject
//
//  Created by Gagik on 21/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKCloseDraggableViewDelegate <NSObject>

/**
 Tells to delegate that View is Dragging

 @param translation CGPoint from start of dragging point
 */
- (void)closeViewDragged:(CGPoint)translation;

/**
 Tells to delegate that user end pressing view
 */
- (void)draggingDidEnd;

@end
