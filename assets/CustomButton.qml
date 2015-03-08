import bb.cascades 1.2

Container {
    id: container
    property alias buttonText: label.text
    property alias buttonColour: container.background
    signal clicked()
    
    topPadding: 50
    rightPadding: topPadding
    bottomPadding: topPadding
    leftPadding: topPadding
    bottomMargin: 50
    horizontalAlignment: HorizontalAlignment.Fill
    gestureHandlers: [
        TapHandler {
            onTapped: {
                clicked();
            }
        }
    ]
    
    Label {
        id: label
        textStyle.fontSize: FontSize.XLarge
        textStyle.color: Color.White
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
    }
}
