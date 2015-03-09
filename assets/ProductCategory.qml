import bb.cascades 1.2

Container {
    id: container
    property alias buttonText: label.text
    signal clicked()
    
    background: Color.create("#4C3838")
    topPadding: 50
    rightPadding: topPadding
    bottomPadding: topPadding
    leftPadding: topPadding
    bottomMargin: 50
    topMargin: 20
    leftMargin: topMargin
    rightMargin: topMargin
    horizontalAlignment: HorizontalAlignment.Fill
    verticalAlignment: VerticalAlignment.Fill
    gestureHandlers: [
        TapHandler {
            onTapped: {
                clicked();
            }
        }
    ]
    layoutProperties: StackLayoutProperties { spaceQuota: 1 }
    
    Label {
        id: label
        textStyle.fontSize: FontSize.Medium
        textStyle.color: Color.White
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        multiline: true
    }
}
