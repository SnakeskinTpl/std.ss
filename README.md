std.ss
======

Standard library for [Snakeskin](https://github.com/SnakeskinTpl/Snakeskin).

## Install

```bash
npm install std.ss
```

## Examples

```js
- include 'node_module/std.ss/index'
- template myTemplate()
  - doctype
  < html
    < head
      - with std.html
        += @cdn('jquery@2', 'yandex')
        += @cdn('fontAwesome@4')
```
