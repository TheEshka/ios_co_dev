//
//  ESKCloseViewProtocol.h
//  MainProject
//
//  Created by Gagik on 21/07/2019.
//  Copyright © 2019 Gagik Avetisyan. All rights reserved.
//

@protocol ESKCloseDraggableViewDelegate <NSObject>

- (void)closeViewDragged:(CGPoint)translation;
- (void)draggingDidEnd;

@end
