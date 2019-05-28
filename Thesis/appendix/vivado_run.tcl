# Function color
# ==============
# Return ASCII colored text.
proc color {color text} {
    if {$::colored} {
        return "\x1b\[3${color}m${text}\x1b\[0m"
    } else {
        return $text
    }
}

# Function report_all
# ===================
# Generate all relevant reports
proc report_all {} {
    puts [color 5 "Generating all reports..."]
    exec mkdir report -p
    report_clock_utilization         -quiet -verbose -file report/clock_utilization.txt
    report_utilization               -quiet -verbose -file report/utilization.txt
    return 0
}

# Argument handling
# -----------------

# Defaults (flags)
set verbose 0
set colored 1
# Defaults (k=v)
set period 1
set top "top"
set max_error_percent 5
set max_iterations 10
lappend generics
# Required
lappend files
lappend library_files
set part ""

# Show help/usage
if {$argc < 3} {
    puts [color 1 "Missing arguments, showing usage."]
    puts ""
    puts "Usage: $argv0 <file ...> -p <part> \[optional arguments]"
    puts ""
    puts "Required Arguments:"
    puts "    <file ...>            The VHDL file(s) to load."
    puts "    -p|--part <part>      The name of part/device being benchmarked."
    puts "Optional Arguments:"
    puts "    -v|--verbose          Disable message suppression."
    puts "       --no-color         Disable color in message output."
    puts "    -c|--clock <period>   The initial period used in nanoseconds. Change not recommended. Default: $period"
    puts "    -t|--top <name>       The top module. Default: $period"
    puts "    -e|--error <percent>  The maximal allowed final frequency error in percent. This is the target the script tries to hit. Default: $max_error_percent"
    puts "    -i|--iterations <int> The maximal amount of design runs to do to try and hit the target. Default: $max_iterations"
    puts "    -g|--generic <K=V>    Set VHDL generics. Repeat as required. Must adhere to Vivado's standards (see ug835), example: N=100."
    puts "    -l|--library <K=V>    Add a file to a library. Repeat as required."
    return -1
}

# (Simple) Argument parser.
# Treats single dash and double dash arguments the same.
# There must be a space separating the argument and the value (if any).

# i = Argument index
for {set i 0} {$i < $argc} {incr i} {
    # arg = Current argument string
    set arg [lindex $argv $i]

    # Starts with _not_ "-", must be a file.
    if {[string index $arg 0] != "-"} {
        lappend files $arg
        continue
    }
    # If we are here: Must be a "-" or "--" argument.

    # Strip first "-"
    set arg [string range $arg 1 end]

    # If starts with "--", strip second "-"
    if {[string index $arg 0] == "-"} {
        set arg [string range $arg 1 end]
    }

    # Flags (no value, just a key)
    switch -exact -- $arg {
        "v" -
        "verbose" {
            set verbose 1
            continue
        }
        "no-color" {
            set colored 0
            continue
        }
        default {}
    }
    # If we are here: Must be a key-value argument.

    # Find first "=", if not present: -1
    set eqpos [string first "=" $arg]

    # If there is no "=", the next argument is the value. If there is a "=", cut the string.
    if {$eqpos == -1} {
        set key $arg
        incr i
        if {$i >= $argc} {
            puts [color 1 "Argument ($key) specified but no value given."]
            return -1
        }
        set value [lindex $argv $i]
    } else {
        set key [string range $arg 0 $eqpos-1]
        set value [string range $arg $eqpos+1 end]
    }

    unset eqpos

    # Now we have $key = $value

    switch -exact -- $key {
        "p" -
        "part" {
            set part $value
        }
        "c" -
        "clock" {
            set period $value
        }
        "t" -
        "top" {
            set top $value
        }
        "e" -
        "error" {
            set max_error_percent $value
        }
        "i" -
        "iterations" {
            set max_iterations $value
        }
        "g" -
        "generic" {
            lappend generics $value
        }
        "l" -
        "library" {
            lappend library_files $value
        }
        default {
            puts [color 1 "Unknown argument: $key = $value"]
            return -1
        }
    }
}

# Required parameter check
if {[string length $part] == 0} {
    puts [color 1 "No part set. Run without arguments to show help."]
    return -1
}
if {[llength $files] == 0} {
    puts [color 1 "No file(s) set. Run without arguments to show help."]
    return -1
}

# Sanity checks
if {$period < 0.01} {
    puts [color 1 "Initial clock period must be at least 0.01ns"]
    return -1
}
if {$max_error_percent < 0.01} {
    puts [color 1 "Maximal error must be at least 0.01%."]
    return -1
}
if {$max_iterations < 1} {
    puts [color 1 "You must allow at least 1 iteration."]
    return -1
}

puts [color 2 "Using Parameters:"]
puts [color 2 "  files: $files"]
puts [color 2 "  part: $part"]
puts [color 2 "  period: $period"]
puts [color 2 "  top module: $top"]
puts [color 2 "  max_error_percent: $max_error_percent"]
puts [color 2 "  max_iterations: $max_iterations"]
puts [color 2 "  generics: $generics"]
puts [color 2 "  libraries: $library_files"]


if {[llength $generics] != 0} {
    set generics "-generic [join $generics " -generic "]"
} else {
    set generics ""
}

# Start of the actual script
# --------------------------
# Single shot operations
# ======================
# Read library files first
foreach lf $library_files {
    set lf_split [split $lf "="]
    set lib_name [lindex $lf_split 0]
    set lf_split [lreplace $lf_split 0 0]
    set f [join $lf_split "="]

    puts [color 2 "  Library ${lib_name}: ${f}"]

    # Allow guess of file extension if not provided and does existence check.
    if {[string match *.vhdl $f] || [string match *.vhd $f]} {
        if {[file exists ${f}]} {
            read_vhdl -library $lib_name -vhdl2008 ${f}
        } else {
            puts [color 1 "Error: File ${f} does not exists."]
            return -1
        }
    } else {
        if {[file exists ${f}.vhdl]} {
            read_vhdl -library $lib_name -vhdl2008 ${f}.vhdl
        } elseif {[file exists ${f}.vhd]} {
            read_vhdl -library $lib_name -vhdl2008 ${f}.vhd
        } else {
            puts [color 1 "Error: No vhdl or vhd file exists with name ${f}."]
            return -1
        }
    }
}

# Read the VHDL files, this only needs to happen once.
foreach f $files {
    # Allow guess of file extension if not provided and does existence check.
    if {[string match *.vhdl $f] || [string match *.vhd $f]} {
        if {[file exists ${f}]} {
            read_vhdl -vhdl2008 ${f}
        } else {
            puts [color 1 "Error: File ${f} does not exists."]
            return -1
        }
    } else {
        if {[file exists ${f}.vhdl]} {
            read_vhdl -vhdl2008 ${f}.vhdl
        } elseif {[file exists ${f}.vhd]} {
            read_vhdl -vhdl2008 ${f}.vhd
        } else {
            puts [color 1 "Error: No vhdl or vhd file exists with name ${f}."]
            return -1
        }
    }
}

# Function single_run
# ===================
# Runs the entire synthesis and implementation chain once.
# Returns the period the next run should use.
proc single_run {period} {
    puts [color 5 "Run with period ${period}"]
    puts [color 5 "Synthesis"]

    synth_design -part ${::part} {*}${::generics} -top ${::top} -assert

    # We need a clock, otherwise none of the timings have meaning.
    create_clock -period ${period} -name clk [get_ports CLK]

    puts [color 5 "Place"]
    opt_design
    place_design
    phys_opt_design

    puts [color 5 "Route"]
    route_design

    puts [color 5 "Timing checks"]
    check_timing
    report_timing
}

# Main program loop
# =================
# While we are more than ${max_error_percent}% out, adjust expectations & run again!
set start_time_loop [clock clicks -milliseconds]
puts [color 5 "Start loop."]
set i 0
lappend periods ${period}
while {${i} < ${max_iterations}} {
    incr i

    # Actually run
    set start_time [clock clicks -milliseconds]
    single_run ${period}
    set end_time [clock clicks -milliseconds]

    set slack [get_property SLACK [get_timing_paths]]

    # Sometimes slack is "inf", this returns a null/empty string.
    # This causes syntax errors below.
    if {$slack eq ""} {
        puts [color 1 "SLACK is empty string. This is a problem."]
        report_all
        puts [color 3 "Stopping! Infinite slack!"]
        return 1
    }

    # Vivado is no more accurate than 3 decimal places anyway.
    set period [expr round(1000.0*(${period} - ${slack}))/1000.0];
    set error_precent [expr abs(100*${slack}/${period})]
    set fmax [expr 1000/${period}]

    puts [color 5 "Run $i done with slack: ${slack}ns period: ${period}ns freq: ${fmax}MHz Error: ${error_precent}%"]

    if {${error_precent} < ${max_error_percent}} {
        report_all
        puts [color 2 "Finished!"]
        return 0
    }

    if {[lsearch -exact $periods $period] >= 0} {
        report_all
        puts [color 3 "Stopping! Duplicate period!"]
        return 0
    }
    lappend periods ${period}
}

report_all
puts [color 1 "Stopping! Max iterations!"]
return 1
