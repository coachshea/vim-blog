---
title: Text Objects
author: ~
date: '2018-01-22'
slug: text-objects
categories: []
tags: [vim, neovim, nvim, text objects]

---

Text objects are a powerful feature of Vim. Yet many users, even some who have
used Vim for a long time, don't always fully appreciate their full power. When
we execute a normal mode action (delete, change, yank, etc.), we first type
the character of the desired action (i.e. 'y'). We are now in a state that Vim
referes to as operaotr-pending mode. In operator-pending mode, we have two
options: we can type a motion or a text object. One couldn't get by a days
worth of using vim without some basic understanding of motions. Motions take
our cursor from a given point to another point. 'l' takes us one character
forward, 'b' takes us one whole word backward, etc. Therefore, when we use
a motion after a normal mode action, we perform that action from the point
of the cursor till the end of the motion. By pressing 'dw' we delete from
point of the cursor till the beginning of the next word. So far, I'm sure that
everyone reading this post completely understands this process. What isn't
always as well understood, is how text objects work.

Need for Text Objects
---------------------

As mentioned previously operator-pending mode offers us two choices. One is to
type a motion as described above. The other is to type a text object. Let's
take a familiar scenario. With our cursor placed in the middle of a word, we
want to delete the entire word. We of course could move our cursor to the
beginnning of the word and then type 'dw'. Text objects take a different
approach and instruct vim to delete the entire word.

Text objects begin with either an 'i' or an 'a'. This makes sense in two ways.
First, in normal mode, 'i' and 'a' do not represent motions, we use them to
enter insert mode, so having them prefix text objects does not remove any
motions from our options. It makes no sense to enter insert mode in operatgor
pending mode, so we are losing zero functionality. Second, they serve as
useful mnemonics. 'i' stands for 'inside' and 'a' represents 'around'. We then
type the character that represents the 'object' upon which we want to perform
the action.

Word and WORD text objects
--------------------------

Nothing teaches like an example, so let's begin. Suppose we type 'yiw'.
The 'y' tells vim that we want to perform a yank (i.e. copy) action. The
'i' tells vim to perform that action inside of a text object. Finally, 'w'
tells vim that the text object is a word. Vim now yanks the entire word
upon which our cursor rests, regardless of where in the word our cursor is
positioned. Word boundaries are defined as they are for the 'w' motion. There
is a corresponding 'W' text object (i.e. 'yiW', 'diW', or 'caW') which defines
word boundaries as they are defined in the 'W' motion. For the purposes of
words and WORDS, the 'i' prefix ('iw' or 'iW') performs the action on the
object and leaves white space on both sides of the object. If we were to type
'a' (i.e. yaw, daW, caw, etc.), then the action would include the surrounding
whitespace.

```vim
" original line
the big brown do|g.

" we then type
ciw

" the result
the big brown |.

" if we instead type
daw

" we get
the big brown|.
```

Sentence and Paragraph text objects
-----------------------------------

Vim defines paragraphs as groups of text separated by blank lines. It can't get
any easier than that.

Sentences are a little more complex. The following is straight from the vim
documentation for the definition of a sentence:

    A sentence is defined as ending at a '.', '!' or '?' followed by either
    the end of a line, or by a space or tab. Any number of closing ')', ']',
    '"' and ''' characters may appear after the '.', '!' or '?' before the
    spaces, tabs or end of line. A paragraph and section boundary is also a
    sentence boundary. If the 'J' flag is present in 'cpoptions', at least two
    spaces have to follow the punctuation mark; <Tab>s are not recognized as
    white space. The definition of a sentence cannot be changed.

```vim
"original text
The big brown fox jumped over the lazy dog. He then |ran past a chick and a
deer. Finally, he rested!

" we then type
cis

" we end up with
The big brown fox jumped over the lazy dog. | Finally, he rested!

" if we insted type
das

" we get
The big brown fox jumped over the lazy dog. |Finally, he rested!
```

Quatation text objects
----------------------

We often use text objects to work on quotations. We frequently find ourselves
in the middle of a quote and decide that we need to perform an action on
the entire quote. Vim provides single-quote (i.e. '), double-quote ("), and
backtick-quote (\`) text objects. The "inside" (i.e. 'i') text object modifier
refers to the text between the two quotes. The "around" (i.e. 'a') text object
modifier includes the text and the quotation marks. This seems simple enough,
but remember, unlike word, sentence, and paragraph text objects, "around" in
this context does not include any whitespace outside of the quatation marks.

```vim
" original line
Mike said, "Hello f|riend"

" we then type
di"

" the result
Mike said, "|"

" if we instread type
ca"

" the result (notice the whitespace remains)
Mike said, |
```

Bracket and Parenthesis text objects
------------------------------------

The final category of text objects supported by vim (at least supported
natively), is brackets and parnethesis. These include '()', '{}', '[]', and
'<>'. These work similarly to quotation objects.

```vim
  " original line
function(a,|b,c)

" we then type
di( " or di)

" the result
function(|)

" if we instread type
da( " or da)

" the result
function|
```

Summary
-------

The longer we use vim, the more we appreciate text objects. The table below is
a reference to the available text objects.

| inside | arround | apply to     |
| ------ | ------- | ------------ |
| iw     | aw      | a word       |
| iW     | aW      | a WORD       |
| is     | as      | a sentence   |
| ip     | ap      | a paragraph  |
| i'     | a'      | a pair of '' |
| i''    | a''     | a pair of "" |
| i(     | a(      | a pair of () |
| i{     | a{      | a pair of {} |
| i[     | a[      | a pair of [] |
| i\<    | a\<     | a pair of <> |
