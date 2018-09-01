// Type for a collection of files (monoidal)
vtypedef file = @{ lines = int, blanks = int, comments = int, files = int }

// Program state, tracking *all* supported file types in an unboxed structure.
vtypedef source_contents = @{ rust = file
                            , haskell = file
                            , ats = file
                            , python = file
                            , vimscript = file
                            , elm = file
                            , idris = file
                            , madlang = file
                            , tex = file
                            , markdown = file
                            , yaml = file
                            , toml = file
                            , cabal = file
                            , happy = file
                            , alex = file
                            , go = file
                            , html = file
                            , css = file
                            , verilog = file
                            , vhdl = file
                            , c = file
                            , purescript = file
                            , futhark = file
                            , brainfuck = file
                            , ruby = file
                            , julia = file
                            , perl = file
                            , ocaml = file
                            , agda = file
                            , cobol = file
                            , tcl = file
                            , r = file
                            , lua = file
                            , cpp = file
                            , lalrpop = file
                            , header = file
                            , sixten = file
                            , dhall = file
                            , ipkg = file
                            , makefile = file
                            , justfile = file
                            , ion = file
                            , bash = file
                            , dash = file
                            , hamlet = file
                            , cassius = file
                            , lucius = file
                            , julius = file
                            , mercury = file
                            , yacc = file
                            , lex = file
                            , coq = file
                            , jupyter = file
                            , java = file
                            , scala = file
                            , erlang = file
                            , elixir = file
                            , pony = file
                            , clojure = file
                            , cabal_project = file
                            , assembly = file
                            , nix = file
                            , php = file
                            , javascript = file
                            , kotlin = file
                            , fsharp = file
                            , fortran = file
                            , swift = file
                            , csharp = file
                            , nim = file
                            , cpp_header = file
                            , elisp = file
                            , plaintext = file
                            , rakefile = file
                            , llvm = file
                            , autoconf = file
                            , batch = file
                            , powershell = file
                            , m4 = file
                            , objective_c = file
                            , automake = file
                            , margaret = file
                            , carp = file
                            , shen = file
                            , greencard = file
                            , cmm = file
                            , fluid = file
                            , plutus = file
                            , j = file
                            , blodwen = file
                            , crystal = file
                            , racket = file
                            , ada = file
                            , sml = file
                            , isabelle = file
                            , fstar = file
                            , d = file
                            , factor = file
                            , scheme = file
                            , chapel = file
                            , pascal = file
                            , ragel = file
                            , xml = file
                            , awk = file
                            , sed = file
                            , k = file
                            , typescript = file
                            , coffeescript = file
                            , red = file
                            , fish = file
                            , vb = file
                            , frege = file
                            , dart = file
                            , solidity = file
                            , egison = file
                            , zig = file
                            , sql = file
                            , felix = file
                            , qsharp = file
                            , oz = file
                            , jai = file
                            , zimpl = file
                            , volt = file
                            , cogent = file
                            , clean = file
                            , thrift = file
                            , vala = file
                            , apex = file
                            , sas = file
                            }

// Reference to source_contents; used to update the structure.
vtypedef source_contents_r = ref(source_contents)

// Sum type representing all supported data types.
datavtype pl_type =
  | unknown
  | rust of file
  | haskell of file
  | perl of file
  | verilog of file
  | vhdl of file
  | agda of file
  | futhark of file
  | ats of file
  | idris of file
  | python of file
  | elm of file
  | purescript of file
  | vimscript of file
  | ocaml of file
  | madlang of file
  | tex of file
  | markdown of file
  | yaml of file
  | toml of file
  | cabal of file
  | happy of file
  | alex of file
  | go of file
  | html of file
  | css of file
  | c of file
  | brainfuck of file
  | ruby of file
  | julia of file
  | cobol of file
  | tcl of file
  | r of file
  | lua of file
  | cpp of file
  | lalrpop of file
  | header of file
  | sixten of file
  | dhall of file
  | ipkg of file
  | makefile of file
  | justfile of file
  | ion of file
  | bash of file
  | dash of file
  | hamlet of file
  | cassius of file
  | lucius of file
  | julius of file
  | mercury of file
  | yacc of file
  | lex of file
  | coq of file
  | jupyter of file
  | java of file
  | scala of file
  | erlang of file
  | elixir of file
  | pony of file
  | clojure of file
  | cabal_project of file
  | assembly of file
  | nix of file
  | php of file
  | javascript of file
  | kotlin of file
  | fsharp of file
  | fortran of file
  | swift of file
  | csharp of file
  | nim of file
  | cpp_header of file
  | elisp of file
  | rakefile of file
  | plaintext of file
  | llvm of file
  | autoconf of file
  | batch of file
  | powershell of file
  | m4 of file
  | objective_c of file
  | automake of file
  | margaret of file
  | carp of file
  | shen of file
  | greencard of file
  | cmm of file
  | fluid of file
  | plutus of file
  | j of file
  | blodwen of file
  | crystal of file
  | racket of file
  | ada of file
  | sml of file
  | isabelle of file
  | fstar of file
  | d of file
  | factor of file
  | scheme of file
  | chapel of file
  | pascal of file
  | ragel of file
  | xml of file
  | awk of file
  | sed of file
  | k of file
  | typescript of file
  | coffeescript of file
  | red of file
  | fish of file
  | vb of file
  | frege of file
  | dart of file
  | solidity of file
  | egison of file
  | zig of file
  | sql of file
  | felix of file
  | qsharp of file
  | oz of file
  | jai of file
  | zimpl of file
  | volt of file
  | cogent of file
  | clean of file
  | thrift of file
  | vala of file
  | apex of file
  | sas of file
