#  FPGA Performance Suite
#
#  Copyright (c) 2019 Dries Kennes <admin@dries007.net>
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to
#  deal in the Software without restriction, including without limitation the
#  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
#  sell copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
#  IN THE SOFTWARE.

# Vivado automatic Fmax finding TCL script
# Run with: `vivado -mode batch -nojournal -nolog -notrace -source vivado_fmax.tcl -tclargs <arguments>`

# The multithreading happens in higher levels, so let's not overwhelm that.
set_param general.maxThreads 1
set_param synth.maxThreads 1

# Don't print the CPU/MEM stats. We calculate the time internally, it's just more clutter.
set_param tcl.statsThreshold -1

# Function color
# ==============
# Returns Unix escape code string for colored text if color has not been disabled.
# Thanks https://stackoverflow.com/a/25522158 & https://unix.stackexchange.com/a/269085
# Color     #define         Value   RGB
# black     COLOR_BLACK       0     0, 0, 0
# red       COLOR_RED         1     max,0,0
# green     COLOR_GREEN       2     0,max,0
# yellow    COLOR_YELLOW      3     max,max,0
# blue      COLOR_BLUE        4     0,0,max
# magenta   COLOR_MAGENTA     5     max,0,max
# cyan      COLOR_CYAN        6     0,max,max
# white     COLOR_WHITE       7     max,max,max
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

    # NOT USED, but might be useful when debugging.

    report_bus_skew                  -quiet -verbose -file report/bus_skew.txt
    report_carry_chains              -quiet -verbose -file report/carry_chains.txt
    report_cdc                       -quiet -verbose -file report/cdc.txt
    report_clock_interaction         -quiet -verbose -file report/clock_interaction.txt
    report_clock_networks            -quiet -verbose -file report/clock_networks.txt
    
    report_clocks                    -quiet -verbose -file report/clocks.txt
    report_compile_order             -quiet -verbose -file report/compile_order.txt
    report_config_timing             -quiet -verbose -file report/config_timing.txt
    report_control_sets              -quiet -verbose -file report/control_sets.txt
    report_datasheet                 -quiet -verbose -file report/datasheet.txt
    report_debug_core                -quiet -verbose -file report/debug_core.txt
    report_design_analysis           -quiet -verbose -file report/design_analysis.txt
    # report_disable_timing            -quiet -verbose -file report/disable_timing.txt
    # report_drc                       -quiet -verbose -file report/drc.txt
    report_environment               -quiet -verbose -file report/environment.txt
    report_exceptions                -quiet -verbose -file report/exceptions.txt
    report_high_fanout_nets          -quiet -verbose -file report/high_fanout_nets.txt
    report_incremental_reuse         -quiet -verbose -file report/incremental_reuse.txt
    report_io                        -quiet -verbose -file report/io.txt
    report_ip_status                 -quiet -verbose -file report/ip_status.txt
    report_methodology               -quiet -verbose -file report/methodology.txt
    report_operating_conditions      -quiet -verbose -file report/operating_conditions.txt
    report_param                     -quiet -verbose -file report/param.txt
    report_phys_opt                  -quiet -verbose -file report/phys_opt.txt
    report_pipeline_analysis         -quiet -verbose -file report/pipeline_analysis.txt
    report_power                     -quiet -verbose -file report/power.txt
    # report_power_opt                 -quiet -verbose -file report/power_opt.txt
    report_pr_configuration_analysis -quiet -verbose -file report/pr_configuration_analysis.txt
    report_property                  -quiet -verbose -file report/property.txt
    report_pulse_width               -quiet -verbose -file report/pulse_width.txt
    report_qor_suggestions           -quiet -verbose -file report/qor_suggestions.txt
    report_ram_utilization           -quiet -verbose -file report/ram_utilization.txt
    report_route_status              -quiet -verbose -file report/route_status.txt
    report_sim_device                -quiet -verbose -file report/sim_device.txt
    report_simlib_info               -quiet -verbose -file report/simlib_info.txt
    report_ssn                       -quiet -verbose -file report/ssn.txt
    report_switching_activity        -quiet -verbose -file report/switching_activity.txt
    report_synchronizer_mtbf         -quiet -verbose -file report/synchronizer_mtbf.txt
    report_timing                    -quiet -verbose -file report/timing.txt
    report_timing_summary            -quiet -verbose -file report/timing_summary.txt
    report_transformed_primitives    -quiet -verbose -file report/transformed_primitives.txt
    
    report_utilization -hierarchical -quiet -verbose -file report/utilization_h.txt

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
#
# Single shot operations
# ======================
#

# Ignore some messages if not verbose
if {! $verbose} {
    # Only show 5 instead of default (~100)

    ## Synthesis
    ### INFO: [Synth 8-3886] merging instance X to Y
    set_msg_config -id {[Synth 8-3886]} -limit 5

    # Totally ignore

    ## License
    ### INFO: [Common 17-349] Got license for feature 'X' and/or device 'Y'
    set_msg_config -suppress -id {[Common 17-349]}
    ### INFO: [Common 17-1223] The version limit for your license is 'X' and will expire in Y days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
    set_msg_config -suppress -id {[Common 17-1223]}

    ## Starting task
    ### INFO: [DRC 23-27] Running DRC with X threads
    set_msg_config -suppress -id {[DRC 23-27]}
    ### INFO: [Project 1-571] Translating synthesized netlist
    set_msg_config -suppress -id {[Project 1-571]}
    ### INFO: [Project 1-570] Preparing netlist for logic optimization
    set_msg_config -suppress -id {[Project 1-570]}
    ### INFO: [Place 30-611] Multithreading enabled for place_design using a maximum of X CPUs
    set_msg_config -suppress -id {[Place 30-611]}
    ### INFO: [Physopt 32-721] Multithreading enabled for phys_opt_design using a maximum of X CPUs
    set_msg_config -suppress -id {[Physopt 32-721]}
    ### INFO: [Physopt 32-246] Starting Signal Push optimization...
    set_msg_config -suppress -id {[Physopt 32-246]}
    ### INFO: [Route 35-254] Multithreading enabled for route_design using a maximum of X CPUs
    set_msg_config -suppress -id {[Route 35-254]}

    ## Done with task
    ### INFO: [Synth 8-256] done synthesizing module
    set_msg_config -suppress -id {[Synth 8-256]}
    ### INFO: [Vivado_Tcl 4-198] DRC finished with 0 Errors
    set_msg_config -suppress -id {[Vivado_Tcl 4-198]}
    ### INFO: [Vivado_Tcl 4-199] Please refer to the DRC report (report_drc) for more information.
    set_msg_config -suppress -id {[Vivado_Tcl 4-199]}
    ### INFO: [Project 1-461] DRC finished with 0 Errors
    set_msg_config -suppress -id {[Project 1-461]}
    ### INFO: [Project 1-462] Please refer to the DRC report (report_drc) for more information.
    set_msg_config -suppress -id {[Project 1-462]}
    ### INFO: [Timing 38-35] Done setting XDC timing constraints.
    set_msg_config -suppress -id {[Timing 38-35]}
}

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

    # [unused] "Out of Context" mode is used to disable IO buffering and unused IO elimination. (-mode out_of_context)
    # "Assert" allows the VHDL code to stop the synthesis if an assert is of level 'failure'

    # TCL syntax: '::' -> Global namespace, '{*}' -> Expand var to individual arguments
    synth_design -part ${::part} {*}${::generics} -top ${::top} -assert

    # We need a clock, otherwise none of the timings have meaning (if they generate at all, most will say N/A)
    # But we can't add a clock before synthesis
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

    # Sometimes slack is "inf", this returns a null/empty string. This causes syntax errors below.
    if {$slack eq ""} {
        puts [color 1 "SLACK is empty string. This is a problem."]
        report_all
        puts [color 3 "Stopping! Infinite slack! Total time: [expr ($end_time - $start_time_loop)/1000]s"]
        return 1
    }

    # Vivado is no more accurate than 3 decimal places anyway.
    set period [expr round(1000.0*(${period} - ${slack}))/1000.0];
    set error_precent [expr abs(100*${slack}/${period})]
    set fmax [expr 1000/${period}]

    puts [color 5 "Run $i done with slack: ${slack}ns period: ${period}ns freq: ${fmax}MHz Error: ${error_precent}% in [expr ($end_time - $start_time)/1000]s"]

    if {${error_precent} < ${max_error_percent}} {
        report_all
        puts [color 2 "Finished! Total time: [expr ($end_time - $start_time_loop)/1000]s"]
        return 0
    }

    if {[lsearch -exact $periods $period] >= 0} {
        report_all
        puts [color 3 "Stopping! Duplicate period! Total time: [expr ($end_time - $start_time_loop)/1000]s"]
        return 0
    }
    lappend periods ${period}
}

report_all
puts [color 1 "Stopping! Max iterations! Total time: [expr ($end_time - $start_time_loop)/1000]s"]
return 1
