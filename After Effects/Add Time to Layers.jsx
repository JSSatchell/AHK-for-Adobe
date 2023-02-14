// JSSatchell Media 2023

// Adds one second to the beginning and end of all selected layers

var comp = app.project.activeItem;
var layers = comp.selectedLayers;
        
app.beginUndoGroup("Add 1s Buffer");

for(var i = 0; i < layers.length; i++) {
   addTime = 1;
   newIn = layers[i].inPoint - addTime;
   newOut = layers[i].outPoint + addTime;
   layers[i].inPoint = newIn;
   layers[i].outPoint = newOut;
}

app.endUndoGroup();
