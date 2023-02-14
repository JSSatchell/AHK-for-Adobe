// JSSatchell Media 2023

// Shamelessly inspired by Battle Axe's awesome Void scripts which can be found here: https://www.battleaxe.co/void
// Really I just missed the feature of Turbo Layers to create Solids and Adjustment Layers that were the same length as the selected layers so I took it as a scripting challenge to build my own toolkit.

// Zing is my version of a new Solid, or Battle Axe's Volume

var comp = app.project.activeItem;
var layers = comp.selectedLayers;
var allLayers = comp.layers;

app.beginUndoGroup("Add zing");

index=1;
for (var i=1; i < allLayers.length; i++) {
    if (allLayers[i].name.search("zing")>0)
        index++;
}

/*
for (var i=1; i < allLayers.length; i++) {
    nameSearch = "zing" + index;
    if (allLayers[i].name.search('${nameSearch}')>-1)
        index+=2;
}
*/
var zingLayer = comp.layers.addShape();
zingLayer.name = " - zing " + index + " - ";
var zingGroup = zingLayer.property("Contents").addProperty("ADBE Vector Group");
zingGroup.name = "zing";
var zingShape = zingGroup.property("Contents").addProperty("ADBE Vector Shape - Rect");
zingShape.property("Size").setValue([comp.width,comp.height]);
var zingFill = zingGroup.property("Contents").addProperty("ADBE Vector Graphic - Fill");
zingFill.property("Color").setValue([0,0,0]);

if(layers.length > 0) {
    var newIn;
    var minIn = zingLayer.outPoint;
    var newOut;
    var maxOut = 0;
    var topIndx = layers.length;
    var newIndx = layers.length;
    zingLayer.moveToEnd();
    
    for(var i = 0; i < layers.length; i++){
        newIn = layers[i].inPoint;
        newOut = layers[i].outPoint;
        newIndx = layers[i].index;
        if(newIn < minIn) {
            minIn = newIn;
        }
        if(newOut > maxOut) {
            maxOut = newOut;
        }
        if(newIndx < zingLayer.index) {
            zingLayer.moveBefore(layers[i]);
        }
    }
    zingLayer.inPoint = minIn;
    zingLayer.outPoint = maxOut;
}

zingLayer.label = 11;

app.endUndoGroup();
