Mindex 1.1.0
------------

The main reason for this change was upgrading to Python 3
given the pending support EOL for Python 2 at the end of the year.
I took the opportunity to also clean up the code a little bit.
As such, almost all changes are under the hood.

The only noticeable change from a user perspective will likely be
that the title of the index will no longer collide with index entries
if the index is particularly full.