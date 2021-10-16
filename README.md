# Args

Args is a simple (44 sloc) pure Janet module for parsing command line flags.

Unlike argparse and it's ilk, this module only parses flags without arguments.

## install

Use JPM
```sh
sudo jpm install https://github.com/MorganPeterson/args.git
```

## examples

Run simple.janet script for an example of usage.

```sh
janet simple.janet -a -b -cd -x --help
```

The above should produce the following output:

```
A flag found
B flag found
C flag found
D flag found
don't recognize flag x
help message
```
