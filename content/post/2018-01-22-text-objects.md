---
title: Text Objects
author: ~
date: '2018-01-22'
slug: text-objects
categories: []
tags: [vim, neovim, text objects]
---

Text objects are a powerful feature of Vim. Yet many users, even some who have
used Vim for a long time, don't always fully appreciate their power. When we
execute a normal mode action (delete, change, yank, etc.), we first type the
character of the desired action (i.e. 'd'), then we have two options: we can
type a motion or a text object. It is impossible to get by a days worth of
using vim without some basic understanding of motions. Motions take our cursor
from a given point to another point. 'l' takes us one character forward, 'b'
takes us one whole word backward, etc. Therefore, when we use a motion after
a normal mode action, we perform that action from the point of the cursor
till the end of the motion. By pressing 'dw' we delete from point of the
cursor till the beginning of the next word. So far, I'm sure that everyone
reading this completely understands this process. What isn't always as well
understood, is how text objects work.

Need for Text Objects
---------------------

After typing a normal mode action, instead of typing a motion, we can type a
text object. Let's take a familiar scenario. With our cursor placed in the
middle of a word (or sentence, paragraph, etc.), we want to delete the entire
word (sentence, paragaph, etc.). We of course could move our cursor to the
beginnning of the word and then type 'dw'. Text objects take a different
approach and instruct vim to delete the entire word (sentence, paragraph,
etc.). Text objects begin with either an 'i' or an 'a'. This makes sense in
two ways. First, in normal mode, 'i' and 'a' do not represent motions, we use
them to enter insert mode, so having them prefix text objects does not remove
any motions from our options. Second, they serve as useful mnemonics. 'i'
stands for 'inside' and 'a' represents 'around'. We then type the character
that represents the 'object' upon which we want to perform the action.

Nothing teaches like an example, so let's begin. Suppose we type 'ciw'.
The 'c' tells vim that we want to perform a change action. The 'i' tells
vim to perform that action inside of a text object. Finally, 'w' tells vim
that the text object is a word. Vim now changes the entire word upon which
our cursor rests, regardless of where in the word our cursor is positioned.
Word boundaries are defined as they are for the 'w' motion. There is a
corresponding 'W' text object (i.e. 'ciW' or 'caW') which defines word
boundaries as they are defined in the 'W' motion. For the purposes of word and
WORDS, the 'i' prefix ('iw' or 'iW') prefix performs the action on the object
and leaves white space on both sides of the object.

```vim
" original line
the big brown do|g.

" we then type
diw

" the result
the big brown .

" if we instead type
daw

" we get
the big brown.
```

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
