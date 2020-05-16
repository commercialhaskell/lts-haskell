Checklist for adding a package:

- [ ] On your own machine, in a new directory, you have successfully run the following set of commands (replace `$package` with the name of the package that is submitted, `$version` with the version of the package you want to get into the LTS series, and `$lts` with the desired LTS series):

      stack unpack $package-$version
      cd $package-$version
      stack init --resolver lts
      stack --resolver lts build --haddock --test --bench --no-run-benchmarks

- [ ] You're using the latest version of Stack. (Otherwise please try running `stack upgrade` and re-running your commands. If that fails, please include the output of `stack --version` in this issue.)
