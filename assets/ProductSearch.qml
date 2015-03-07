import bb.cascades 1.2

Page {
    attachedObjects: [
        ComponentDefinition {
            id: resultsPage
            content: ProductSearchResults {}
        }
    ]
    
    Container {
        layout: DockLayout {}
        background: Color.create("#BBCACB")
        
        Container { //Vertically-centred set of controls
            layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Center
            topPadding: 50
            rightPadding: topPadding
            bottomPadding: topPadding
            leftPadding: topPadding
            
            Container { //Search by Keyword box
                layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
                background: Color.create("#4C3838")
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
                    bottomMargin: 50
                    horizontalAlignment: HorizontalAlignment.Center
                    multiline: true
                }
                TextField {
                    id: searchField
                    hintText: "e.g. vodka, Ontario, VQA"
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.color: Color.create("#2C3C2D")
                    focusHighlightEnabled: false
                    input.submitKey: SubmitKey.Search
                    input.onSubmitted: {
                        var page = resultsPage.createObject();
                        navPane.push(page);
                        var query = {};
                        query.q = searchField.text;
                        app.query("products", query);
                    }
                }
            }
        }
    }
}