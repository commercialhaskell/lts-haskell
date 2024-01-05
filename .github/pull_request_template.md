Checklist for adding a package:
- [ ] Meaningful commit message, eg `add my-cool-package` (please don't mention the yaml file)
- [ ] Package is already added to nightly (if possible)
- [ ] On your machine, in a new directory, you have successfully run the following set of commands (replacing $package and $version with the name and version of the package you want to add to Stackage LTS):

      stack unpack $package-$version
      cd $package-$version
      stack init --resolver lts
      stack --resolver lts build --haddock --test --bench --no-run-benchmarks

or using the [verify-package script](https://github.com/commercialhaskell/stackage/blob/master/verify-package):

      verify-package $package lts
