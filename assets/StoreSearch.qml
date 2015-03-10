import bb.cascades 1.2

Page {
    attachedObjects: [
        ComponentDefinition {
            id: resultsPage
            content: StoreSearchResults {}
        }
    ]
    
    Container {
        layout: DockLayout {}
        
        Container { //Vertically-centred set of controls
            layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Center
            topPadding: 50
            rightPadding: topPadding
            bottomPadding: topPadding
            leftPadding: topPadding
            
            CustomButton {
                buttonText: "Find Nearby Stores"
                buttonColour: Color.create("#2C3C2D")
                onClicked: {
                    var page = resultsPage.createObject();
                    navPane.push(page);
                    app.nearbyStores();
                }
            }
            Label {
                text: "-or-"
                textStyle.fontSize: FontSize.Medium
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                topMargin: 50
                bottomMargin: topMargin
                multiline: true
            }
            Container { //Search by Keyword box
                layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                background: Color.create("#2C3C2D")
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Center
                topPadding: 50
                rightPadding: topPadding
                bottomPadding: topPadding
                leftPadding: topPadding
                
                Label {
                    text: "Search by Keyword"
                    textStyle.fontSize: FontSize.XLarge
                    textStyle.color: Color.White
                    multiline: true
                    bottomMargin: 50
                    horizontalAlignment: HorizontalAlignment.Center
                }
                TextField {
                    id: searchField
                    hintText: "e.g. Waterloo, Yonge Street, N5A6W6"
                    horizontalAlignment: HorizontalAlignment.Fill
                    textStyle.color: Color.create("#2C3C2D")
                    focusHighlightEnabled: false
                    input.submitKey: SubmitKey.Search
                    input.onSubmitted: {
                        var page = resultsPage.createObject();
                        navPane.push(page);
                        var query = {};
                        query.q = searchField.text;
                        app.queryStores(query);
                    }
                }
            }
        }
    }
}