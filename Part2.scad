include <Maße.scad>

module part2_aussparung() {
    translate([-delta, -delta,
               2 * gehaeuse_dicke + platine_bodenfreiheit
               + platine_dicke + luft])
    cube([aussparung_breite + delta, gehaeuse_dicke + 2*delta,
          aussparung_hoehe]);
}

module part2_front_platte() {
    cube([2 * gehaeuse_dicke + platine_breite,
          gehaeuse_dicke,
          4 * gehaeuse_dicke + platine_bodenfreiheit
        + platine_dicke + platine_lichtefreiheit + 2 * luft]);
}

module part2_front() {
    difference() {
        part2_front_platte();
        part2_aussparung();
    }
}

module schiene() {
    cube([steg_breite, platine_tiefe / 2, gehaeuse_dicke - luft]);
}

module part2_boden() {
    translate([0, gehaeuse_dicke - delta, 0])
        cube([2 * gehaeuse_dicke + platine_breite,
              platine_tiefe + delta +  2 * gehaeuse_dicke + luft,
              gehaeuse_dicke]);
    // Raste:
    translate([0, platine_tiefe + 2 * gehaeuse_dicke + luft,
               gehaeuse_dicke - delta])
        cube([2 * gehaeuse_dicke + platine_breite, 
              gehaeuse_dicke, raste_z + delta]);
    // Schiene links:
    translate([gehaeuse_dicke, gehaeuse_dicke - delta,
               gehaeuse_dicke - delta])
        schiene();
    // Schiene rechts:
    translate([gehaeuse_dicke + platine_breite - steg_breite,
               gehaeuse_dicke - delta, gehaeuse_dicke - delta])
        schiene();
}

module part2_deckel() {
    mirror([0, 0, 1])
        translate([0, 0, 
                - 4 * gehaeuse_dicke - platine_bodenfreiheit
                - platine_dicke - platine_lichtefreiheit
                - 2 * luft])
            part2_boden();
}

module part2() {
    part2_front();
    part2_boden();
    part2_deckel();
}

//part2();
