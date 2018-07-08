WIDTH = 10;
LONGER_ARM_HEIGHT = 20;
SHORTER_ARM_LENGTH = 2;
ARM_ANGLE = 70;
STAND_OFFSET = 18;
STAND_THICKNESS = 2;

full_stand();

function stand_height(angle, base_offset) = 4;

module main_l(){
    union(){
        translate([0,0,LONGER_ARM_HEIGHT/2])
        cube([WIDTH,STAND_THICKNESS,LONGER_ARM_HEIGHT], true);        
        
        translate([0,0,STAND_THICKNESS/2])                
        //translate([0,-SHORTER_ARM_LENGTH/2,0])            
        rotate([90,0,0])        
        cube([WIDTH,STAND_THICKNESS,SHORTER_ARM_LENGTH], true);                
    }    
}

module back_wall(){
    height = 8;    
    //TODO: improve the formula with tan sth is wrong here
    //height = tan(ARM_ANGLE) * STAND_OFFSET;
    cube([WIDTH,STAND_THICKNESS,height], true);    
}

module full_stand(){  
    height = 8;
    
    union(){
        rotate([-ARM_ANGLE,0,0])        
        main_l();

        wall_angle = 90 - ARM_ANGLE;
        translate([0,STAND_OFFSET + STAND_THICKNESS/2,height/2])
        rotate([wall_angle,0,0])        
        back_wall();
    }
}
