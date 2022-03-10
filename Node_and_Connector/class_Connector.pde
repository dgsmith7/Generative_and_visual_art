class connector { 
  float x1, y1, z1, x2, y2, z2;
  float connectorLength;
  connector (float xPlane1, float yPlane1, float zPlane1, float xPlane2, float yPlane2, float zPlane2) {
    x1 = xPlane1;
    y1 = yPlane1;
    z1 = zPlane1;
    x2 = xPlane2;
    y2 = yPlane2;
    z2 = zPlane2;
    connectorLength = nodeInterval;
  }

  void display () {
    stroke(outlineColor);
    fill(connectorColor);
    println (x1, x2, y1, y2, z1, z2);
    if ((x1 == x2) && (y1 == y2)) { // alligned on z axis
      translate (x1, y1, z1-(.5*nodeSize)-(.5*connectorLength));
      box (nodeSize, nodeSize, -connectorLength);
      translate(-x1, -y1, (-1*(z1-(.5*nodeSize)-(.5*connectorLength))));
    }
    if ((x1 == x2) && (z1 == z2)) { // alligned on y axis
      translate (x1, y1+(.5*nodeSize)+(.5*connectorLength), z1);
      box (nodeSize, connectorLength, nodeSize);
      translate(-x1, (-1*(y1+(.5*nodeSize)+(.5*connectorLength))), -z1);
    }
    if ((y1 == y2) && (z1 == z2)) { // alligned on z axis
      translate (x1+(.5*nodeSize)+(.5*connectorLength), y1, z1);
      box (connectorLength, nodeSize, nodeSize);
      translate((-1*(x1+(.5*nodeSize)+(.5*connectorLength))), -y1 -z1);
    }
  }
}

