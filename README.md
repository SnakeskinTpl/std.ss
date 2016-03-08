std.ss
======

Standard library for [Snakeskin](https://github.com/SnakeskinTpl/Snakeskin).

[![NPM version](http://img.shields.io/npm/v/std.ss.svg?style=flat)](http://badge.fury.io/js/std.ss)
[![NPM download](https://img.shields.io/npm/dm/std.ss.svg?style=flat)](http://badge.fury.io/js/std.ss)

## Install

```bash
npm install std.ss
```

## Examples

```js
- namespace myApp
- include 'std.ss/html'

- template myTemplate()
  - doctype
  < html
    < head
      - with std.html
        += @cdn('jquery@2', 'yandex')
        += @cdn('fontAwesome@4')
```
