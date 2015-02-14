import bb.cascades 1.2

Page {
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        
        Container {
            id: activityContainer
            objectName: "activityContainer"
            visible: true
            
            horizontalAlignment: HorizontalAlignment.Center
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            
            ActivityIndicator {
                visible: true
                running: true
                preferredHeight: 100
            }
            Label {
                text: "Searching..."
                verticalAlignment: VerticalAlignment.Center
            }
        }
        
        ListView {
            layout: StackListLayout {}
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            dataModel: resultsModel
            
            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    Container {
                        id: itemContainer
                        StandardListItem {
                            title: ListItemData.address_line_1
                            description: ListItemData.city
                            status: ListItemData.distance_in_meters / 1000 + "km"
                        }
                    }
                }
            ]
            
            onTriggered: {
                var data = dataModel.data(indexPath);
                var page = detailsPage.createObject();
                page.data = data;
                navPane.push(page);
            }
        }
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: detailsPage
            content: DetailsPage {}
        }
    ]
}
