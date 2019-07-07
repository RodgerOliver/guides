# Regular Expression (RegEx)
Regular expressions are used for pattern matching, text manipulation and parsing data.

# Literal Matches
```
/foo bar/
# /\-/ escape character

foo
foo ba
*foo bar*
```

# Character Classes
Match chars in brackets. Accept range as Ascii table.

```
/[aeoiuy]/
# /[^aeoiuy]/ negation
# /[a-zA-Z0-9]/ range

*a*bcd*e*fgh*i*jklmn*o*pqrst*u*vwx*y*z
```

# Alterations
OR operator.

```
/foo|bar/

*foo*
*bar*
*foo bar*
```
# Metacharacters

```
/./ every character, except new line
/\w/ word
/\W/ not word
/\b/ boundary
/\d/ digit
/\D/ not digit
/\s/ every space, including tabs
/\S/ not space
/\t/ tab
/\n/ new line
```

# Quantifiers

```
/*/ zero or more times
/+/ one or more times

/[a-z]*/ match whole words
/[0-9]*/ match whole numbers
/\d+/ match whole numbers

/<p>.*</p>/ greedy match

*<p>Paragraph 1</p><p>Paragraph 2</p><p>Paragraph 3</p>*

/<p>.*?</p>/ non greedy

*<p>Paragraph 1</p>**<p>Paragraph 2</p>**<p>Paragraph 3</p>*

/https?:\/\/.*/ make *s* optional

*http://foo.com*
*https://bar.com*
```

# Iterations

```
/a{2,6}/
/a{6}/

*aaaaaa*a
```

# Capture and Non Capture Groups

```
Capture Group
/(cat)\1/ invoke the content of the capture group
/(cat)/

*cat*dog*cat*

Non Capture Group
/(?:foo)/ doensn't capture to the memory
```

# Lookarounds

```
Positive Lookahead
/foo(?=\ bar)/

foo baz
fo bar
*foo* bar

Negative Lookahead
/foo(?!\ bar)/

*foo* baz
fo bar
foo bar

Positive Lookbehind
/(?<=foo\ )bar/

foo baz
fo bar
foo *bar*

Negative Lookbehind
/(?<!foo\ )bar/

foo baz
fo *bar*
foo bar
```

# Anchors

```
/^hello$/

*hello*
hello world
say hello
```

# Modifiers

```
/(?m)^\w+/ apply to all lines
/[a-z]/i case insensitive
/(?s).+/ accept new lines
/(?x).+/ accept comments and multi lines in the regex
```
