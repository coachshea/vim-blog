---
title: Text Objects
author: ~
date: '2018-01-22'
slug: text-objects
categories: []
tags: []
---

Text objects are a very powerful feature of Vim. Yet many users, even some
who have used Vim for a long time, don't always fully appreciate their power.
When we execute a normal mode action (delete, change, yank, etc.), we first
type the character of the desired action (i.e. 'd'), then we have two options:
we can type a motion or a text object. It is impossible to get by a days worth
of using vim without some basic understanding of motions. Motions take our
cursor from a given point to another point. 'l' takes us one character to the
right, 'b' takes us one whole word to the left, etc. Therefore, when we use a
motion after a normal mode action, we perform that action from the point of the
cursor till the end of the motion. By pressing 'dw' we delete from point of the
cursor till the beginning of the next word. So far, I'm sure that everyone
reading this completely understands this process. What isn't always as well
understood, is how text objects work.

Need for Text Objects
---------------------

Let's take a familiar scenario. Our cursor is placed in the middle of a word (or
sentence, paragraph, etc.) and we want to delete the entire word (sentence,
paragaph, etc.). We of course could move our cursor to the beginnning of the
word and then type 'dw'.

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
