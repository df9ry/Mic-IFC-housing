
include <Part1.scad>
include <Part2.scad>

versatz =   5;

rotate([-90, 0, 0])
    translate([0, - platine_tiefe - 2 * gehaeuse_dicke, versatz])
        part1();
        
color("red", 1.0) {
  rotate([+90, 0, 0])
    translate([0,  0, versatz])
        part2();
}