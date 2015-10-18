## LTS Haskell: Version your Ecosystem

LTS (Long Term Support) Haskell is a curated set of packages which includes non-breaking point
releases. It is a companion to Stackage Nightly: whereas Stackage Nightly
releases include potentially breaking changes with each new release, LTS
Haskell maintains major version stability for a longer period of time.

Both Stackage Nightly and LTS Haskell are available from [the Stackage
homepage](http://www.stackage.org). More information is available in our
[initial blog
post](https://www.fpcomplete.com/blog/2014/12/backporting-bug-fixes).

This repository contains the build plans for all LTS Haskell releases. Each
release is available on stackage.org following the URL scheme:

    http://www.stackage.org/lts/<major>.<minor>

Similarly, if you would like the newest point release of a release series, just
provide the major version in the URL:

    http://www.stackage.org/lts/<major>

Finally, to access the most recent LTS Haskell release, use the URL:

    http://www.stackage.org/lts

Full Haddocks for each release are available at these URLs as well.

While Stackage Server is currently the only means of using the LTS Haskell
package set, we strongly encourage other means of distribution, such as Linux
package managers. If you are interested in putting together such a release,
please feel free to contact us (via issue tracker, or the [Stackage mailing
list](https://groups.google.com/d/forum/stackage)).

### How it works

LTS Haskell builds on top of the versioning guidelines of Haskell's [Package
Versioning
Policy](https://www.haskell.org/haskellwiki/Package_versioning_policy), where
authors indicate a breaking changing by bumping either the first or second numbers
in the version number, and indicate point releases and bug fixes by changing
any of the other numbers.

With LTS Haskell, we start with a new major release, let's say 7.0. 7.0 has
selected a set of packages and their version numbers. When it comes time to
release 7.1, we select all packages with matching *major version numbers*,
which indicates that they have a backwards-compatible API. We then run a normal
build/test process to ensure that everything works as expected, and then
release 7.1.

By following the pattern, you can target the 7.X series of releases and have a
high degree of confidence that you will continue to get bug fixes and feature
enhancements, without needing to change your code to match upstream API
changes.

All of this is done using the Stackage code base; you can [see the description
of the code](https://github.com/fpco/stackage/#lts) for more details.

### Fast global install for default cabal-install on Linux

For Linux user, If you install cabal-install by default.

The Cabal default path will be $HOME/.cabal.

This is a quick global install for default cabal-install for linux users.

Unix should working as well.

```bash
curl -sS http://www.stackage.org/snapshot/lts-1.7/cabal.config\?global\=true >> $HOME/.cabal/config
```

### Possible breakage

It is still possible to have breaking when upgrading to a new point release.
Some examples are:

* A package author may make a mistake and introduce a bug, change semantics, or
  break the API of his/her code.
* If you import modules unqualified and without explicit import lists, a newly
  exposed identifier may conflict with an existing identifier.
* A new module name may clash with an existing module name.

These are all standard caveats that apply when following PVP versioning. The
point here is that, while LTS Haskell greatly reduces the amount of breakage
that may occur, you still need to check your code before upgrading.
