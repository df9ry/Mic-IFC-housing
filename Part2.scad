include <Maße.scad>

module part2_aussparung() {
    translate([-delta, -delta,
               gehaeuse_dicke + platine_bodenfreiheit
             + platine_dicke])
    cube([aussparung_breite + delta, gehaeuse_dicke + 2*delta,
          aussparung_hoehe]);
}

module part2_front_platte() {
    cube([2 * gehaeuse_dicke + platine_breite,
          gehaeuse_dicke,
          2 * gehaeuse_dicke + platine_bodenfreiheit
        + platine_dicke + platine_lichtefreiheit]);
}

module part2_front() {
    difference() {
        part2_front_platte();
        part2_aussparung();
    }
}

module part2_boden() {
    translate([gehaeuse_dicke, gehaeuse_dicke - delta, 0])
        cube([platine_breite, platine_tiefe + delta + gehaeuse_dicke,
              gehaeuse_dicke]);
    // Raste:
    translate([gehaeuse_dicke, platine_tiefe + gehaeuse_dicke,
               gehaeuse_dicke - delta])
        cube([platine_breite, 
              gehaeuse_dicke, raste_z + delta]);
}

module part2_deckel() {
    mirror([0, 0, 1])
        translate([0, 0, 
                - 2 * gehaeuse_dicke - platine_bodenfreiheit
                - platine_dicke - platine_lichtefreiheit])
            part2_boden();
}

module part2() {
    part2_front();
    part2_boden();
    part2_deckel();
}

//part2();
