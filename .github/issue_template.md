Checklist for adding a package:

- [ ] On your own machine, in a new directory, you have successfully run the following set of commands:

      stack unpack $package-$version
      cd $package-$version
      stack init --resolver lts
      stack --resolver lts build --haddock --test --bench --no-run-benchmarks

(replacing `$package` with the name of the package that is submitted and `$version` with the version of the package you want to get into latest LTS).

- [ ] You're using the latest version of Stack. (Otherwise please try running `stack upgrade` and re-running your commands. If that fails, please include the output of `stack --version` in this issue.)
