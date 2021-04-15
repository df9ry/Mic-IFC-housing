
// Mikrofon Interface - Teil 1:
include <Maße.scad>

// Resolution for 3D printing:
$fa = 1;
$fs = 0.4;

// Loch für die Eingangsbuchse
loch_durchm =  7.0;
loch_z      =  7.5; // Über der Platine
loch_x      = 31.0; // X-Achse relativ zur Platine

module part1_loch() {
    translate([0, gehaeuse_dicke / 2, 0]) {
    rotate([90, 0, 0])
            cylinder(d = loch_durchm,
                     h = gehaeuse_dicke + 2 * delta,
                     center = true);
    }
}

module part1_boden_platte() {
    cube([platine_breite + 2 * gehaeuse_dicke,
          gehaeuse_dicke,
          2 * gehaeuse_dicke + platine_bodenfreiheit
            + platine_dicke + platine_lichtefreiheit]);
}

module part1_boden() {
    difference() {
        part1_boden_platte();
            union() {
                translate([loch_x, 0,
                           gehaeuse_dicke
                         + platine_bodenfreiheit
                         + platine_dicke + loch_z])
                    part1_loch();
        }
    }
}

module part1_left() {
    translate([0, 0, 0])
        cube([gehaeuse_dicke, platine_tiefe, 
              2 * gehaeuse_dicke + platine_bodenfreiheit
                + platine_dicke + platine_lichtefreiheit]);
    // Steg unten:
    translate([gehaeuse_dicke, 0, gehaeuse_dicke])
        cube([steg_breite, platine_tiefe,
              platine_dicke + platine_bodenfreiheit
            - gehaeuse_dicke]);
    // Steg oben:
    translate([gehaeuse_dicke, 0, 
               gehaeuse_dicke + platine_bodenfreiheit
               + platine_dicke])
        cube([steg_breite, platine_tiefe,
              platine_lichtefreiheit]);
    
}

module part1_right() {
    translate([platine_breite + 2 * gehaeuse_dicke, 0, 0])
    mirror([1, 0, 0])
        part1_left();
}

abstand = 0.2; // Abstand des Knubbels für die Kabeldurchführung

module part1() {
    translate([0, gehaeuse_dicke, 0]) {
        translate([0, platine_tiefe, 0])
            part1_boden();
        part1_left();
        part1_right();
    }

    translate([0, 0,
               gehaeuse_dicke + platine_bodenfreiheit
             + platine_dicke + abstand]) 
        cube([gehaeuse_dicke + steg_breite, gehaeuse_dicke + delta,
              aussparung_hoehe - 2 * abstand]);
}

//part1();
