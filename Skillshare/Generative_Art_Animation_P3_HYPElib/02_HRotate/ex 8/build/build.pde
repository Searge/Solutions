import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1, r2;

//  dP""b8  dP"Yb  Yb    dP 888888 88""Yb .dP"Y8 
// dP   `" dP   Yb  Yb  dP  88__   88__dP `Ybo." 
// Yb      Yb   dP   YbdP   88""   88"Yb  o.`Y8b 
//  YboodP  YbodP     YP    888888 88  Yb 8bodP' 

//  __  ___ / __      ___         ( )  ___   /  ___      ___    
//   / /   //   ) ) //___) )     / / //   ) / //___) ) //   ) ) 
//  / /   //   / / //           / / //   / / //       //   / /  
// / /   //   / / ((____       / / ((___/ / ((____   ((___( ( 

//  of   ::::    ::: :::::::::: :::::::: ::::::::::: ::::::::::: ::::    :::  :::::::: 
//      :+:+:   :+: :+:       :+:    :+:    :+:         :+:     :+:+:   :+: :+:    :+: 
//     :+:+:+  +:+ +:+       +:+           +:+         +:+     :+:+:+  +:+ +:+         
//    +#+ +:+ +#+ +#++:++#  +#++:++#++    +#+         +#+     +#+ +:+ +#+ :#:          
//   +#+  +#+#+# +#+              +#+    +#+         +#+     +#+  +#+#+# +#+   +#+#    
//  #+#   #+#+# #+#       #+#    #+#    #+#         #+#     #+#   #+#+# #+#    #+#     
// ###    #### ########## ########     ###     ########### ###    ####  ########       

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1) // ADDING OBJECT TO THE STAGE
		.anchor(50, -50)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(#FF3300)
	;
			// smaller rectangle
	r2 = new HRect(50).rounding(10);
	r1.add(r2) // put the r2 inside of the r1 <- NESTING
		.anchor(25, -25)
		.noStroke()
		.fill(#00616f)
	;

	new HRotate(r1, 1); // ROTATE THE NEST
}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(r1.x(), r1.y(), 4, 4);
}

