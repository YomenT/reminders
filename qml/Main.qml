import QtQuick 2.7
import QtQuick.Controls 2.7
import Lomiri.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'reminders.yomen'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    // Hardcoded data model for testing
    ListModel {
        id: reminderModel
        ListElement {
            dateSection: "Today"
            iconSource: "images/today-icon.png"
            title: "Meeting with team"
            description: "Discuss project updates"
            timeLabel: "3:00 PM"
        }
        ListElement {
            dateSection: "Tomorrow"
            iconSource: "images/tomorrow-icon.png"
            title: "Dentist Appointment"
            description: "Teeth cleaning session that takes very very very very very very very very long."
            timeLabel: "All Day"
        }
        // Add more ListElements as needed
    }

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('Reminders')
            // ... header configuration
        }

        // Correct the ListView's anchoring
        ListView {
            id: remindersList
            anchors.top: header.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            clip: true
            contentY: 0
            model: reminderModel

            delegate: Item {
                width: parent.width
                height: column.height + units.gu(2)

                Column {
                    id: column
                    width: parent.width
                    spacing: units.gu(1)

                    Rectangle {
                        width: parent.width
                        height: units.gu(4)
                        color: "lightgrey"

                        Label {
                            text: dateSection
                            anchors.centerIn: parent
                            font.bold: true
                        }
                    }

                    // Use Row instead of RowLayout for simplicity
                    Row {
                        spacing: units.gu(2)
                        
                        // Placeholder for the icon
                        Label {
                            text: "Img"
                            width: units.gu(5)
                            height: units.gu(5)
                            color: "blue" // Temporary: Indicates where the icon would be
                        }

                        // Column for the title and description
                        Column {
                            spacing: units.gu(0.5)
                            width: parent.width * 0.6 // Increase this to give more space to title and description

                            Text { 
                                text: title
                                elide: Text.ElideRight
                                width: parent.width
                            }
                            Text { 
                                text: description
                                color: "#505050"
                                elide: Text.ElideRight
                                width: parent.width
                            }
                        }

                        // Time label that fills the remaining space
                        Text {
                            text: timeLabel
                            width: parent.width * 0.15 // Decrease this to shift the times to the right
                            elide: Text.ElideRight
                            horizontalAlignment: Text.AlignLeft
                            font.pixelSize: units.gu(1.2)
                        }
                    }
                }
            }
        }
    }
}