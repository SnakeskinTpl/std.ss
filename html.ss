- namespace std.html

/*!
 * std.ss
 * https://github.com/SnakeskinTpl/std.ss
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/std.ss/blob/master/LICENSE
 */

/**
 * Add the specified library from CDN
 *
 * @param {string} name - library name with version (name@version), for example, jQuery@2
 * @param {string} [opt_provider] - name of the resource provider
 */
- template cdn(name, opt_provider) @= tolerateWhitespaces false
	- if !name
		- throw new Error('Missing a name of the requested library')

	: desc = name.split('@')
	- lib = desc[0]|lower
	- v = desc[1]

	- if !v
		- throw new Error('Missing a version of the requested library')

	- target {} as libraries
		* angularjs
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/angularjs/${v}/angular.min.js ))

				* yandex
					- script (( src = http://yastatic.net/angularjs/${v}/angular.min.js ))

		* bootstrap
			- target {}
				* maxcdn
					- link (( href = http://maxcdn.bootstrapcdn.com/bootstrap/${v}/css/bootstrap.min.css ))
					- script (( src = http://maxcdn.bootstrapcdn.com/bootstrap/${v}/js/bootstrap.min.js ))

				* yandex
					- link (( href = http://yastatic.net/bootstrap/${v}/css/bootstrap.min.css ))
					- script (( src = http://yastatic.net/bootstrap/${v}/js/bootstrap.min.js ))

		* dojo
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/dojo/${v}/dojo/dojo.js ))

				* yandex
					- script (( src = http://yastatic.net/dojo/${v}/dojo/dojo.js ))

		* extcore
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/ext-core/${v}/ext-core.js ))

				* yandex
					- script (( src = http://yastatic.net/ext-core/${v}/ext-core.min.js ))

		* fontawesome
			- target {}
				* maxcdn
					- link (( href = http://maxcdn.bootstrapcdn.com/font-awesome/${v}/css/font-awesome.min.css ))

		* jquery
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/jquery/${v}/jquery.min.js ))

				* yandex
					- script (( src = http://yastatic.net/jquery/${v}/jquery.min.js ))

		* jquerymobile
			- target {}
				* google
					- link (( href = http://ajax.googleapis.com/ajax/libs/jquerymobile/${v}/jquery.mobile.min.css ))
					- script (( src = http://ajax.googleapis.com/ajax/libs/jquerymobile/${v}/jquery.mobile.min.js ))

				* yandex
					- link (( href = http://yastatic.net/jquery/mobile/${v}/jquery.mobile.min.css ))
					- script (( src = http://yastatic.net/jquery/mobile/${v}/jquery.mobile.min.js ))

		* jqueryui
			- target {}
				* google
					- link (( href = http://ajax.googleapis.com/ajax/libs/jqueryui/${v}/themes/smoothness/jquery-ui.css ))
					- script (( src = http://ajax.googleapis.com/ajax/libs/jqueryui/${v}/jquery-ui.min.js ))

				* yandex
					- link (( href = http://yastatic.net/jquery-ui/${v}/themes/smoothness/jquery-ui.min.css ))
					- script (( src = http://yastatic.net/jquery-ui/${v}/jquery-ui.min.js ))

		* lodash
			- target {}
				* yandex
					- script (( src = http://yastatic.net/lodash/${v}/lodash.min.js ))

		* mootools
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/mootools/${v}/mootools-yui-compressed.js ))

				* yandex
					- script (( src = http://yastatic.net/mootools/${v}/mootools.min.js ))

		* prototype
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/prototype/${v}/prototype.js ))

				* yandex
					- script (( src = http://yastatic.net/prototype/${v}/prototype.min.js ))

		* script.aculo.us
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/scriptaculous/${v}/scriptaculous.js ))

				* yandex
					- script (( src = http://yastatic.net/scriptaculous/${v}/min/scriptaculous.js ))

		* swfobject
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/swfobject/${v}/swfobject.js ))

				* yandex
					- script (( src = http://yastatic.net/swfobject/${v}/swfobject.min.js ))

		* three.js
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/threejs/${v}/three.min.js ))

		* underscore.js
			- target {}
				* yandex
					- script (( src = http://yastatic.net/underscore/${v}/underscore-min.js ))

		* webfontloader
			- target {}
				* google
					- script (( src = http://ajax.googleapis.com/ajax/libs/webfont/${v}/webfont.js ))

	- block libraries() =>

	- if !libraries[lib]
		- throw new Error('The requested library "${name}" is not found'|tpl {name: lib})

	: putIn firstKey
		() => obj
			- forEach obj => el, key
				- return key

	{libraries[lib][opt_provider] || libraries[lib][firstKey(libraries[lib])]}
