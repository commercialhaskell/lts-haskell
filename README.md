## LTS Haskell: Version your Ecosystem

LTS Haskell is a curated set of packages which includes non-breaking point
releases. It is a complement to Stackage Nightly; whereas Stackage Nightly
releases breaking changes with each new release, LTS Haskell maintains major
version stability for a longer period of time.

Both Stackage Nightly and LTS Haskell are available from [the Stackage
homepage](http://www.stackage.org). More information is available in our
[initial blog
post](https://www.fpcomplete.com/blog/2014/12/backporting-bug-fixes).

This repository contains the build plans for all LTS Haskell releases. Each
release is available on stackage.org following the URL scheme:

    http://www.stackage.org/lts/<major>.<minor>

Similarly, if you would like the newest point release of a release series, just
provide the major version in the URL:

    http://www.stackage.org/lts/<major>.<minor>

Finally, to access the most recent LTS Haskell release, use the URL:

    http://www.stackage.org/lts

Full Haddocks for each release are available at these URLs as well.

While Stackage Server is currently the only means of using the LTS Haskell
package set, we strongly encourage other means of distribution, such as Linux
package managers. If you are interested in putting together such a release,
please feel free to contact us (via issue tracker, or the [Stackage mailing
list](https://groups.google.com/d/forum/stackage)).
