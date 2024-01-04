// The MIT License (MIT)
//
// Copyright (c) 2022 Alexey Bukhtin (github.com/buh).
//

import SwiftUI

struct HandleView: View {
    
    @Environment(\.compactSliderSecondaryAppearance) var secondaryAppearance
    
    @State var width: CGFloat
    let offsetX: CGFloat
    let isFocused: Bool
    
    var body: some View {
        Rectangle()
            .fill(isFocused ? Color.accentColor : secondaryAppearance.handleColor)
            .frame(width: width)
            .offset(x: offsetX)
//            .gesture(
//                  
//                
////                LongPressGesture(minimumDuration: 0.5)
////                    .onChanged({ changed in
////                        withAnimation {
////                                            self.width  = self.width * 2
////                                        }
////                    })
////                    .onEnded( { changed in
////                        withAnimation {
////                            self.width  = self.width * 0.5
////                                        }
////                    })
//            )

    }
}

extension CompactSlider {
    func progressHandleView(_ progress: Double, size: CGSize) -> some View {
        Group {
            if handleVisibility.width > 0 {
                HandleView(
                    width: handleVisibility.width,
                    offsetX: (size.width - handleVisibility.width) * (progress - 0.5),
                    isFocused: isHovering || isDragging
                )
            }
        }
    }
}
