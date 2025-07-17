// Version: 1.0.0
// Updated 7/5/25

// Modified by Eric Woo-Shem for Gripper hand
// Using Gripper design by Skip Meetze and Jon Schull & Modifications by James Quilty (Thai_Reach)

// The Kwawu 2.0 prosthetic Arm - Thermoform Version
// By Jacqun Buchanan
// Parameteric 3-d printable prosthetic arm
//
// This design is licensed under the Creative Commons - Attribution - Share Alike license.

// The ISO thread code is by Trevor Moseley

// Preview Each Part
part = "Cuff"; // [ Cuff:Cuff, Arm1:Arm1, Arm2:Arm2, Arm3:Arm3, Arm4:Arm4, ElbowBolt:ElbowBolt, Thermoform1:Thermoform1, Thermoform2:Thermoform2, Thermoform3:Thermoform3, Cover1:Cover1, Cover2:Cover2, Cover3:Cover3, Cover4:Cover4, GripperHand: GripperHand, ThumbMoldOuter:ThumbMoldOuter, ThumbMoldInner:ThumbMoldInner, ThumbReg:ThumbReg]

// Choose Left or Right Hand
LeftRight = "Left"; // [Left,Right]
// Wrist to Fingertip
HandLength = 185; //[80: 240]
// Wrist to elbow crease (mm)
ArmLength = 282; //[141: 564]
// Circumference of Forearm just below elbow crease (mm)
ForearmCircumference = 271; //[135: 542]
// - Circumference of Bicep (mm)
BicepCircumference = 294; //[147: 600]
// Padding Thickness -inside forearm and cuff (mm)
PaddingThickness = 2; //[0: 10]
// How many pieces to divide the arm into 
ArmPieces = 2; //[1, 2, 4]
// How many pieces to divide the cover into 
CoverPieces = 2; //[1, 2, 4]
// Use automatic sizing for ElbowBolt
AutoElbowBoltDiameter = true; //[true, false]
// Diameter of pin holding cover on (mm)
CoverPinDiameter = 8;//[0, 4, 6, 8, 10]
// ISO metric bolt holding cuff and arm together (mm)
ElbowBoltDiameter = 8; //[4, 6, 8, 10, 12, 14]

/* [Hidden] */

// This is an amount added to the pencil cover length. 
// When this is zero the pencil cover is as tight as possible.
// Make it larger to fit around larger/thicker pencils
PencilCoverAddedLength = 4.0;

PI =  3.141592653589793238;
HandVersion = "V2.2";
ArmScale = ArmLength/299;
HandScale = HandLength / (128 * 1.341);
ForearmCircumferenceWPadding = ((ForearmCircumference/PI) + 2*PaddingThickness)*PI;
ForeArmCircumferenceScale = ForearmCircumferenceWPadding/271;
BicepCircumferenceWPadding = ((BicepCircumference/PI) + 2*PaddingThickness)*PI;
CuffScale = BicepCircumferenceWPadding/294;

WristBoltDia = 25;

ThumbScrewDia = HandScale > 1 ? 4 : 3;
$fn=30;

print_part();


module print_part( ) {
    
    if(part == "ElbowBolt") {
        // ( dia,hi, headhi, headDiameter, hexDiameter)
        ElbowBoltDiameter = (AutoElbowBoltDiameter ? CuffScale * 9 : ElbowBoltDiameter);
        make_bolt(ElbowBoltDiameter, ArmScale * 6 + CuffScale * 10, ElbowBoltDiameter/2, ElbowBoltDiameter *3);
    }
    
    
    if (part == "Cuff") {
        if (LeftRight == "Left") {
            mirror([0,1,0]) MakeCuff();
        } else {
            MakeCuff();
        }
    }
    
    if (part == "Arm1") {
        // rotate for better print orientation
        rotate([90,0,0])
        if (LeftRight == "Left") {
            mirror([1,0,0]) MakeArm(1);
        } else {
            MakeArm(1);
        }
    } 
    
    if (part == "Arm2") {
        
        if(ArmPieces > 1 )
        {
            // rotate for better print orientation
            rotate([90,0,0])
            if (LeftRight == "Left") {
                mirror([1,0,0]) MakeArm(2);
            } else {
                MakeArm(2);
            }
        }
    } 
    
    if (part == "Arm3") {
        
        if(ArmPieces > 2 )
        {
            // rotate for better print orientation
            rotate([90,0,0])
            if (LeftRight == "Left") {
                mirror([1,0,0]) MakeArm(3);
            } else {
                MakeArm(3);
            }
        }
    } 
    
    if (part == "Arm4") {
        
        if(ArmPieces > 2 )
        {
            // rotate for better print orientation
            rotate([90,0,0])
            if (LeftRight == "Left") {
                mirror([1,0,0]) MakeArm(4);
            } else {
                MakeArm(4);
            }
        }
    } 
    
    if (part == "Cover1") {
        
        // rotate for better print orientation
        rotate([90,0,0]) 
            if (LeftRight == "Left") {
                mirror([1,0,0]) MakeCover1();
            } else {
                MakeCover1();
            }
    }
    
   if (part == "Cover2") {
        
        // rotate for better print orientation
        rotate([90,0,0]) 
            if (LeftRight == "Left") {
                mirror([1,0,0]) MakeCover2();
            } else {
                MakeCover2();
            }
    }
    
    if (part == "Cover3") {
        
        if(CoverPieces ==4) {
            // rotate for better print orientation
            rotate([90,0,0]) 
                if (LeftRight == "Left") {
                    mirror([1,0,0]) Cover3of4();
                } else {
                    Cover3of4();
                }
        }
    }
    
    if (part == "Cover4") {
        
        if(CoverPieces ==4) {
            // rotate for better print orientation
            rotate([90,0,0]) 
                if (LeftRight == "Left") {
                    mirror([1,0,0]) Cover4of4();
                } else {
                    Cover4of4();
                }
        }
    }
    
    if (part == "Thermoform1") {
        // rotate for better print orientation
        rotate([0,180,0]) 
            if (LeftRight == "Left") {
                mirror([1,0,0]) MakeThermoform1();
            } else {
                MakeThermoform1();
            }
    } 
    
    if (part == "Thermoform2") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) Thermoform2();
        } else {
            Thermoform2();
        }
    } 
    
    if (part == "Thermoform3") {
      
        if (LeftRight == "Left") {
            mirror([1,0,0]) MakeThermoform3();
        } else {
            MakeThermoform3();
        }
    } 
    
    
        
    if(part == "WristBolt") { 
        // rotate for better print orientation
        rotate([0,90,0]) 
        MakeWristBolt();
    }
    
     if(part == "WristCompressionBushing")
    {
        MakeWristCompressionBushing();
    }
    if (part == "GripperHand" || part == "All") {
            translate([400, 800, 0])
            translate([30, 0, 0])
            if (LeftRight == "Left") {
                mirror([1,0,0])     MakeGripper();
            } else {
                MakeGripper();
            }
        } 
        if (part == "ThumbMoldOuter" || part == "All") {
            translate([800, 800, 0])
            translate([120, -100,0])
            if (LeftRight == "Left") {
                mirror([1,0,0])     MakeThumbMoldOuter();
            } else {
                MakeThumbMoldOuter();
            }
        } 
        if (part == "ThumbMoldInner" || part == "All") {
            translate([-800, 400, 0])
            translate([200, -200, 0])
            if (LeftRight == "Left") {
                mirror([1,0,0])     MakeThumbMoldInner();
            } else {
                MakeThumbMoldInner();
            }
        } 
        if (part == "ThumbReg") {
            translate([-800, -800, 0])
            if (LeftRight == "Left") {
                mirror([1,0,0])     MakeThumbReg();
            } else {
                MakeThumbReg();
            }
        }
}

module MakeGripper() {  
    difference(){
        union(){
            // Load hand model
            Gripper();
            
            
            // Fill in original bolt mount
            translate([27.6* HandScale, -3.5 * HandScale, 0])
            cylinder(h = 18 * HandScale, d = 25 * HandScale, $fn = 30);
            translate([23* HandScale, -2 * HandScale, 0])
            cylinder(h = 30 * HandScale, d = 25 * HandScale, $fn = 30);
            
            // Fill in Letter
            translate([9* HandScale, -4 * HandScale, 0])
            cylinder(h = 4 * HandScale, d = 10 * HandScale, $fn = 30);
            // Fix screw hole for thumb
            rotate([0,90,0])
            translate([-32 * HandScale, -15.5 * HandScale, 9.35 * HandScale])
            {
                difference() {
                    cylinder(h = 50 * HandScale, d = 5 * HandScale, $fn = 30);
                    cylinder(h = 50 * HandScale, d = (ThumbScrewDia-0.35) * HandScale, $fn = 30);
                }
            }
        }
        
        rotate([0,90,0]) {
            // Hole for screw head
            translate([-32 * HandScale, -15.5 * HandScale, 58 * HandScale])
            cylinder(h = 6 * HandScale, d = 8.5 * HandScale, $fn = 30);
            
            // Fix hole for thumb
            translate([-32 * HandScale, -15.5 * HandScale, 38.44 * HandScale])
            cylinder(h = 14.49 * HandScale, d = 6 * HandScale, $fn = 30);
        }
    }
    
        
        translate([(92)* HandScale, (-8)* HandScale, 0])
        rotate([0,90,180])
        GripperAttach();
    
    
}
module MakeThumbMoldOuter() {
    ThumbOuter();
}
module MakeThumbMoldInner() {
    ThumbInner();
}
module MakeThumbReg() {
    ThumbReg();
}


module MakeWristCompressionBushing() {
    
    WristDiameter = 53.6 * HandScale;
    CenterOfWasher = (WristDiameter + 25.5)/2;
    
    // center ring that actually compresses
    difference() {
        translate([0, 0, 2]) cylinder(d=CenterOfWasher+0.5, h = 4, center=true, $fn=200);
        translate([0, 0, 1.75]) cylinder(d=CenterOfWasher-0.5, h = 5, center=true, $fn=200);

        union(){
            for ( i = [0 : 20 : 340] ) {            
                rotate(i){
                    cube([CenterOfWasher+1,1, 5]);
                }
            }
        }
     }
   
     // outer ring that covers the gap.
    difference () {
        translate([0, 0, 3])cylinder(d=WristDiameter + 1.5, h = 6, center=true, $fn=200);
        translate([0, 0, 2.75])cylinder(d=WristDiameter + 0.5, h = 7, center=true, $fn=200);
    }
    
    // flat end of the washer
    difference () {
        translate([0, 0, 0.3])cylinder(d=WristDiameter + 1.5, h = 0.6, center=true, $fn=200);
        translate([0, 0, 0.25])cylinder(d=25.5, h = 1.0, center=true, $fn=200);
    }
    
}

module MakeCuff() {
    ElbowBoltDiameter = AutoElbowBoltDiameter? CuffScale * 9 : ElbowBoltDiameter;
    
    difference() {
        Cuff();
        
        //Cut a holes for elbow bolts
        translate([CuffScale  * 58.65, CuffScale  * -157, 0 ]) cylinder(d=ElbowBoltDiameter + 1, h = CuffScale  * 150, center=true, $fn=30);
        translate([CuffScale  * 58.65, CuffScale  * -303.63, 0 ]) cylinder(d=ElbowBoltDiameter + 1, h = CuffScale  * 150, center=true, $fn=30);
        
        
    }
    
   
}


module MakeWristBolt() {
 
    hi = 10.00 * HandScale + 15 * ArmScale;
    
    difference() {
        
        union() {
            // basic cyliner of bolt
            thread_out_centre(WristBoltDia,hi);
            
            // round the ends to not wear the thread
            translate([0, 0, 2 ]) rotate_extrude(convexity = 10) translate([WristBoltDia/4, 0, 0]) circle(r = WristBoltDia/5.5, $fn = 100);
            translate([0, 0, hi-2 ]) rotate_extrude(convexity = 10) translate([WristBoltDia/4, 0, 0]) circle(r = WristBoltDia/5.5, $fn = 100);
            
            difference(){
                
                //make threads
                translate([0, 0, -5 ]) thread_out(WristBoltDia,hi+10);
               
                //Cut threads evenly at bolt ends
                translate([0, 0, -5 ]) cylinder(d = WristBoltDia + 10, h = 10, center=true, $fn=30);
                translate([0, 0, hi+5 ]) cylinder(d = WristBoltDia + 10, h = 10, center=true, $fn=30);
                
            }
        }
      
        //Cut flat top and bottom to make printable
        translate([9*WristBoltDia /10, 0, hi/2 -5]) cube([ WristBoltDia + 1, WristBoltDia + 1, hi+15], center= true);
        //translate([-9*WristBoltDia /10, 0, hi/2 -5]) cube([ WristBoltDia + 1, WristBoltDia + 1, hi+15], center= true);
        
        //Cut a hole down middle for string
        translate([0, 0, hi/2 +5 ]) cylinder(d = WristBoltDia/5.5, h = hi +15, center=true, $fn=30);
        
    }
    
}

module MakeArm(PieceNumber) {
    ElbowBoltDiameter = AutoElbowBoltDiameter? CuffScale * 9 : ElbowBoltDiameter;
    offset = 37; // move over all the holes and pins on the arm1
    
    difference(){
        
        if(ArmPieces == 1) {
            Arm1of1();
        } else {
            if(ArmPieces == 2) {
                    
                if(PieceNumber == 1)
                    Arm1of2();
                else 
                    Arm2of2();
            
            } else {
                if(PieceNumber == 1)
                    Arm1of4();
                else {
                    if(PieceNumber == 2)
                        Arm2of4();
                    else {
                        if(PieceNumber == 3)
                            Arm3of4();
                        else
                             Arm4of4();
                    }
                }
            }
        }
              
         // Make hole for Elbow threads
        translate([ForeArmCircumferenceScale  * 60.36, ArmScale  * 40.819, ArmScale  * -324.376 ]) rotate([90,0,0]) cylinder(d=ElbowBoltDiameter, h=ArmScale * 200,center=true, $fn=20);
        
        translate([ForeArmCircumferenceScale  * -74.64, ArmScale  * 40.819, ArmScale  * -324.376 ]) rotate([90,0,0]) cylinder(d=ElbowBoltDiameter, h=ArmScale * 200,center=true, $fn=20);
            
        
        if(PieceNumber ==1)  {
            
            //make guide holes
            translate([ForeArmCircumferenceScale  * 47.228 - (-5+offset) *HandScale, ArmScale  * 27.319, ArmScale * -30.326 + HandScale * -15 ]) 
            cube([HandScale  * 4 + .3, HandScale  * 20, HandScale *7]);
            
            translate([ForeArmCircumferenceScale  * 47.228 - (38+5+offset) *HandScale , ArmScale  * 27.319,  ArmScale * -30.326 + HandScale * -15]) 
            cube([HandScale  * 10 + .3, HandScale  * 20, HandScale *7]);
        
            translate([ForeArmCircumferenceScale  * 47.228 - (78+7.5+offset) *HandScale, ArmScale  * 27.319,  ArmScale * -30.326 + HandScale * -15 ]) 
            cube([HandScale  * 4 +.3, HandScale  * 20, HandScale *7]);
        
            translate([ForeArmCircumferenceScale  * 47.228 - (108+3-1+offset-140.8) *HandScale, ArmScale  * 27.319, ArmScale * -30.326 + HandScale * -15]) 
            cube([HandScale  * 4+ .3, HandScale  * 20, HandScale *7]);
            
            //cut the arm to fit around the wrist
            translate([ForeArmCircumferenceScale  * 62.989 - 140.8*HandScale -  200, ArmScale  * 27.319, HandScale  * -42.6 -50]) 
            cube([ 200, 20, 200]);
        }
    }
    
   
    if(PieceNumber ==1 && CoverPinDiameter > 0) {
    
        // Make pins for cover
        translate([ForeArmCircumferenceScale  * 27.228 + (13.5+6-offset+65-1-140.8)*HandScale, ArmScale  * 37.319 + ArmScale  * 10, ArmScale  * -39.35 ]) 
        rotate([90,0,0])  
        cylinder(d=CoverPinDiameter, h = ArmScale  * 12.5, center=false, $fn=30);
    
        translate([ForeArmCircumferenceScale  * 27.228 - (80.37225-32+5+2+offset-65-2.5-1)*HandScale, ArmScale  * 37.319 + ArmScale  * 10, ArmScale  * -39.35 ]) 
        rotate([90,0,0]) 
        cylinder(d=CoverPinDiameter, h = ArmScale  * 10, center=false, $fn=30);
        
    }   
    
    
    if((ArmPieces == 4 && PieceNumber == 3) || (ArmPieces == 2 && PieceNumber == 2) || ArmPieces == 1) {
       
        difference() {

            //Add inner threads for elbow bolt holder
            translate([ForeArmCircumferenceScale  * -74.64, ArmScale  * 40.819, ArmScale  * -324.376 ]) rotate([90,0,0]) translate([0, 0, -2 * ArmScale  ])thread_in(ElbowBoltDiameter, ArmScale * 10);
                    
            translate([ForeArmCircumferenceScale  * -74.64, ArmScale  * 40.819, ArmScale  * -324.376 ]) rotate([90,0,0]) translate([0, 0, ArmScale * -5]) cylinder(d=ElbowBoltDiameter + 0.5, h=ArmScale * 10,center=true, $fn=20);
           
           translate([ForeArmCircumferenceScale  * -74.64, ArmScale  * 40.819, ArmScale  * -324.376 ]) rotate([90,0,0]) translate([0, 0, ArmScale * 11]) cylinder(d=ElbowBoltDiameter + 0.5, h=ArmScale * 10,center=true, $fn=20);
        }
    }
          
   if((ArmPieces == 4 && PieceNumber == 4) || (ArmPieces == 2 && PieceNumber == 2) || ArmPieces == 1) {
       
       difference() {
            //Add inner threads for elbow bolt holder
            translate([ForeArmCircumferenceScale  * 60.36, ArmScale  * 40.819, ArmScale  * -324.376 ]) rotate([90,0,0]) translate([0, 0, -2 * ArmScale  ])thread_in(ElbowBoltDiameter, ArmScale * 10);
                    
            translate([ForeArmCircumferenceScale  * 60.36, ArmScale  * 40.819, ArmScale  * -324.376 ]) rotate([90,0,0]) translate([0, 0, ArmScale * -5]) cylinder(d=ElbowBoltDiameter + 0.5, h=ArmScale * 10,center=true, $fn=20);
           
           translate([ForeArmCircumferenceScale  * 60.36, ArmScale  * 40.819, ArmScale  * -324.376 ]) rotate([90,0,0]) translate([0, 0, ArmScale * 11]) cylinder(d=ElbowBoltDiameter + 0.5, h=ArmScale * 10,center=true, $fn=20);
       }

    }
    
    
}

module MakeCover1() {
    difference() {
        
        if(CoverPieces ==1)
            Cover1of1();
        if(CoverPieces ==2)
            Cover1of2();
        if(CoverPieces ==4)
            Cover1of4();
        
         //Cut a hole for piovoting bolts
        translate([ForeArmCircumferenceScale  * -235.07, ArmScale  * 0, ArmScale  * -44.8 ]) rotate([90,0,0])  cylinder(d=CoverPinDiameter + 0.5, h = ArmScale  * 50, center=true, $fn=30);
    
        translate([ForeArmCircumferenceScale  * -342.255, ArmScale  * 0, ArmScale  * -44.8 ]) rotate([90,0,0])  cylinder(d=CoverPinDiameter + 0.5, h = ArmScale  * 50, center=true, $fn=30);
         
    }
    

}

module MakeCover2() {

if(CoverPieces !=1)
{

    difference () {
        if(CoverPieces ==2)
            Cover2of2();
        if(CoverPieces ==4)
            Cover2of4();
    
        //Cut a hole for pivoting bolts
        translate([ForeArmCircumferenceScale  * -235.07, ArmScale  * 0, ArmScale  * -44.8 ]) rotate([90,0,0])  cylinder(d=CoverPinDiameter + 0.5, h = ArmScale  * 50, center=true, $fn=30);
         
    }
}
    
}

module MakeThermoform1() {
    
    
   difference(){
        Thermoform1();
        
                
    }
    
    
        
}

module MakeThermoform3() {
    
    difference(){
        Thermoform3();
        
        //Cut hole for first elbow bolt holder
        translate([ForeArmCircumferenceScale * 293.127, ForeArmCircumferenceScale * 24.432, ArmScale * -296.208]) 
        rotate([0,90,0]) 
        translate([0, 0, -90 * ForeArmCircumferenceScale]) 
        cylinder(d=ElbowBoltDiameter, h=100 * ForeArmCircumferenceScale,center=false, $fn=20);
       
    }
    
    //Add inner threads for elbow bolt holder
    translate([ForeArmCircumferenceScale * 293.127, ForeArmCircumferenceScale * 24.432, ArmScale * -296.208]) 
    rotate([0,90,0])
    translate([0, 0, -77 * ForeArmCircumferenceScale]) 
    thread_in(ElbowBoltDiameter, 77 * ArmScale);
}

//--pitch-----------------------------------------------------------------------
// function for ISO coarse thread pitch (these are specified by ISO)
function get_coarse_pitch(dia) = lookup(dia, [
[1,0.25],[1.2,0.25],[1.4,0.3],[1.6,0.35],[1.8,0.35],[2,0.4],[2.5,0.45],[3,0.5],[3.5,0.6],[4,0.7],[5,0.8],[6,1],[7,1],[8,1.25],[10,1.5],[12,1.75],[14,2],[16,2],[18,2.5],[20,2.5],[22,2.5],[24,3],[27,3],[30,3.5],[33,3.5],[36,4],[39,4],[42,4.5],[45,4.5],[48,5],[52,5],[56,5.5],[60,5.5],[64,6],[78,5]]);


module make_bolt(dia,hi, headhi, headDiameter)
// make an ISO bolt 
//  dia=diameter, 6=M6 etc.
//  hi=length of threaded part of bolt
{
//rotate for better print orientation
rotate([-90,0,0]) 
    difference() {
        union()
        {   
            difference() {
            cylinder(d = headDiameter, h = headhi, $fn=30);
            
                // Make head rounded
                difference() {
                    
                    pad = 0.1; // Padding to maintain manifold
                    r = 1; // radius of fillet
                    cr = headDiameter/2;
                        
                    rotate_extrude(convexity=10, $fn = 30) translate([cr-r+pad, -pad, 0]) square(r+pad,r+pad);
                    rotate_extrude(convexity=10, $fn = 30) translate([cr-r, r, 0]) circle(r=r,$fn=30);
                    }
       
            }
            translate([0,0,headhi-0.1]) thread_out_centre(dia,hi+0.1);
            translate([0,0,headhi-0.1]) thread_out(dia,hi+0.1);
        }
        
        // make the hex hole
        translate([0,0,-1]) rotate([0,0,45]) cylinder(d = dia - 2 ,h = dia, $fn=4);
     
        //flatten one side to make it printable
        translate([-hi, dia/2 - dia/12, -1]) cube(hi *2);   
        
        //flatten other side to make threads not wavy on top
        translate([-hi,- (hi *2) - (dia/2 - dia/14), headhi + 0.1]) cube(hi *2);   
    }
    
         
}

module thread_out(dia,hi,thr=$fn)
// make an outside ISO thread (as used on a bolt)
//  dia=diameter, 6=M6 etc
//  hi=height, 10=make a 10mm long thread
//  thr=thread quality, 10=make a thread with 10 segments per turn
{
	p = get_coarse_pitch(dia);
	thread_out_pitch(dia,hi,p,thr);
}

module thread_in(dia,hi,thr=$fn)
// make an inside thread (as used on a nut)
//  dia = diameter, 6=M6 etc
//  hi = height, 10=make a 10mm long thread
//  thr = thread quality, 10=make a thread with 10 segments per turn
{
	p = get_coarse_pitch(dia);
    //JB: I add this mirror because the model will be mirrored at the end if it is a left
    if (LeftRight == "Left") {
            mirror([0,1,0]) thread_in_pitch(dia,hi,p,thr); 
    } else
            thread_in_pitch(dia,hi,p,thr);  
}

module thread_out_pitch(dia,hi,p,thr=$fn)
// make an outside thread (as used on a bolt) with supplied pitch
//  dia=diameter, 6=M6 etc
//  hi=height, 10=make a 10mm long thread
//  p=pitch
//  thr=thread quality, 10=make a thread with 10 segments per turn
{
	h=(cos(30)*p)/8;
	Rmin=(dia/2)-(5*h);	// as wiki Dmin
	s=360/thr;				// length of segment in degrees
	t1=(hi-p)/p;			// number of full turns
	r=t1%1.0;				// length remaining (not full turn)
	t=t1-r;					// integer number of full turns
	n=r/(p/thr);			// number of segments for remainder
	// do full turns
	for(tn=[0:t-1])
		translate([0,0,tn*p])	th_out_turn(dia,p,thr);
	// do remainder
	for(sg=[0:n])
		th_out_pt(Rmin-0.1,p,s,sg+(t*thr),thr,h,p/thr);
}

module thread_in_pitch(dia,hi,p,thr=$fn)
// make an inside thread (as used on a nut)
//  dia = diameter, 6=M6 etc
//  hi = height, 10=make a 10mm long thread
//  p=pitch
//  thr = thread quality, 10=make a thread with 10 segments per turn
{
	h=(cos(30)*p)/8;
	Rmin=(dia/2)-(5*h);	// as wiki Dmin
	s=360/thr;				// length of segment in degrees
	t1=(hi-p)/p;			// number of full turns
	r=t1%1.0;				// length remaining (not full turn)
	t=t1-r;					// integer number of turns
	n=r/(p/thr);			// number of segments for remainder
	for(tn=[0:t-1])
		translate([0,0,tn*p])	th_in_turn(dia,p,thr);
	for(sg=[0:n])
		th_in_pt(Rmin,p,s,sg+(t*thr),thr,h,p/thr);
}

module thread_out_centre(dia,hi)
{
	p = get_coarse_pitch(dia);
	thread_out_centre_pitch(dia,hi,p);
}

module thread_out_centre_pitch(dia,hi,p)
{
	h = (cos(30)*p)/8;
	Rmin = (dia/2) - (5*h);	// as wiki Dmin

	cylinder(r = Rmin, h = hi);
}

module thread_in_ring(dia,hi,thk)
{
	difference()
	{
		cylinder(d = dia,h = hi);
		translate([0,0,-1]) cylinder(d = dia - thk*2, h = hi + 1);
	}
}

//--low level bolt modules-----------------------------------------------------------

module th_out_turn(dia,p,thr=$fn)
// make a single turn of an outside thread
//  dia=diameter, 6=M6 etc
//  p=pitch
//  thr=thread quality, 10=make a thread with 10 segments per turn
{
	h = (cos(30)*p)/8;
	Rmin = (dia/2) - (5*h);	// as wiki Dmin
	s = 360/thr;
	for(sg=[0:thr-1])
		th_out_pt(Rmin-0.1,p,s,sg,thr,h,p/thr);
}

module th_out_pt(rt,p,s,sg,thr,h,sh)
// make a part of an outside thread (single segment)
//  rt = radius of thread (nearest centre)
//  p = pitch
//  s = segment length (degrees)
//  sg = segment number
//  thr = segments in circumference
//  h = ISO h of thread / 8
//  sh = segment height (z)
{
	as = (sg % thr) * s ;			// angle to start of seg
	ae = as + s  - (s/100) + 0.2;		// angle to end of seg (with overlap) JB: The 0.2 makes the segments link
	z = sh*sg;
	//pp = p/2;
	//   1,4
	//   |\
	//   | \  2,5
 	//   | / 
	//   |/
	//   0,3
	//  view from front (x & z) extruded in y by sg
	//  
	//echo(str("as=",as,", ae=",ae," z=",z));
	polyhedron(
		points = [
			[cos(as)*rt,sin(as)*rt,z],								// 0
			[cos(as)*rt,sin(as)*rt,z+(3/4*p)],						// 1
			[cos(as)*(rt+(5*h)),sin(as)*(rt+(5*h)),z+(3/8*p)],		// 2
			[cos(ae)*rt,sin(ae)*rt,z+sh],							// 3
			[cos(ae)*rt,sin(ae)*rt,z+(3/4*p)+sh],					// 4
			[cos(ae)*(rt+(5*h)),sin(ae)*(rt+(5*h)),z+sh+(3/8*p)]],	// 5
		faces = [
			[0,1,2],			// near face
			[3,5,4],			// far face
			[0,3,4],[0,4,1],	// left face
			[0,5,3],[0,2,5],	// bottom face
			[1,4,5],[1,5,2]]);	// top face
}

module th_in_turn(dia,p,thr=$fn)
// make an single turn of an inside thread
//  dia = diameter, 6=M6 etc
//  p=pitch
//  thr = thread quality, 10=make a thread with 10 segments per turn
{
	h = (cos(30)*p)/8;
	Rmin = (dia/2) - (5*h);	// as wiki Dmin
	s = 360/thr;
	for(sg=[0:thr-1])
		th_in_pt(Rmin,p,s,sg,thr,h,p/thr);
}

module th_in_pt(rt,p,s,sg,thr,h,sh)
// make a part of an inside thread (single segment)
//  rt = radius of thread (nearest centre)
//  p = pitch
//  s = segment length (degrees)
//  sg = segment number
//  thr = segments in circumference
//  h = ISO h of thread / 8
//  sh = segment height (z)
{
	as = ((sg % thr) * s - 180);	// angle to start of seg
	ae = as + s -(s/100) + 0.2;		// angle to end of seg (with overlap) JB: The 0.2 makes the segments link
	z = sh*sg;
	pp = p/2;
	//         2,5
	//          /|
	//     1,4 / | 
 	//         \ |
	//          \|
	//         0,3
	//  view from front (x & z) extruded in y by sg
	//  
	polyhedron(
		points = [
			[cos(as)*(rt+(5*h)),sin(as)*(rt+(5*h)),z],				//0
			[cos(as)*rt,sin(as)*rt,z+(3/8*p)],						//1
			[cos(as)*(rt+(5*h)),sin(as)*(rt+(5*h)),z+(3/4*p)],		//2
			[cos(ae)*(rt+(5*h)),sin(ae)*(rt+(5*h)),z+sh],			//3
			[cos(ae)*rt,sin(ae)*rt,z+(3/8*p)+sh],					//4
			[cos(ae)*(rt+(5*h)),sin(ae)*(rt+(5*h)),z+(3/4*p)+sh]],	//5
		faces = [
			[0,1,2],			// near face
			[3,5,4],			// far face
			[0,3,4],[0,4,1],	// left face
			[0,5,3],[0,2,5],	// bottom face
			[1,4,5],[1,5,2]]);	// top face
}


module WhippleTreePrimary() {scale([HandScale,HandScale,HandScale]) import("o_WhippleTreePrimary.stl", convexity=3);}

module WhippleTreeSecondary() {scale([HandScale,HandScale,HandScale]) import("o_WhippleTreeSecondary.stl", convexity=3);}

module Arm1of1() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Arm1of1.stl", convexity=3); }

module Arm1of2() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Arm1of2.stl", convexity=3); }

module Arm2of2() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Arm2of2.stl", convexity=3); }

module Arm1of4() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Arm1of4.stl", convexity=3); }

module Arm2of4() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Arm2of4.stl", convexity=3); }

module Arm3of4() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Arm3of4.stl", convexity=3); }

module Arm4of4() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Arm4of4.stl", convexity=3); }

module LatchBase() {scale([ArmScale,ArmScale,ArmScale]) import("o_Latch.stl", convexity=3); }

module LatchHole() {scale([ArmScale,ArmScale,ArmScale]) import("o_LatchHingeHole.stl", convexity=3); }

module Cuff() {scale([CuffScale,CuffScale,CuffScale]) import("o_Cuff.stl", convexity=3); }

module Thermoform1() {scale([ForeArmCircumferenceScale,ForeArmCircumferenceScale,ArmScale]) import("o_Thermoform1.stl", convexity=3); }

module Thermoform2() {scale([ForeArmCircumferenceScale,ForeArmCircumferenceScale,ArmScale]) import("o_Thermoform2.stl", convexity=3); }

module Thermoform3() {scale([ForeArmCircumferenceScale,ForeArmCircumferenceScale,ArmScale]) import("o_Thermoform3.stl", convexity=3); }

module Cover1of1() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Cover1of1.stl", convexity=3); }

module Cover1of2() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Cover1of2.stl", convexity=3); }

module Cover2of2() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Cover2of2.stl", convexity=3); }

module Cover1of4() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Cover1of4.stl", convexity=3); }

module Cover2of4() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Cover2of4.stl", convexity=3); }

module Cover3of4() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Cover3of4.stl", convexity=3); }

module Cover4of4() {scale([ForeArmCircumferenceScale,ArmScale,ArmScale]) import("o_Cover4of4.stl", convexity=3); }

module Gripper() {
    rotate([0, 90, 0]) 
    translate([-65 * HandScale, 0, 0])
    scale([HandScale, HandScale, HandScale]) 
    import("o_Gripper.stl", convexity=3);
}
module GripperAttach() {
    rotate([0, 90, 0]) 
    translate([-65 * HandScale, 0, 0])
    rotate([180, 0, 0]) 
    scale(HandScale * 0.8658428987) 
    import("o_GripperAttach.stl", convexity=3);
}
module ThumbOuter() { 
    scale(HandScale*0.8658428987) 
    import("o_ThumbOuter.stl", convexity=3);
}
module ThumbInner() { 
    scale(HandScale*0.8658428987) 
    import("o_ThumbInner.stl", convexity=3);
}
module ThumbReg() { 
    scale(HandScale*0.8324481754) 
    import("o_ThumbReg.stl", convexity=3);
}
