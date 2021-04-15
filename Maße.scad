
// Gehäuse für Mikrofon Interface, Maße

// Resolution for 3D printing:
$fa = 1;
$fs = 0.4;

// Allgemeines:
delta                  =   0.1; // Standard Durchdringung

// Luft zwischen getrennten Teilen:
luft                   =   0.2;

// Gehäuse Dicke
gehaeuse_dicke         = 1.6;

// Abmessungen der Platine:
platine_breite         =  54.5 + luft; // X
platine_tiefe          =  27.5 + luft; // Y
platine_dicke          =   1.6 + luft; // Z

// Platz nötig unterhalb der Platine:
platine_bodenfreiheit  =   4.0; 

// Platz nötig oberhalb der Platine:
platine_lichtefreiheit =  14.0;

// Größe der Raste zum Einrasten von Teil 2 in Teil 1
raste_z                =   0.25;

// Kabeldurchführung nach vorne:
aussparung_breite      =  10.0;
aussparung_hoehe       =   3.0;

// Steg zur Halterung der Platine:
steg_breite            =   1.0;

// Platine in Blau:
module platine() {
    color("blue", 1.0) {
        translate([luft / 2, luft / 2, luft / 2])
            cube([platine_breite, platine_tiefe, platine_dicke]);
    }
}

//platine();