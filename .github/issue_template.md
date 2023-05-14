Checklist for adding a package:

- [ ] On your machine, in a new directory, you have successfully run the following set of commands (replacing $package and $version with the name and version of the package you want to add to Stackage LTS):

      stack unpack $package-$version
      cd $package-$version
      stack init --resolver lts
      stack --resolver lts build --haddock --test --bench --no-run-benchmarks

or using the [verify-package script](https://github.com/commercialhaskell/stackage/blob/master/verify-package):

      verify-package $package lts

- [ ] You're using the latest version of Stack. (Otherwise please try running `stack upgrade` and re-running your commands. If that fails, please include the output of `stack --version` in this issue.)
