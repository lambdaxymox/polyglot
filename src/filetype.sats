typedef source_contents = @{ rust = int
                           , haskell = int
                           , ats = int
                           , python = int
                           , vimscript = int
                           , elm = int
                           , idris = int
                           , madlang = int
                           , tex = int
                           , markdown = int
                           , yaml = int
                           , toml = int
                           , cabal = int
                           , happy = int
                           , alex = int
                           , go = int
                           , html = int
                           , css = int
                           , verilog = int
                           , vhdl = int
                           , c = int
                           , purescript = int
                           , futhark = int
                           , brainfuck = int
                           , ruby = int
                           , julia = int
                           , perl = int
                           , ocaml = int
                           , agda = int
                           , cobol = int
                           , tcl = int
                           , r = int
                           , lua = int
                           , cpp = int
                           , lalrpop = int
                           , header = int
                           , sixten = int
                           , dhall = int
                           , ipkg = int
                           , makefile = int
                           , justfile = int
                           , ion = int
                           , bash = int
                           }

typedef source_contents_r = ref(source_contents)

datatype pl_type =
  | unknown
  | rust of int
  | haskell of int
  | perl of int
  | verilog of int
  | vhdl of int
  | agda of int
  | futhark of int
  | ats of int
  | idris of int
  | python of int
  | elm of int
  | purescript of int
  | vimscript of int
  | ocaml of int
  | madlang of int
  | tex of int
  | markdown of int
  | yaml of int
  | toml of int
  | cabal of int
  | happy of int
  | alex of int
  | go of int
  | html of int
  | css of int
  | c of int
  | brainfuck of int
  | ruby of int
  | julia of int
  | cobol of int
  | tcl of int
  | r of int
  | lua of int
  | cpp of int
  | lalrpop of int
  | header of int
  | sixten of int
  | dhall of int
  | ipkg of int
  | makefile of int
  | justfile of int
  | ion of int
  | bash of int
