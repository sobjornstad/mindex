**Mindex** is a tool to quickly generate a small, nicely formatted index
for a book or some other small task.
I created it because I was getting tired
of hand-writing zillions of little tiny index entries into my books
and wanted to be able to paste something nice-looking into them
with a minimum of effort.


Dependencies
============

Mindex uses LaTeX to format the index.
It requires a working LaTeX installation with `pdflatex` on the path.
It also requires the following packages:
`geometry`, `inputenc`, `multicol`, `idxlayout`, `titlesec`, and `mathpazo`.
The last one is simply a font,
so if you don’t have it,
you may remove it from the source and use Computer Modern
or any other font you like instead.

Otherwise, nothing special is required;
everything else is in the Python standard libraries.


Creating an input file
======================

Before using Mindex, you need to create your index.
The file format is dead-simple;
it uses three tab-separated columns in a text file:

* **Column 1**: The index entries (i.e. the keyword part).
* **Column 2**: The page numbers,
                or anything else you want to appear after the comma.
* **Column 3** (optional): A sort key.

That final one deserves a little more explanation.
First of all, “optional” here means
that you can choose to include that column or not in any given row;
if you don’t need a sort key,
you don’t have to insert the tab with a blank column.
(It’s also fine if you do;
 for instance, if you make the file in a spreadsheet,
 it will probably want to fill in the tabs.
 As long as there’s nothing after the second tab,
 Mindex will treat it as if it were absent.)

But you’re probably still wondering what a sort key *is*.
This is perhaps best shown by example:
if you have an entry such as `"a quoted saying"`,
`_Anna Karenina_`,
or `The Bible`,
then the indexer will alphabetize the entry
either at the very beginning or end of all entries
for entries with punctuation
or under “the” or a similarly-devoid-of-content word.
(This is a nearly universal problem with computerized sorting.)
In lieu of a complicated routine
to figure out whether punctuation and small words are relevant,
Mindex allows you to give a sort key
that specifies that you’d like that entry to sort
as if it were the sort key rather than its actual self.
For the examples above,
we’d probably write `a quoted saying`, `Anna Karenina`, and `Bible`,
but if you fancy,
you could just as easily write `ZZZZ this comes at the end of the alphabet`
and cause it to be sorted at the end of the list.
The sort key is never displayed anywhere on the final output.

As you should have gathered from the above discussion,
Mindex automatically alphabetizes the rows you enter,
so there is no need to worry about that beforehand.
If you include multiple page numbers or other content in the second column,
however, you do need to order those yourself in whatever order you’d like.

You can include raw LaTeX formatting code in this file,
such as \emph{} or \textsc{} or weirder things.
If you’re not familiar with writing documents in LaTeX or some derivative,
there are two major gotchas:

* If you want your quotation marks to curve the right way,
  opening quotes need to be represented as ``` `` ```.
  Closing quotes can be either `"` or `''`.
* Hash signs (`#`) and ampersands (`&`)
  need to be escaped with a backslash: `\#`, `\&`.

Italics can be written `\emph{italicized text}`,
boldface `\textbf{bold text}`,
and small caps `\textsc{Small Caps}`.
A couple of these things are demonstrated in the included `example.mindex` file.

Lines beginning with the comment character # and blank lines are ignored.

Simple vim syntax and ftplugin files
with hopefully sensible defaults for editing `.mindex` files
are provided in the `vim/` subdirectory.


Running Mindex
==============

Mindex is a small program and is packaged as a single file, `mindex.py`.
You run it with one command-line option, the name of the file to use.
You then have to specify a couple of parameters interactively:

* **Title**: This appears at the top of the index above the first entries.
* **X and Y dimensions**: How wide and tall the index should be.
Mindex, being a program for (m)iniature (index)es,
is not designed to work with indexes that exceed a page in size
(it will do its best,
 but it is not optimized for this situation, so it may not do so hot).
The dimensions also need to be smaller than the paper size with a small margin.
If you use a different standard paper size than US Letter (8.5in by 11in),
you can change the values of PAPER_DIMS at the top of the source.

Mindex will then attempt to compile a document to these specifications
using the input file.
It will estimate an appropriate number of columns
and work out the margins based on your provided paper sizes,
then format the entries,
put them onto the page,
create a temporary file,
and run `pdflatex` on it.
If you’d like to change the LaTeX headers
that are used for compiling the document,
these can be found at the top of the source file.

If all goes well, Mindex will open a preview in your PDF viewer.
If you like it, you can print it from here and quit Mindex.
If you’d like to tweak the margins, change the title, or so on,
you can choose yes;
Mindex will open a short menu
that you can use to customize the parameters to your liking.
Keep the PDF viewer open – Mindex will update the file in place,
so you should see the changes as they are made.
