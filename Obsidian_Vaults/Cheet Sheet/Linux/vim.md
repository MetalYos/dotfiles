## Splitting VIM Screen
- To split vertically hit the following:
```
Ctrl + w -> v
```
- To split horizontally hit the following:
```
Ctrl + w -> s
```

## Navigating VIM split screens
- To go left hit the following:
```
Ctrl + w -> h
```
- To go right hit the following:
```
Ctrl + w -> l
```
- To go down hit the following:
```
Ctrl + w -> j
```
- To go up hit the following:
```
Ctrl + w -> k
```

## Find and replace
```
:[range]s/{pattern}/{string}/[flags] [count]
```
The command searches each line in `[range]` for a `{pattern}`, and replaces it with a `{string}`. `[count]` is a positive integer that multiplies the command.

If no `[range]` and `[count]` are given, only the pattern found in the current line is replaced. The current line is the line where the cursor is placed.

For example, to search for the first occurrence of the string ‘foo’ in the current line and replace it with ‘bar’, you would use:

```vi
:s/foo/bar/
```

To replace all occurrences of the search pattern in the current line, add the `g` flag:

```vi
:s/foo/bar/g
```

If you want to search and replace the pattern in the entire file, use the percentage character `%` as a range. This character indicates a range from the first to the last line of the file:

```vi
:%s/foo/bar/g
```

If the `{string}` part is omitted, it is considered as an empty string, and the matched pattern is deleted. The following command deletes all instances of the string ‘foo’ in the current line:

```vi
:s/foo//g
```

## Recording a macro
To record a macro and save it to a register, type the key **q** followed by a letter from **a** to **z** that represents the register to save the macro, followed by all commands you want to record, and then type the key **q** again to stop the recording.
```
q<register><commands>q
```

Because macros are saved into Vim registers, you can view saved macros by using the command **:reg** to see the content of all registers.
To view a specific register enter:
```
:reg <register>
```
For example to view `h` register, enter:
```
:reg h
```

To replay the macro once, move the cursor to the next line and press the following:
```
@<register>
```
For example, to replay the macro saved in the `h` register, enter the following:
```
@h
```

Finally, you can repeat the macro on all remaining lines by using Vim `number<COMMAND>` syntax.
For example, to execute the macro on the five next lines, press:
```
5@@
```
Or:
```
5@h
```