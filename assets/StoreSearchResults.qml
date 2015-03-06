import bb.cascades 1.2

Page {
    attachedObjects: [
        ComponentDefinition {
            id: detailsPage
            content: StoreDetails {}
        }
    ]
    
    Container {
        layout: DockLayout {}
        background: Color.create("#BBCACB")
        
        Container {
            layout: StackLayout { orientation: LayoutOrientation.TopToBottom }
            
            Label {
                text: "No results"
                textStyle.fontSize: FontSize.XLarge
                visible: listView.dataModel.empty
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Top
            }
            ListView {
                id: listView                
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
                                status: itemContainer.ListItem.view.status(ListItemData);
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
                function status(data) {
                    if (data.distance_in_meters) {
                        return data.distance_in_meters / 1000 + "km";
                    }
                }
            }
        }
    }
}
