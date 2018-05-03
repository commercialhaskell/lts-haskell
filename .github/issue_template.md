Checklist for adding a package:
- [ ] specified the Stackage LTS version in the summary
- [ ] On your own machine, in a new directory, you have succesfully run the following set of commands (replace `$package` with the name of the package that is submitted, `$version` is the version of the package you want to get into the LTS series, and `$lts` is the desired LTS series):

      stack unpack $package-$version
      cd $package-$version
      stack init --resolver lts-$lts
      stack build --haddock --test --bench --no-run-benchmarks
