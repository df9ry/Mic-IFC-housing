
include <Part1.scad>
include <Part2.scad>

versatz =   5;

part1();
color("red", 1.0) {
    part2();
}