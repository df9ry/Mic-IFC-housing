
include <Part1.scad>
include <Part2.scad>

versatz =   5;

translate([0, luft, gehaeuse_dicke + luft]) color("yellow", 0.5) {
    part1();
}
    
color("red",    1.0) { 
    part2();
}

//translate([gehaeuse_dicke,
//           gehaeuse_dicke,
//           2 * gehaeuse_dicke + platine_bodenfreiheit])
//    platine();