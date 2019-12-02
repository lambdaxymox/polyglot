staload "libats/ML/SATS/string.sats"
staload _ = "libats/ML/DATS/string.dats"
staload UN = "prelude/SATS/unsafe.sats"
staload "SATS/error.sats"
staload "$PATSHOMELOCS/edit-distance-0.5.0/SATS/edit-distance.sats"

#include "DATS/version.dats"

// Type for the parsed command-line arguments.
vtypedef command_line = @{ version = bool
                         , help = bool
                         , no_table = bool
                         , html = bool
                         , no_style = bool
                         , no_parallel = bool
                         , no_colorize = bool
                         , skip_links = bool
                         , verbose = bool
                         , excludes = [m:nat] list(string, m)
                         , includes = [m:nat] list(string, m)
                         }

fn version() : void =
  {
    val () = println!("polygot version 0.5.27")
    val () = compiler_version()
    val () = libc_version()
    val () = println!("\nCopyright (c) 2018-2019 Vanessa McHale")
  }

fn help() : void =
  print("polyglot - Count lines of code quickly.
\33[36mUSAGE:\33[0m poly [DIRECTORY] ... [OPTION] ...
\33[36mFLAGS:\33[0m
    -V, --version            show version information
    -h, --help               display this help and exit
    -e, --exclude            exclude a directory
    -c, --no-color           do not colorize output
    -p, --no-parallel        do not execute in parallel
    -t, --no-table           display results in alternate format
    -v, --verbose            display per-file results
    --html                   dump HTML output
    -s, --no-style           do not add CSS styles to HTML output
 
    When no directory is provided poly will execute in the
    current directory.
 
    Bug reports and updates: github.com/vmchale/polyglot\n")

fn is_flag(s : string) : bool =
  string_is_prefix("-", s)

fun process_short { s : int | s > 0 }(s : string(s), acc : command_line, fail : bool) : command_line =
  let
    var str = string_make_substring(s, i2sz(0), i2sz(1))
    var acc_r = ref<command_line>(acc)
    val () = case+ str of
      | "h" => acc_r -> help := true
      | "p" => if not(acc.no_parallel) then
        acc_r -> no_parallel := true
      else
        bad_flag("-p")
      | "t" => if not(acc.no_table) then
        acc_r -> no_table := true
      else
        bad_flag("-t")
      | "e" => bad_exclude("-e")
      | "c" => acc_r -> no_colorize := true
      | "s" => acc_r -> no_style := true
      | "V" => acc_r -> version := true
      | "v" => acc_r -> verbose := true
      | "-" when fail => ( println!("\33[31mError:\33[0m failed to parse command-line flags. Try 'poly --help'.")
                         ; exit(1)
                         ; ()
                         )
      | "-" => ()
      | _ => (println!("\33[31mError:\33[0m flag '" + s + "' not recognized") ; exit(1) ; ())
    
    extern
    castfn witness(s : string) : [ n : nat | n > 0 ] string(n)
    
    val inter = !acc_r
  in
    if length(s) > 1 then
      process_short(witness(string_make_substring(s, i2sz(1), length(s))), inter, true)
    else
      inter
  end

fun process(s : string, acc : command_line, is_first : bool) : command_line =
  let
    extern
    castfn witness(s : string) : [ s : nat | s > 0 ] string(s)
    
    fn process(s : string) : string =
      case+ s of
        | ".." => "../"
        | _ => s
    
    fn unrecognized(s : string, flag : string) : void =
      (println!("\33[31mError:\33[0m flag '" + s + "' not recognized. Did you mean '" + flag + "'?") ; exit(1) ; ())
    
    var acc_r = ref<command_line>(acc)
    val () = if is_flag(s) then
      case+ s of
        | "--help" => acc_r -> help := true
        | "-h" => acc_r -> help := true
        | "--html" => acc_r -> html := true
        | "--no-table" => if not(acc.no_table) then
          acc_r -> no_table := true
        else
          bad_flag(s)
        | "-t" => if not(acc.no_table) then
          acc_r -> no_table := true
        else
          bad_flag(s)
        | "--no-parallel" => if not(acc.no_parallel) then
          acc_r -> no_parallel := true
        else
          bad_flag(s)
        | "-p" => if not(acc.no_parallel) then
          acc_r -> no_parallel := true
        else
          bad_flag(s)
        | "--version" => acc_r -> version := true
        | "-V" => acc_r -> version := true
        | "--verbose" => acc_r -> verbose := true
        | "-v" => acc_r -> verbose := true
        | "--no-color" => acc_r -> no_colorize := true
        | "-c" => acc_r -> no_colorize := true
        | "--no-style" => acc_r -> no_style := true
        | "-s" => acc_r -> no_style := true
        | "-e" => bad_exclude(s)
        | "--exclude" => bad_exclude(s)
        | "-" => error_flag(s)
        | _ when levenshtein_(s, "--exclude") <= 2 => unrecognized(s, "--exclude")
        | _ when levenshtein_(s, "--help") <= 2 => unrecognized(s, "--help")
        | _ when levenshtein_(s, "--html") <= 2 => unrecognized(s, "--html")
        | _ when levenshtein_(s, "--no-parallel") <= 3 => unrecognized(s, "--no-parallel")
        | _ when levenshtein_(s, "--no-table") <= 3 => unrecognized(s, "--no-table")
        | _ when levenshtein_(s, "--no-style") <= 3 => unrecognized(s, "--no-style")
        | _ => let
          val new_acc = process_short(witness(s), acc, false)
          val _ = acc_r -> help := new_acc.help
          val _ = acc_r -> no_parallel := new_acc.no_parallel
          val _ = acc_r -> version := new_acc.version
          val _ = acc_r -> verbose := new_acc.verbose
          val _ = acc_r -> no_table := new_acc.no_table
          val _ = acc_r -> no_colorize := new_acc.no_colorize
        in
          ()
        end
    else
      if not(is_first) then
        acc_r -> includes := list_cons(process(s), acc.includes)
      else
        ()
  in
    !acc_r
  end

fn process_excludes(s : string, acc : command_line) : command_line =
  let
    var acc_r = ref<command_line>(acc)
    val () = if is_flag(s) then
      bad_directory(s)
    else
      acc_r -> excludes := list_cons(s, acc.excludes)
  in
    !acc_r
  end

// TODO minor problem in how exclusions are handled with short flags
fun get_cli { n : int | n >= 1 }{ m : nat | m < n } .<n-m>. ( argc : int(n)
                                                            , argv : !argv(n)
                                                            , current : int(m)
                                                            , prev_is_exclude : bool
                                                            , acc : command_line
                                                            ) : command_line =
  let
    var arg = argv[current]
  in
    if current < argc - 1 then
      if arg != "--exclude" && arg != "-e" then
        let
          val c = get_cli(argc, argv, current + 1, false, acc)
        in
          if prev_is_exclude && current != 0 then
            process_excludes(arg, c)
          else
            if current != 0 then
              process(arg, c, current = 0)
            else
              c
        end
      else
        let
          val c = get_cli(argc, argv, current + 1, true, acc)
        in
          c
        end
    else
      if prev_is_exclude then
        process_excludes(arg, acc)
      else
        process(arg, acc, current = 0)
  end

fn check_cli(chk : command_line) : void =
  if chk.no_style && not(chk.html) then
    redundant_cli_flag()
  else
    ()
