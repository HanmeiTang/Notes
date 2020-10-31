# Directing Input and Output

## Standard input and standard output
### Standard input
- stdin
- keyboard
- /dev/stdin
### Standard output
- stdout
- text terminal
- /dev/stdout

## Directing input from a file
1. input, output must be a file, so 'INCAR' must be a file
2. input always comes first, then output

### `<` input
```bash
$ wc < INCAR # use INCAR as input
      28      84     327
$ wc INCAR # use INCAR as wc aurgument
      28      84     327 INCAR
      
# use input and output
$ sort < INCAR > INCAR.sort 
```

```bash
# input must be a file
$ sort < cat INCAR      # trick: try $ sort < "$(cat INCAR)"
-bash: cat: No such file or directory

# output must to a file, from some screen output
# And if you use cat, you will have a file "sort"
$ INCAR > sort
-bash: INCAR: command not found
```

## Piping output to input `|`
```bash
$ cat INCAR  | grep ISMEAR
ISMEAR = 0

$ cat INCAR | sort
ALGO = Fast
EDIFF = 5e-05
...
NSW = 200
POTIM = 0
PREC = Accurate
SIGMA = 0.05

$ cat sort | less
```

## Suppressing output
```bash
# "null device", "bit bucket", "black hole"
# Similar t special files /dev/stdin and /dev/stdout
# Unix discards any data sent there
$  ls /dev/null
/dev/null

$ cat INCAR > /dev/null 

# Absolutely no output
$ echo < /dev/null 
```
